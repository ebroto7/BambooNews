//
//  Article.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 11/3/21.
//

import Foundation


struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
 
    
    //no cal possar la enum perque els noms coincideixen
//    enum CodingKeys: String, CodingKey {
//        case source
//        case author
//        case title
//        case description
//        case url
//        case urlToImage
//        case publishedAt
//        case content
//    }
    
    var publishedAtFormatted: String {

            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")    //el JSON ens envia les dades en aquest format
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"         //especifico el format amb que m'arriben les dades
            if let date = dateFormatter.date(from: publishedAt) {       //genera un objecte "date" a partir del publishedAt
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MMM-YY"                  // li donem un format de sortida
                return dateFormatter.string(from: date)                 // retorna un "date" en format string 
            } else {
                return publishedAt
            }
        }
    
}
