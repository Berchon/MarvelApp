//
//  CharactersCollectionViewController.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 08/01/22.
//

import UIKit

class FavoritesCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionData: [CharacterModel] = []
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
    
    
    public func setData(data: [CharacterModel]) {
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
        
        let favorite: CharacterModel = collectionData[indexPath.row]
        
        cell.favoriteCharacter.setImage(UIImage(named: "favorite_selected"), for: .normal)

        cell.nameCharacter.text = favorite.name
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
