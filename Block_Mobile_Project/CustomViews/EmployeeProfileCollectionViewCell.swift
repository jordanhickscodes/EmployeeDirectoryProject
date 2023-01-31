//
//  EmployeeProfileView.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/8/22.
//

import UIKit

class EmployeeProfileCollectionViewCell: UICollectionViewCell {
    
    static let reuseID: String  = Constants.employeeReuseId
    let padding = Constants.padding
    var employeeProfileImageView = EmployeeProfileImageView(frame: .zero)
    var employeeNameLabel = EmployeeNameLabel(frame: .zero)
    var employeeTypeLabel = EmployeeTypeLabel(frame: .zero)
    var employeeTeamLabel = EmployeeTeamLabel(frame: .zero)
    var employeeBioLabel = EmployeeBioLabel(frame: .zero)
    var employeeEmailAddressLabel = EmployeeEmailAddressLabel(frame: .zero)
    var employeeUuidLabel = EmployeeUuidLabel(frame: .zero)
    var activityView = ActivityIndicator(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        self.activityView.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(employeeData: Employee?) {
        
        DispatchQueue.main.async { [weak self] in
            if let employeeData = employeeData, let self = self {
                self.employeeNameLabel.configureData(employeeData: employeeData)
                self.employeeTypeLabel.configureData(employeeData: employeeData)
                self.employeeTeamLabel.configureData(employeeData: employeeData)
                self.employeeBioLabel.configureData(employeeData: employeeData)
                self.employeeEmailAddressLabel.configureData(employeeData: employeeData)
                self.employeeProfileImageView.fetchData(employeeData: employeeData)
                self.employeeUuidLabel.configureData(employeeData: employeeData)
                self.activityView.stopAnimating()
            }
        }
    }
    

    func configure() {
        
        self.addSubview(employeeProfileImageView)
        self.addSubview(activityView)
        self.addSubview(employeeNameLabel)
        self.addSubview(employeeTypeLabel)
        self.addSubview(employeeTeamLabel)
        self.addSubview(employeeBioLabel)
        self.addSubview(employeeEmailAddressLabel)
        self.addSubview(employeeUuidLabel)
        
        NSLayoutConstraint.activate([

            activityView.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            activityView.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityView.heightAnchor.constraint(equalToConstant: 20),
            activityView.widthAnchor.constraint(equalToConstant: 20),
            
            employeeProfileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            employeeProfileImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            employeeProfileImageView.heightAnchor.constraint(equalToConstant: 100),
            employeeProfileImageView.widthAnchor.constraint(equalToConstant: 100),
            
            employeeNameLabel.topAnchor.constraint(equalTo: employeeProfileImageView.bottomAnchor, constant: 20),
            employeeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            employeeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            employeeNameLabel.heightAnchor.constraint(equalToConstant: 20),

            employeeTypeLabel.topAnchor.constraint(equalTo: employeeNameLabel.bottomAnchor, constant: 1),
            employeeTypeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            employeeTypeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            employeeNameLabel.heightAnchor.constraint(equalToConstant: 20),

            employeeTeamLabel.topAnchor.constraint(equalTo: employeeTypeLabel.bottomAnchor, constant: 1),
            employeeTeamLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            employeeTeamLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            employeeTeamLabel.heightAnchor.constraint(equalToConstant: 20),

            employeeEmailAddressLabel.topAnchor.constraint(equalTo: employeeTeamLabel.bottomAnchor, constant: 1),
            employeeEmailAddressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            employeeEmailAddressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            employeeEmailAddressLabel.heightAnchor.constraint(equalToConstant: 20),

            employeeUuidLabel.topAnchor.constraint(equalTo: employeeEmailAddressLabel.bottomAnchor, constant: 1),
            employeeUuidLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            employeeUuidLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            employeeUuidLabel.heightAnchor.constraint(equalToConstant: 20),
            
            employeeBioLabel.topAnchor.constraint(equalTo: employeeUuidLabel.bottomAnchor, constant: 1),
            employeeBioLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            employeeBioLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            employeeBioLabel.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }
    
}
