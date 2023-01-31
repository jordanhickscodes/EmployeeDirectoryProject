//
//  Constants.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/9/22.
//

import UIKit


struct Constants {
    static let baseAPIURL = "https://s3.amazonaws.com/"
    static let mainTitleheader = "Meet The Square Team"
    static let EmployeeProfileControllerName = "EmployeeProfileController"
    static let EmptyStateCell = "EmptyStateCell"
    static let noDataAvailibleString = "No Data Availible"
    static let networkAlertTitle = "There was a problem the with request"
    static let networkAlertActionTitle = "Resubmit Request"
    static let padding: CGFloat = 8
    static let placeholder = UIImage(named: "person.crop.rectangle.fill")
    static let employeeReuseId = "EmployeeProfileCollectionViewCell"
    static let getEmployees200Response =  "getEmployees200Response"
    static let getEmployeesResponseReqsNotMet = "fail"
    static let imageSuccesfullyCached = "Image Succesfully Cached"
    static let imageCacheKey = "Image Cache"
    static let testImage = "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg"
    static let emptyStateText = "Sorry the server has no employee data avalible. Please pull down to refresh later."
}
