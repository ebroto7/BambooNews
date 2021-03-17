//
//  CountryTipe.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 11/3/21.
//

import Foundation


enum CountryTipe: String, CaseIterable {        //caseIterable => puc fer un bucle amb la enum
    case mexico = "mx"
    case unitedStates = "us"
    case greatBretain = "gb"
    case france = "fr"
    case venezuela = "ve"
    
    
    var name: String {
        switch self {
        
        case .mexico:
           return "Mx"
        case .unitedStates:
            return "USA"
        case .greatBretain:
            return "GB"
        case .france:
            return"Fr"
        case .venezuela:
            return "Ven"
        }
        
    }
}
