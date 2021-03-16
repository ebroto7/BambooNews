//
//  DetailNewsViewController.swift
//  BambooNews
//
//  Created by Enric Broto Hernandez on 12/3/21.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class DetailNewsViewController: UIViewController {
    
    
    @IBOutlet weak var TitularLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    
    @IBAction func goToInternetButton(_ sender: Any) {
        
        guard let url = NewsViewModel.selectedIndex?.url else { return }
        print("\(url)")
        
        if let url = URL(string: url) {
            UIApplication.shared.open(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = NewsViewModel.selectedIndex?.source.name
        
        
        TitularLabel.text = NewsViewModel.selectedIndex?.title
        authorLabel.text = NewsViewModel.selectedIndex?.author ?? "-"
        dateLabel.text = NewsViewModel.selectedIndex?.publishedAtFormatted
//        newsLabel.text = NewsViewModel.selectedIndex?.description
       
        
        guard let url = URL(string: NewsViewModel.selectedIndex?.urlToImage ?? "no hi ha imatge") else { return }
        newsImageView.af.setImage(withURL: url)
        
        
        let idToSearch = NewsViewModel.selectedIndex?.source.id
        var fontTrobada: Source?
        
        
        if let llistatSources = NewsViewModel.sourcesList?.sources {
            for font in llistatSources {
                if idToSearch == font.id {
                     fontTrobada = font
                }
            }
        }
        
        let soureceDescription: String = "\(NewsViewModel.selectedIndex?.description ?? "hola")\n\n\(NewsViewModel.selectedIndex?.source.name ?? "sense font") \n \(fontTrobada?.description ?? "Sense info de la font")"
        
        newsLabel.text = soureceDescription
    }
    
}
