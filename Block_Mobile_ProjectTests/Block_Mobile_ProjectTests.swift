//
//  Block_Mobile_ProjectTests.swift
//  Block_Mobile_ProjectTests
//
//  Created by Jordan Hicks on 3/9/22.
//

import XCTest
import Combine
import UIKit
@testable import Block_Mobile_Project

class  Block_Mobile_ProjectTests: XCTestCase {
    private var disposeBag = Set<AnyCancellable>()
    
    
    private var getEmployeesMockAPI: MockAPI {
        let mockApi = MockAPI(baseUrlString: Constants.getEmployees200Response)
        return mockApi
    }
    
    private var getFailureEmployeesMockAPI: MockAPI {
        let mockApi = MockAPI(baseUrlString: Constants.getEmployeesResponseReqsNotMet)
        return mockApi
    }
    
    override func setUp() {
        super.setUp()
    }
    
    
    func test_get_employees_failure() {
        
        let collectionView = EmployeeDirectoryCollectionView(frame: .zero)
        
        let expectation = expectation(
            description: "when the api is unsuccessfully called than the employeeDirectoryTableData should remain empty")
        
        var iterator = 0
        
        collectionView
            .$employeeDirectoryTableData
            .sink { env in
                switch iterator {
                case 0:
                    XCTAssertTrue(env.count == 0)
                    expectation.fulfill()
                default:
                    XCTFail("Too many iterations")
                }
                
                iterator += 1
            }
            .store(in: &disposeBag)
        
        wait(for: [expectation], timeout: 0.1)
    }
    
    func test_set_cache_data() {
        
        let expectation = expectation(description: "Make sure cache is set properly")
        
        let serialQueue = DispatchQueue(label: "")
        
        serialQueue.sync {
           
            CahceManager.removeImage(urlString: Constants.testImage)
            
            if case.success(_) = CahceManager.loadImage(urlString: Constants.testImage) {
                XCTFail()
            }
            
            if case.failure(_) = CahceManager.storeImage(image: UIImage(named: "square")!, urlString: Constants.testImage) {
                XCTFail()
            }
            
            
            if case.failure(_) =  CahceManager.loadImage(urlString: Constants.testImage) {
                XCTFail()
            } else {
                expectation.fulfill()
            }
            
            wait(for: [expectation], timeout: 0.1)
            
        }
        
    }
    
    func test_get_employees_success() {
        
        let collectionView = EmployeeDirectoryCollectionView(frame: .zero)
        
        let expectation = expectation(
            description: "when the api is successfully called than the employeeDirectoryTableData should be updated with data")
        
        var iterator = 0
        
        collectionView
            .$employeeDirectoryTableData
            .sink { employees in
                switch iterator {
                case 0:
                    XCTAssertTrue(employees.count == 0)
                case 1:
                    XCTAssertTrue(employees.count == 11)
                    expectation.fulfill()
                default:
                    XCTFail("Too many iterations")
                }
                
                iterator += 1
            }
            .store(in: &disposeBag)
        
        wait(for: [expectation], timeout: 5)
    }
}



