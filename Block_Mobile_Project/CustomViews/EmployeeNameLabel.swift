//
//  employeeNameLabel.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/8/22.
//

import UIKit

class EmployeeNameLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        textColor = .white
        numberOfLines = 2
        textAlignment = .center
        font = UIFont.boldSystemFont(ofSize: 15.0)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureData(employeeData: Employee?) {
        text = employeeData?.full_name ?? Constants.noDataAvailibleString
    }
}
