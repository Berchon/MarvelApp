//
//  CollectionViewCell.swift
//  Marvel App
//
//  Created by Luciano Berchon on 02/01/22.
//

import UIKit

@IBDesignable
class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.layer.borderColor = UIColor.lightGray.cgColor
    }
    

}
