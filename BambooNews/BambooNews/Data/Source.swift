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
    let description: String?
    let url: String?
    let category: String?
    let language: String?
    let country: String?
    
//    enum CodingKeys: String, CodingKey {
//        case id
//        case name
//    }
}
