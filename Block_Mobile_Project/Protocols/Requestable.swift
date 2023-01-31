//
//  Requestable.swift
//  Block_Mobile_Project
//
//  Created by E72778 on 12/9/22.
//

import Foundation
import UIKit

protocol Requestable: Equatable {
    associatedtype SuccessModel: Decodable
    var endpoint: String { get }
}
