//
//  getEmployees.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/9/22.
//

import Foundation

struct getEmployeesRequest: Requestable {
    typealias SuccessModel = Employees
    var endpoint = "sq-mobile-interview/employees.json"
}
