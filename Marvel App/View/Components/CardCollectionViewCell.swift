//
//  CardCollectionViewCell.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 08/01/22.
//

import UIKit
import Kingfisher

//protocol MyCollectionViewCellDelegate: class {
//    func isFavoritedNow()
//    func teste()
//}

class CardCollectionViewCell: UICollectionViewCell {
    
//    weak var delegation: MyCollectionViewCellDelegate?
    var favoriteTapAction: ((CardCollectionViewCell) -> Void)?

    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var favoriteCharacter: UIButton!
    
    @IBAction func pressButton(_ sender: Any) {
        favoriteTapAction?(self)        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
