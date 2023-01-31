//
//  UIHelper.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/14/22.
//

import Foundation
import UIKit

enum UIHelper {
    static func createTableViewColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing   = 5
        flowLayout.itemSize             = CGSize(width: 500, height: 280)
        return flowLayout
    }
    
    static func presentNetworkUIAlert( message: String, action: ()?, viewController: UIViewController) {

        let alert = UIAlertController(
            title: Constants.networkAlertTitle,
            message: message,
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: Constants.networkAlertActionTitle,
                style: .default,
                handler: { _ in action })
        )
        viewController.present(alert, animated: true, completion: nil)
    }
}
