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
    var offset: Int = 0
    var limit: Int = 20
    var total: Int = 0
    
    
    @IBAction func reloadData(_ sender: Any) {
        self.offset = 0
        self.total = 0
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
        
//        loadFavoriteData()
        
        loadCharactersData()

//        let data: [String] = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸", "10 🍖", "11 🐯", "12 🌋"]
        
        charactersCollection.setData(data: self.charactersData, total: 0)
        favoritesCollection.setData(data: self.favoritesData)
    }
    
    func loadFavoriteData() {
        //apagar a definicao de favotitos (provisório) da funcao loadCharactersData
        //tirar comentário da chamada dessa função no viewDidLoad
        
//        self.favoritesData.append(charactersData[0])
//        self.favoritesData.append(charactersData[5])
//        self.favoritesData.append(charactersData[6])
//        self.favoritesData.append(charactersData[19])
        
        favoritesCollection.setData(data: self.favoritesData)
        charactersCollection.setFavorites(data: self.favoritesData)
    }

    
    func loadCharactersData() {
        self.charactersCollection.refreshData()
        MarvelClient.getCharacters(offset: offset, limit: limit, startsWith: "") { results, error in
            if(results != nil){
                
                self.charactersData += (results?.data.results)!
                
                self.total = (results?.data.total)!
                DispatchQueue.main.async {
//                    self.charactersCollection.textStatus = "Loading character..."
                    self.charactersCollection.setData(data: self.charactersData, total: self.total)
//                    self.charactersData += (results?.data.results)!
                    
//                    self.loadFavoriteData()
                    
                    self.total = (results?.data.total)!
//                    self.charactersCollection.textStatus = self.total < 1 ? "Not found character." : ""
                    self.charactersCollection.refreshData()
                }
            }
            else{
                self.charactersCollection.textStatus = "Error!"
            }
        }
    }
    
    func loadMoreData() {
        self.offset += self.limit
        loadCharactersData()
    }
    
    func pushDetailsView() {
        navigationController?.pushViewController(DetailsScrollViewController(), animated: true)
    }
    
    
    func isFavoritedNow(favorite: CharacterModel) {
        print("aqui")
//        DispatchQueue.main.async {
            if let index = self.favoritesData.firstIndex(where: {$0.id == favorite.id}) {
                self.removeFavorites(index: index)
                
                self.favoritesCollection.setData(data: self.favoritesData)
                self.charactersCollection.setFavorites(data: self.favoritesData)
                return //false
            }
            self.addFavorites(favorite: favorite)
            
            print("addfavo")
//            self.charactersCollection.refreshData()
            self.favoritesCollection.setData(data: self.favoritesData)
            self.charactersCollection.setFavorites(data: self.favoritesData)
//            self.charactersCollection.refreshData()
            return //true
//        }
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
//            favoritesCollection.setData(data: self.favoritesData)
//            charactersCollection.setFavorites(data: self.favoritesData)
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
