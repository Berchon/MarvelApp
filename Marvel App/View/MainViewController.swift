//
//  MainViewController.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 07/01/22.
//

import UIKit

class MainViewController: UITabBarController, MyCollectionViewDelegate, MyFavoriteViewDelegate {
    
    override var nibName: String? {
        "MainViewController"
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var buttonReload: UIButton!
    @IBOutlet weak var charactersCollection: CharactersCollectionView!
    @IBOutlet weak var favoritesCollection: FavoritesCollectionView!
    
    var charactersData: [CharacterModel] = []
    var favoritesData: [CharacterModel] = []
    var comicsData: [ComicsSeriesModel] = []
    var seriesData: [ComicsSeriesModel] = []
    var offset: Int = 0
    var limit: Int = 20
    var total: Int = 0
    
    
    
    @IBAction func SearchButtonTapAction(_ sender: Any) {
        guard let startsWith = searchBar.text else { return }
        print(startsWith)
        self.offset = 0
        self.total = 0
        charactersData = []
        
        self.charactersCollection.setData(data: self.charactersData, total: self.total)

        self.charactersCollection.refreshData()
        
        loadCharactersData(nameStartsWith: startsWith)
    }
    
    @IBAction func reloadData(_ sender: Any) {
        self.offset = 0
        self.total = 0
        searchBar.text = ""
        charactersData = []
        
        self.charactersCollection.setData(data: self.charactersData, total: self.total)

        self.charactersCollection.refreshData()
        
        loadCharactersData()
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        navigationController?.navigationBar.topItem?.title = item.title
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersCollection.delegation = self
        favoritesCollection.delegation = self
        
        configureNavBar()
        
        loadFavoriteData()
        
        loadCharactersData()

        charactersCollection.setData(data: self.charactersData, total: 0)
        favoritesCollection.setData(data: self.favoritesData)
    }
    
    func loadFavoriteData() {
        favoritesCollection.setData(data: self.favoritesData)
        charactersCollection.setFavorites(data: self.favoritesData)
    }

    
    func loadCharactersData(nameStartsWith: String = "") {
        self.charactersCollection.refreshData()
        MarvelClient.getCharacters(offset: offset, limit: limit, startsWith: nameStartsWith) { results, error in
            if(results != nil){
                self.charactersData += (results?.data.results)!
                self.total = (results?.data.total)!
                
                DispatchQueue.main.async {
                    self.charactersCollection.setData(data: self.charactersData, total: self.total)
                    
                    self.total = (results?.data.total)!
                    self.charactersCollection.refreshData()
                }
            }
            else{
                self.charactersCollection.textStatus = "Error!"
            }
        }
    }

    
    func loadDetailsData(character: CharacterModel) {
        let id = character.id
            MarvelClient.getDetails(id: id, complementPath: "comics") { results, error in
                if(results != nil){
                    self.comicsData = (results?.data.results)!
                    
                    MarvelClient.getDetails(id: id, complementPath: "series") { results, error in
                        if(results != nil){
                            self.seriesData = (results?.data.results)!
                            
//                            DispatchQueue.main.async {
                                self.navigationController?.pushViewController(DetailsScrollViewController(character: character, comics: self.comicsData, series: self.seriesData), animated: true)
//                            }
                        }
                        else{
                            // Error
                        }
                    }
                }
                else{
                    // Error
                }
            }
            
            
        

        
    }
    
    func pushDetailsView(character: CharacterModel) {
        loadDetailsData(character: character)
//        DispatchQueue.main.async {
//            self.navigationController?.pushViewController(DetailsScrollViewController(character: character, comics: self.comicsData, series: self.seriesData), animated: true)
//        }
    }
    
    func loadMoreData() {
        self.offset += self.limit
        loadCharactersData()
    }
    
    
    func isFavoritedNow(favorite: CharacterModel) {
            if let index = self.favoritesData.firstIndex(where: {$0.id == favorite.id}) {
                self.removeFavorites(index: index)
                
                self.favoritesCollection.setData(data: self.favoritesData)
                self.charactersCollection.setFavorites(data: self.favoritesData)
                return
            }
            self.addFavorites(favorite: favorite)
            
            self.favoritesCollection.setData(data: self.favoritesData)
            self.charactersCollection.setFavorites(data: self.favoritesData)
            return

    }
    
    func removeFavorites(index: Int) {
        print("remove")
        self.favoritesData.remove(at: index)
        favoritesCollection.setData(data: self.favoritesData)
        charactersCollection.setFavorites(data: self.favoritesData)
    }
    
    func addFavorites(favorite: CharacterModel) {
        if let index = self.favoritesData.firstIndex(where: {$0.name > favorite.name}) {
            self.favoritesData.insert(favorite, at: index)
        }
        else {
            self.favoritesData.append(favorite)
        }
    }

    
    class func instantiateFromNib() -> UITabBarController {
        let nib = UINib(nibName: "MainViewController", bundle: nil)
        let vc = nib.instantiate(withOwner: nil, options: nil).first as! UITabBarController
        
        return vc
    }
    
    
    private func configureNavBar() {
        let firstTab = self.tabBar.items?.first
        let titleColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        
        navigationController?.navigationBar.topItem?.title = firstTab!.title
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: titleColor]
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = UIColor(red: 247/255, green: 207/255, blue: 70/255, alpha: 1)
    }

}
