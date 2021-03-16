//
//  SourcesList.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 15/3/21.
//

import Foundation
import Alamofire

struct SourcesList: Decodable {
    let status: String
    let sources: [Source]
}
