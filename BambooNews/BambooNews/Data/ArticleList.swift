//
//  ArticleList.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 11/3/21.
//

import Foundation
import Alamofire

struct ArticleList: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
}
