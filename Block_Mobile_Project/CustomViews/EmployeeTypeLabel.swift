//
//  label.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/8/22.
//

import Foundation


import UIKit

class EmployeeTypeLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        text = Constants.noDataAvailibleString
        textColor = .white
        textAlignment = .center
        numberOfLines = 2
        font = UIFont.boldSystemFont(ofSize: 15.0)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureData(employeeData: Employee?) {
        text = employeeData?.employee_type ?? Constants.noDataAvailibleString
    }
}



