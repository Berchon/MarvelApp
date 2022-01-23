//
//  CharactersCollectionViewController.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 08/01/22.
//

import UIKit

protocol MyFavoriteViewDelegate: class {
    func removeFavorites(index: Int) -> Bool
}

class FavoritesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var delegation: MyFavoriteViewDelegate?
    
    var collectionData: [FavoriteModel] = []
    var textStatus: String = "Not found favorites."
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        dataSource = self
        commonInit()
    }

    
    private func commonInit() {
        let nib1 = UINib(nibName: "EmptyCollectionViewCell", bundle: nil)
        self.register(nib1, forCellWithReuseIdentifier: "EmptyCell")
        let nib2 = UINib(nibName: "CardCollectionViewCell", bundle: nil)
        self.register(nib2, forCellWithReuseIdentifier: "CardCell")
    }
    
    
    public func setData(data: [FavoriteModel]) {
        collectionData = data
        refreshData()
    }
    
    public func refreshData() {
        self.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionData.count == 0 {
            return 1
        }
        self.textStatus = "Not found favorites."
        return collectionData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionData.count == 0 {
            return ConfigureEmptyCell(indexPath: indexPath)
        }
        
        return ConfigureCell(indexPath: indexPath)
    }
    
    
    func ConfigureEmptyCell(indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: "EmptyCell", for: indexPath) as? EmptyCollectionViewCell else {
            fatalError("can't dequeue CustomCell")
        }
        
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        let width = Int(self.frame.size.width)
        layout.itemSize = CGSize(width: width, height: 50)
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        cell.label.text = self.textStatus
        return cell
    }
    
    
    func ConfigureCell(indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCollectionViewCell else {
            fatalError("can't dequeue CustomCell")
        }

        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        numberOfColumns()
        
        let character: FavoriteModel = collectionData[indexPath.row]
        
        cell.favoriteCharacter.setImage(UIImage(named: "favorite_selected"), for: .normal)
        
        cell.nameCharacter.text = character.name
        cell.id.text = String(character.id)

        cell.imageCharacter.image = UIImage(data: character.image)
//        if let urlImage = URL(string: character.thumbnail.url){
//            cell.imageCharacter.kf.indicatorType = .activity
//            cell.imageCharacter.kf.setImage(with: urlImage, placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
//        }
        
        cell.favoriteTapAction = { cell in
            let _ = self.delegation?.removeFavorites(index: indexPath.item)
//            self.refreshData()
        }
        
        return cell
    }
    
    
    func numberOfColumns(numberOfCol: Int = 2) {
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = Int(layout.minimumInteritemSpacing)
        let totalSpaceBetweenColumns = (numberOfCol - 1) * spaceBetweenCells
        let width = (Int(self.frame.size.width) - totalSpaceBetweenColumns) / numberOfCol
        layout.itemSize = CGSize(width: width, height: Int(Double(width) * 4 / 3))
    }

}
