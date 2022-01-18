//
//  CharactersCollectionViewController.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 08/01/22.
//

import UIKit
import Kingfisher

protocol MyCollectionViewDelegate: class {
    func loadMoreData()
    func pushDetailsView()
    func isFavoritedNow(favorite: CharacterModel)
}

class CharactersCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var delegation: MyCollectionViewDelegate?
    
    var collectionData: [CharacterModel] = []
    var favoritesData: [CharacterModel] = []
    var textStatus: String = "Not found characters."
    var total: Int = 0
        
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
    
    public func setData(data: [CharacterModel], total: Int) {
//        self.textStatus = "Not found character."
        collectionData = data
        self.total = total
    }
    
    public func setFavorites(data: [CharacterModel]) {
        favoritesData = data
        self.refreshData()
    }
    
    public func refreshData() {
        self.reloadData()
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        delegation?.pushDetailsView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionData.count == 0 {
            return 1
        }
        
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
        
        cell.label.text = textStatus
        return cell
    }
    
    
    func ConfigureCell(indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCollectionViewCell else {
            fatalError("can't dequeue CustomCell")
        }

        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        numberOfColumns()
        
        let character: CharacterModel = collectionData[indexPath.row]
        
        let isFavorite = favoritesData.contains(where: {$0.id == character.id})

        if isFavorite {
            cell.favoriteCharacter.setImage(UIImage(named: "favorite_selected"), for: .normal)
        }
        else {
            cell.favoriteCharacter.setImage(UIImage(named: "favorite_regular"), for: .normal)
        }


        cell.nameCharacter.text = character.name
        cell.id.text = String(character.id)

        if let urlImage = URL(string: character.thumbnail.url){
            cell.imageCharacter.kf.indicatorType = .activity
            cell.imageCharacter.kf.setImage(with: urlImage, placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        }

        if(indexPath.item == collectionData.count - 10 && collectionData.count != total){
            delegation?.loadMoreData()
        }
        
        cell.favoriteTapAction = { cell in
            let favorite = character
            self.delegation?.isFavoritedNow(favorite: favorite)
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
