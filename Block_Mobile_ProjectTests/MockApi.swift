//
//  MockApi.swift
//  Block_Mobile_ProjectTests
//
//  Created by E72778 on 12/12/22.
//

import XCTest
import Foundation

@testable import Block_Mobile_Project

class MockAPI: NetworkManager {
    
    let baseUrlString: String
    
    init(baseUrlString: String) {
        self.baseUrlString = baseUrlString
    }
    
    override func fetchCodable<T: Requestable>(requestable: T, completion: @escaping (Result<T.SuccessModel, (Error)>) -> (Void)) {
        
            guard let path = Bundle.main.path(forResource: baseUrlString, ofType: "json") else {
                completion(.failure(Errors.badURL))
                return
            }
            
            guard let data =  try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
                completion(.failure(Errors.badData))
                return
            }
            
            guard let response = try? JSONDecoder().decode(T.SuccessModel.self, from: data) else {
                completion(.failure(Errors.unableToParseData))
                return
            }
            
            completion(.success(response))
            return
    }
}
