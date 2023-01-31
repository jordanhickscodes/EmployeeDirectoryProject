//
//  Employee.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/7/22.
//

import Foundation

struct Employee: Codable  {
    let uuid: String
    let full_name: String
    let phone_number: String
    let email_address: String
    let biography: String
    let photo_url_small: String
    let photo_url_large: String
    let team: String
    let employee_type: String
}
