//
//  EmployeeDirectoryCollectionViewController.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/8/22.
//


import Foundation
import UIKit

class EmployeeDirectoryCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @Published var employeeDirectoryTableData = [Employee]()
    var refresherController = RefresherController(frame: .zero)
    let api = NetworkManager.shared
    let emptyStateView = EmptyStateView()
   
    init(frame: CGRect = .zero) {
        super.init(frame: frame, collectionViewLayout: UICollectionViewLayout())
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        refresherController.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        self.refreshControl = refresherController
        
        register(EmployeeProfileCollectionViewCell.self, forCellWithReuseIdentifier: Constants.EmployeeProfileControllerName)
        self.collectionViewLayout = UIHelper.createTableViewColumnFlowLayout(in: self)
        backgroundColor = .black
        layer.cornerRadius = 8
        translatesAutoresizingMaskIntoConstraints = false
    
        addSubview(emptyStateView)
        emptyStateView.translatesAutoresizingMaskIntoConstraints = false
        emptyStateView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        emptyStateView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        self.delegate = self
        self.dataSource = self
        fetchData()
        
    }
    
    func fetchData() {
        api.fetchCodable(requestable: getEmployeesRequest()) { [self] result in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                switch result {
                case .success(let success):
                    if success.employees.count == 0 {
                        self.emptyStateView.isHidden = false
                    } else {
                        self.emptyStateView.isHidden = true
                    }
                    self.employeeDirectoryTableData = success.employees
                    self.reloadData()
                    self.refresherController.endRefreshing()
                case .failure(let failure):
                    self.refresherController.endRefreshing()
                    if let error = failure as? Errors, let rootViewController = self.window?.rootViewController {
                        UIHelper.presentNetworkUIAlert(message: error.rawValue, action: nil, viewController: rootViewController)
                    }
                }
            }
        }
    }
    
    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        fetchData()
     }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return employeeDirectoryTableData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.EmployeeProfileControllerName, for: indexPath) as? EmployeeProfileCollectionViewCell {
            cell.set(employeeData: employeeDirectoryTableData[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
}
