//
//  EmployeeLabel.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/8/22.
//

import UIKit

class EmployeeTeamLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView(frame: CGRect) {
        textColor = .systemGray
        textAlignment = .center
        numberOfLines = 2
        font = UIFont.boldSystemFont(ofSize: 15.0)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureData(employeeData: Employee?) {
        text = employeeData?.team ?? Constants.noDataAvailibleString
    }
}
