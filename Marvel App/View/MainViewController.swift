//
//  MainViewController.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 07/01/22.
//

import UIKit

class MainViewController: UITabBarController {
    
    override var nibName: String? {
        "MainViewController"
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var buttonReload: UIButton!
    @IBOutlet weak var charactersCollection: CharactersCollectionView!
    @IBOutlet weak var favoritesCollection: FavoritesCollectionView!
    
    
    @IBAction func callDetails(_ sender: Any) {
        navigationController?.pushViewController(DetailsScrollViewController(), animated: true)
    }
    
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        navigationController?.navigationBar.topItem?.title = item.title
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()

        let data: [String] = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸", "10 🍖", "11 🐯", "12 🌋"]
        fetch
        charactersCollection.setData(data: [])
        favoritesCollection.setData(data:data)
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
