//
//  CollectionView.swift
//  Marvel App
//
//  Created by Luciano Berchon on 02/01/22.
//

import UIKit

@IBDesignable
class FavoritesCollectionView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionData = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸", "10 🍖", "11 🐯", "12 🌋"]
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
        
    private func commonInit() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("FavoritesCollectionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
//        contentView.backgroundColor = .systemPink
        collectionView.backgroundColor = .clear
        initCollectionView()
//        numberOfColumns()
    }
    
    func numberOfColumns(numberOfCol: Int = 2) {

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let spaceBetweenCells = Int(layout.minimumInteritemSpacing)
        let totalSpaceBetweenColumns = (numberOfCol - 1) * spaceBetweenCells
        let width = (Int(contentView.frame.size.width) - totalSpaceBetweenColumns) / numberOfCol
        layout.itemSize = CGSize(width: width, height: Int(Double(width) * 4 / 3))
        
    }
    
    private func initCollectionView() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
        collectionView.dataSource = self
    }
}

extension FavoritesCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CollectionViewCell else {
            fatalError("can't dequeue CustomCell")
        }
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        
        numberOfColumns()
        
        cell.label.text = "Favorites \(indexPath.item)"
        return cell
    }
}
