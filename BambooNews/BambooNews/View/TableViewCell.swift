//
//  tableViewCell.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 10/3/21.
//

import UIKit
import Alamofire
import AlamofireImage


class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellTextView: UILabel!
 
    
    
    func configure(with article: Article) {
        
        
        self.cellTextView.text = article.title
        
        guard let url = URL(string: article.urlToImage ?? "no hi ha imatge") else { return }
        cellImageView.af.setImage(withURL: url)
        
        
    }
    
    
}


//\(indexPath.row + 1).- \(title)
