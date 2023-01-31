//
//  FileManagerHelper.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/13/22.
//

import Foundation

extension FileManager {
    
    func getImageCachePath(imageId: String) -> URL? {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return path?.appendingPathComponent(imageId)
    }
}

extension URL {
    
    func generatePhotoNameFromURL() -> String? {
    
        let componets = self.pathComponents
        
        if componets.count > 2 {
            return componets[componets.count - 2] + componets[componets.count - 1]
        }
        
        return nil
    }
    
}
