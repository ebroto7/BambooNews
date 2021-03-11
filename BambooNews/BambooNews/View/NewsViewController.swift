//
//  NewsViewController.swift
//  
//
//  Created by Enric Broto Hernandez on 10/3/21.
//

import UIKit
import Alamofire
import AlamofireImage



class NewsViewController: UITableViewController {
    
    
    let reuseIndetifier = "reuseIndetifier"
    
    let newsManager = NewsManager()
    var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "Cell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: reuseIndetifier)
        
      
        
        newsManager.fetchHeadlines(countryId: CountryTipe.france) { (news) in
            self.articles = news.articles    //estem guardant a articles la informació descarregada   //de tota la informació que es descarrega a "news" nomes vull els "articles" per això news.article
            self.tableView.reloadData()
            print("num de noticies: \(news.totalResults)")
        } failure: { (error) in
            print("error")
        }
        
        
        
        
        print("hola!!")
    }
    
}


extension NewsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //       per veure el número de indexPath
        let indexPath = indexPath
        print("has clicat la fila: \(indexPath)")
    }
}

extension NewsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let title = self.articles?[indexPath.row].title ?? "sense noticia"
        
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIndetifier, for: indexPath)
        if let picturesCell = cell as? TableViewCell {
            if let article = articles?[indexPath.row] {
                picturesCell.configure(with: article)
            }
//            picturesCell.cellTextView.text = "\(indexPath.row + 1).- \(title)"

            return picturesCell
        } else {
            return cell
        }
    }
    
    
}
