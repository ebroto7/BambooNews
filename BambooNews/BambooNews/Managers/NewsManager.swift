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
        
        let parameters: [String:String] = [EndpointParameter.countryId.rawValue: countryId.rawValue, EndpointParameter.apikey.rawValue: apiKeyValue]         //els paràmetres me'ls dona la documentació!!
        //https://newsapi.org/v2/top-headlines?country=us&apiKey=API_KEY => ?country=us&apiKey=API_KEY l'interrogant indica l'inici dels paràmetres => d'aqui treiem els dos parametres "q" i "apiKey"
        
        AF.request(url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { response in
        
            print("3. Request finished")
            guard let articleList: ArticleList = response.value else { return }
            
            succes(articleList)
            
            
        }
        
        print("2. Fetch data method finishes")
        
    }
    
    func fetchEverything(search: String,
                         succes: @escaping (ArticleList) -> (),
                         failure: @escaping (ApiError) -> () ) {
        
        print("1- Start search")
        
        let url = Endpoints.everything.url
        
//      let parameters: [String: String] = ["q": search, "apikey": apiKeyValue]
        let parameters: [String: String] = [EndpointParameter.search.rawValue: search, EndpointParameter.apikey.rawValue: apiKeyValue]
        
        //els paràmetres me'ls dona la documentació!!
        //https://newsapi.org/v2/everything?q=bitcoin&apiKey=API_KEY => ?q=bitcoin&apiKey=API_KEY l'interrogant indica l'inici dels paràmetres => d'aqui treiem els dos parametres "q" i "apiKey"
        
        AF.request(url, parameters: parameters).validate().responseDecodable(of: ArticleList.self) { response in
            print("3. Search Finished")
            guard let articleList: ArticleList = response.value else { return }
            
            succes(articleList)
            
        }
        
        print("2. Search method finishes")
    }
    
    func fetchSources( succes: @escaping (SourcesList) -> (),
                       failure: @escaping (ApiError) -> () ) {
    
        let url = Endpoints.sources.url
        let parameters = [EndpointParameter.apikey.rawValue: apiKeyValue]
        
        AF.request(url, parameters: parameters).validate().responseDecodable(of: SourcesList.self) { (response) in
            guard let sources: SourcesList = response.value else { return }
            
            
            succes(sources)
        }
        
    }
}
