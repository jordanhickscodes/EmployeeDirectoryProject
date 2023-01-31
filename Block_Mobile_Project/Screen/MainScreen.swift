//
//  EmployeeDirectory.swift
//  Block_Mobile_Project
//
//  Created by Jordan Hicks on 3/7/22.
//

import UIKit

class MainScreen: UIViewController {
    
    private var employeeDirectoryCollectionViewController = EmployeeDirectoryCollectionView()
    
    init(frame: CGRect) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        title = Constants.mainTitleheader
        view.backgroundColor = .black
        view.addSubview(employeeDirectoryCollectionViewController)
    }
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate([
            employeeDirectoryCollectionViewController.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            employeeDirectoryCollectionViewController.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            employeeDirectoryCollectionViewController.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.99),
            employeeDirectoryCollectionViewController.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.99)
        ])
    }
}
