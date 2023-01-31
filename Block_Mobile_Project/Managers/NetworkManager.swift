//
//  File.swift
//  Block_Mobile_Project
//
//  Created by Jordan Hicks on 3/8/22.
//

import Foundation
import UIKit

class NetworkManager {
    
    static var shared = NetworkManager()
    
    public func fetchCodable<T: Requestable>(requestable: T, completion: @escaping (Result<T.SuccessModel, (Error)>) -> (Void)) {
        
        guard let url = URL(string: Constants.baseAPIURL + requestable.endpoint) else  {
            completion(.failure(Errors.badURL))
            print(Errors.badURL.rawValue)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(Errors.badResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(Errors.badData))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(T.SuccessModel.self, from: data)
                completion(.success(response))
            }
            
            catch { completion(.failure(Errors.unableToParseData)) }
        }
        
        task.resume()
    }
    
    public func fetchImage(imageUrlString: String, completion: @escaping (UIImage) -> (Void)) {
        
        let cachedImage = CahceManager.loadImage(urlString: imageUrlString)
        
        if case .success(let image) = cachedImage {
            completion(image)
            return
        } else if case .failure(let error) = cachedImage{
            if let error = error as? Errors {
                print(error.rawValue)
            }
        }
        
        guard let url = URL(string: imageUrlString) else  {
            return
        }
        
        let urlRequest = URLRequest(url:url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [] data, response, error in
            
            if error != nil {
                print(error?.localizedDescription ?? Errors.requestReturnedAnError)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print(Errors.badResponse)
                return
            }
            
            guard let data = data else {
                print(Errors.badData)
                return
            }
            
            guard let image = UIImage(data: data) else {
                print(Errors.dataReturnedNotUIImageCompatible)
                return
            }
            
            let storedResult = CahceManager.storeImage(image: image, urlString: imageUrlString)
            if case .success(_) = storedResult {
                print(Constants.imageSuccesfullyCached)
            } else if case .failure(let error) = storedResult {
                if let error = error as? Errors {
                    print(error.rawValue)
                }
            }
            
            completion(image)
            return
        
    }
    task.resume()
}
}
