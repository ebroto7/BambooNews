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
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var segmentedContryId: UISegmentedControl!
    
    @IBAction func segmentCountryIdButton(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        let countrySelected: CountryTipe = CountryTipe.allCases[selectedIndex]
        
        
        newsManager.fetchHeadlines(countryId: countrySelected) { (news) in
            self.articles = news.articles    //estem guardant a articles la informació descarregada   //de tota la informació que es descarrega a "news" nomes vull els "articles" per això news.article
            self.tableView.reloadData()
            print("num de noticies: \(news.totalResults)")
        } failure: { (error) in
            print("error")
        }
        
        
    }
    let reuseIndetifier = "reuseIndetifier"
    
    let newsManager = NewsManager()
    var articles: [Article]?            //variable en la que guardem la info que ens descarreguem de la API, per poder utlitzar-ho en tot el projecte
    var sources: SourcesList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "Cell", bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: reuseIndetifier)
        

        
        
        
        newsManager.fetchSources() { (sources) in
            
            print(sources)
        } failure: { (error) in
            print("error")
        }
        
        
        setupSegmentedControl()
        loadFirstCountryNews()
        
        
    }
    
    func selectedCountryNews() {
        
        var selectedCountryId = CountryTipe.mexico
        
        if segmentedContryId.selectedSegmentIndex == 0 {
            selectedCountryId = CountryTipe.france
        } else if segmentedContryId.selectedSegmentIndex == 1 {
            selectedCountryId = CountryTipe.mexico
        } else if segmentedContryId.selectedSegmentIndex == 2 {
            selectedCountryId = CountryTipe.greatBretain
        } else if segmentedContryId.selectedSegmentIndex == 3 {
            selectedCountryId = CountryTipe.unitedStates
        }
        
        
        
        newsManager.fetchHeadlines(countryId: selectedCountryId) { (news) in
            self.articles = news.articles    //estem guardant a articles la informació descarregada   //de tota la informació que es descarrega a "news" nomes vull els "articles" per això news.article
            self.tableView.reloadData()
            print("num de noticies: \(news.totalResults)")
        } failure: { (error) in
            print("error")
        }
        
    }
    func setupSegmentedControl() {
        let countryList = CountryTipe.allCases
        segmentedContryId.removeAllSegments()
        var position: Int = 0
        for country in countryList {
            position += 1
            segmentedContryId.insertSegment(withTitle: "\(country.name)", at: position, animated: true)
            
        }
    }
    func loadFirstCountryNews() {
        let countryIndex = 0
        segmentedContryId.selectedSegmentIndex = countryIndex
        let countryId = CountryTipe.allCases[countryIndex]
        newsManager.fetchHeadlines(countryId: countryId) { (news) in
            self.articles = news.articles    //estem guardant a articles la informació descarregada   //de tota la informació que es descarrega a "news" nomes vull els "articles" per això news.article
            self.tableView.reloadData()
            print("num de noticies: \(news.totalResults)")
        } failure: { (error) in
            print("error")
        }

    }
    
}


extension NewsViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //       per veure el número de indexPath
        let indexPath = indexPath
        
        print("has clicat la fila: \(indexPath)")
        
        
        //per traspasar la informació entre pantalles (principal i detall)
        let article: Article? = articles?[indexPath.row]       // guardem en una constant l'article seleccionat
        NewsViewModel.selectedIndex = article       //  guardem al NewsViewModel l'article seleccionat
        
        if let sour: SourcesList = sources {
            NewsViewModel.sourcesList? = sour
        }
        
        performSegue(withIdentifier: "goToDetail", sender: nil)     //enllacem pantalles per poder portar la info
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
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
    //    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    //        return 80
    //    }
    
}


extension NewsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        newsManager.fetchEverything(search: searchTextField.text ?? "") { (news) in
            self.articles = news.articles
            self.tableView.reloadData()
            print("numero de noticies: \(news.totalResults)")
        } failure: { (error) in
            print("error")
        }
        
        searchTextField.becomeFirstResponder()
        
        return true
    }
    
}
