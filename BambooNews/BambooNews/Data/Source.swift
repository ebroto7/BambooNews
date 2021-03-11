//
//  Source.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 11/3/21.
//

import Foundation
import Alamofire

struct Source: Decodable {
    let id: String?
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}
