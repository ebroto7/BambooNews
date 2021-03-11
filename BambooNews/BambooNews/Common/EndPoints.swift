//
//  EndPoints.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 11/3/21.
//

import Foundation

enum Endpoints: String {
    
    case topHeadlines = "https://newsapi.org/v2/top-headlines"
    
    
    var url: String {
        return self.rawValue
    }
    
}
