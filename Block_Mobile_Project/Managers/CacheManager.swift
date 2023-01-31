//
//  CacheManager.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/12/22.
//

import UIKit
import Foundation

enum CahceManager {
    
    static let defaults = UserDefaults.standard
    
    static let imageCacheKey = Constants.imageCacheKey
    
    static func storeImage(image: UIImage, urlString: String) -> Result<String, (Error)> {
    
        guard let url = URL(string: urlString) else {
            return .failure(Errors.badURL)
        }
            
        guard let imageId = url.generatePhotoNameFromURL() else {
            return .failure(Errors.badURL)
        }
        
        guard let filePathOfImageData = FileManager().getImageCachePath(imageId: imageId) else {
            return .failure(Errors.unableToGenerateFilePath)
        }
        
        var userDefaultsDictionary = defaults.object(forKey: CahceManager.imageCacheKey) as? [String:String] ?? [String:String]()
       
        guard let data = image.jpegData(compressionQuality: 0.8) else {
            return .failure(Errors.unableToCompressData)
        }
        
        do {
            try data.write(to: filePathOfImageData)
            userDefaultsDictionary[urlString] = imageId
            defaults.set(userDefaultsDictionary, forKey: CahceManager.imageCacheKey)
            return .success(imageId)
        } catch {
            return .failure(Errors.unableTowriteDataToUrl)
        }
        
    }
    
    static func loadImage(urlString: String) -> Result<UIImage, (Error)> {
 
        guard let userDefaultsDictionary = defaults.object(forKey: CahceManager.imageCacheKey) as? [String:String] else {
            return .failure(Errors.noImageCacheAvalible)
        }
        
        guard let imageId = userDefaultsDictionary[urlString] else {
            return .failure(Errors.noImageCacheAvalible)
        }
        
        guard let filePathOfImageData = FileManager().getImageCachePath(imageId: imageId) else {
            return .failure(Errors.unableToGenerateFilePath)
        }
        
        guard let data = try? Data(contentsOf: filePathOfImageData) else {
            return .failure(Errors.unableTowriteDataToUrl)
        }
        
        guard let uiImage = UIImage(data: data) else {
            return .failure(Errors.dataReturnedNotUIImageCompatible)
        }
        
        return .success(uiImage) 
        
    }
    
     static func removeImage(urlString: String) -> Result<String, (Error)> {
        
         guard var userDefaultsDictionary = defaults.object(forKey: CahceManager.imageCacheKey) as? [String:String] else {
             return .failure(Errors.noImageCacheAvalible)
         }
         userDefaultsDictionary[urlString] = nil
         defaults.set(userDefaultsDictionary[urlString], forKey: CahceManager.imageCacheKey)
         return .success(urlString + "removed from cache")
    }
}
