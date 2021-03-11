//
//  ApiError.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 11/3/21.
//

import Foundation
import Alamofire

struct ApiError: Decodable {
    let status: String
    let code: String
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case status
        case code
        case message
    }
}
