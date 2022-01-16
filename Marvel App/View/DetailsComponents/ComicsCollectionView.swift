//
//  Comics.swift
//  Marvel App
//
//  Created by Luciano Berchon on 10/01/22.
//

import UIKit

class ComicsCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var collectionData: [String] = []
    let numberOfCol: Int = 3
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        delegate = self
        dataSource = self
        commonInit()
    }

    
    private func commonInit() {
        // Popula com os dados a serem exibidos
//        collectionData = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸", "10 🍖", "11 🐯", "12 🌋"]
        
        let nib1 = UINib(nibName: "EmptyCollectionViewCell", bundle: nil)
        self.register(nib1, forCellWithReuseIdentifier: "EmptyCell")
        let nib2 = UINib(nibName: "CardCollectionViewCell", bundle: nil)
        self.register(nib2, forCellWithReuseIdentifier: "CardCell")
    }
    
    
    public func setData(data: [String]) {
        collectionData = data
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionData.count == 0 {
            return 1
        }
        
        return collectionData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionData.count == 0 {
            configureContentViewFrame(isEmpty: true)
            return ConfigureEmptyCell(indexPath: indexPath)
        }
        
        configureContentViewFrame(isEmpty: false)
        return ConfigureCell(indexPath: indexPath)
    }
    
    
    func configureContentViewFrame(isEmpty: Bool) {
        let layout = self.collectionViewLayout as! UICollectionViewFlowLayout
        
        let spaceBetweenCells = Int(layout.minimumInteritemSpacing)
        let totalSpaceBetweenColumns = (numberOfCol - 1) * spaceBetweenCells
        let widthOfCell = (Int(self.frame.size.width) - totalSpaceBetweenColumns) / numberOfCol
        
        let x = layout.collectionView?.frame.origin.x
        let y = layout.collectionView?.frame.origin.y
        var height = Int(Double(widthOfCell) * 4 / 3)
        let width = layout.collectionView?.frame.width
        
        if isEmpty {
            height = 50
        }
        layout.collectionView?.frame = CGRect(x: x!, y: y!, width: width!, height: CGFloat(height))
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
        
        cell.label.text = "Nenhum card encontrado"
        return cell
    }
    
    
    func ConfigureCell(indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as? CardCollectionViewCell else {
            fatalError("can't dequeue CustomCell")
        }

        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        numberOfColumns(numberOfCol: numberOfCol)

        cell.nameCharacter.text = "\(collectionData[indexPath.row])"
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
