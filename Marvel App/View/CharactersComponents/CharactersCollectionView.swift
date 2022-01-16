//
//  CharactersCollectionViewController.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 08/01/22.
//

import UIKit
import Kingfisher

class CharactersCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionData: [CharacterModel] = []
    var favoritesData: [CharacterModel] = []
    var textStatus: String = "Loading character..."
        
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
    }
    
    public func refreshData() {
        self.reloadData()
        favoritesData.append(collectionData[1])
        favoritesData.append(collectionData[7])
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
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
            print("data \(collectionData)")
            print(indexPath.row)
            fatalError("can't dequeue CustomCell")
        }

        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        numberOfColumns()
        
        let character: CharacterModel = collectionData[indexPath.row]
        
//        let isFavorite = favoritesData.contains(where: {$0.id == character.id})

        cell.prepareCell(character: character, favoritesData: favoritesData)
        
//        if let urlImage = URL(string: character.thumbnail.url){
//            print("***********\(urlImage)")
//            cell.imageCharacter.kf.indicatorType = .activity
////            imageCharacter.kf.setImage(with: urlImage)
//            cell.imageCharacter.kf.setImage(with: urlImage, placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
//        }
        if indexPath.row == 0 {
            print("===============")
            print(character)
            print("===============")
        }
        
//        cell.nameCharacter.text = character.name

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
