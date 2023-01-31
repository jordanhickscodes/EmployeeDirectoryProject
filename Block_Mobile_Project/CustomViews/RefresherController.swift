//
//  RefresherController.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/12/22.
//

import Foundation
import UIKit

class RefresherController: UIRefreshControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     func configureView () {
        tintColor =  UIColor.blue
    }
    
}
