//
//  EmployeeProfileImageVIew.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/8/22.
//

import UIKit

class EmployeeProfileImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews()  {
        self.layer.cornerRadius = self.bounds.height/2
    }
    
    func configureView() {
        backgroundColor = .gray
        clipsToBounds = true
        image = Constants.placeholder   
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func fetchData(employeeData: Employee) {
        NetworkManager.shared.fetchImage(imageUrlString: employeeData.photo_url_small) { [self] employeeImage in
                DispatchQueue.main.async { [self] in
                    image = employeeImage
                }
        }
    }
}
