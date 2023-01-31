//
//  Errors.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/11/22.
//

import Foundation

enum Errors: String, LocalizedError {
    case badURL = "The URL constructed is not in the right format"
    case badData = "The request returned invalid data"
    case unableToParseData = "The data returned was unable to be parsed"
    case badResponse = "Bad response"
    case requestReturnedAnError = "Request Returned An Error"
    case networkError = "Network Error"
    case unableToCompressData = "UIImage was unable to be compressed"
    case unableTowriteDataToUrl = "Unable to write data to Url"
    case dataReturnedNotUIImageCompatible = "The data returned from the request cannot be converted into an UIImage"
    case noImageCacheAvalible = "No Image Cache is Avalible"
    case unableToGenerateFilePath = "Unable To Generate FilePath"
}
