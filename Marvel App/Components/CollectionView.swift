//
//  CollectionView.swift
//  Marvel App
//
//  Created by Luciano Berchon on 02/01/22.
//

import UIKit

class CollectionView: UIView {

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
        bundle.loadNibNamed("CollectionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.backgroundColor = .green

        initCollectionView()
        numberOfColumns()
    }
    
    func numberOfColumns(numberOfCol: Int = 3) {

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        collectionView.layer.borderWidth = 1
        collectionView.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        
        let spaceBetweenCells = Int(layout.minimumInteritemSpacing)
        let totalSpaceBetweenColumns = (numberOfCol - 1) * spaceBetweenCells
        let width = (Int(contentView.frame.size.width) - totalSpaceBetweenColumns) / numberOfCol
        let a = contentView.frame.size.width
        let b = collectionView.frame.width
        layout.itemSize = CGSize(width: width, height: Int(Double(width) * 1.5))
        
    }
    
    private func initCollectionView() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "CustomCell")
        collectionView.dataSource = self
    }
}

extension CollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CollectionViewCell else {
            fatalError("can't dequeue CustomCell")
        }
        
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 12
        cell.layer.borderColor = UIColor.gray.cgColor
        
        // Gradient initialization
        let gradient = CAGradientLayer()
        
        let centerColor = UIColor(red: 236/255, green: 18/255, blue: 34/255, alpha: 1).cgColor
        let edgeColor = UIColor(red: 102/255, green: 7/255, blue: 14/255, alpha: 1).cgColor
        
        // Gradient configuration
        gradient.colors = [centerColor, edgeColor]
        gradient.locations = [0.0, 1.0]
        gradient.type = .radial
        gradient.startPoint = CGPoint(x: 0.5, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.5, y: 1.5)
        
        gradient.frame = cell.bounds
//        gradient.frame = self.containerView.bounds
        gradient.cornerRadius = cell.layer.cornerRadius

        // Add gradient in containerView
        cell.layer.insertSublayer(gradient, at: 0)
        
//        cell.layer.shadowOffset = CGSize(width: 3, height: 3)
//        cell.layer.shadowRadius = 4
//        cell.label.shadowColor = .lightGray
//        cell.layer.shadowOpacity = 6
        
        cell.label.text = "\(indexPath.item)"
        return cell
    }
}
