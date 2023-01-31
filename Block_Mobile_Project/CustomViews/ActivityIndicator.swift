//
//  activityIndicator.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/7/22.
//

import Foundation
import UIKit

class ActivityIndicator: UIActivityIndicatorView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        hidesWhenStopped = true
        color = .white
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
    }
}

