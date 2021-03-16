//
//  EndPoints.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 11/3/21.
//

import Foundation

enum Endpoints: String {
    
    case topHeadlines = "https://newsapi.org/v2/top-headlines"
    case everything = "https://newsapi.org/v2/everything"
    case sources = "https://newsapi.org/v2/sources"
  
    
    
    
    var url: String {
        return self.rawValue
    }
    
}


enum EndpointParameter: String {
    case search = "q"
    case apikey = "apikey"
    case countryId = "country"
}
