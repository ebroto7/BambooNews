//
//  NewsManager.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 11/3/21.
//

import Foundation
import Alamofire

struct NewsManager {
    let apiKeyValue: String = "52a947bcb8034cebb623beabf333bc2a"
    
    func fetchHeadlines(countryId: CountryTipe, succes: @escaping (ArticleList) -> (), failure: @escaping (ApiError) -> () ) {
        
        //            textView.text = ""
        
        print("1. Request start")
        
        let url = Endpoints.topHeadlines.url
        
        let parameters: [String:String] = ["country": countryId.rawValue, "apiKey": apiKeyValue]
        
        AF.request(url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { response in
        
            print("3. Request finished")
            guard let articleList: ArticleList = response.value else { return }
            
            succes(articleList)
            
            
        }
        
        print("2. Fetch data method finishes")
        
    }
    
}
