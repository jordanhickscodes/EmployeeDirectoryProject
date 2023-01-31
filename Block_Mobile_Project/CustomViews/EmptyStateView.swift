//
//  ErrorStateView.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 1/25/23.
//

import UIKit

class EmptyStateView: UIView {
    
    var title = UILabel()
 

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        title.text = Constants.emptyStateText
        title.numberOfLines = 3
        title.textColor = .white
        title.backgroundColor = .gray
        addSubview(title)
        backgroundColor = .black
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}

