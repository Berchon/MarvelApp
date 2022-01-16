//
//  CardCollectionViewCell.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 08/01/22.
//

import UIKit
import Kingfisher

class CardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var favoriteCharacter: UIButton!
    
    @IBAction func pressButton(_ sender: Any) {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepareCell(character: CharacterModel, favoritesData: [CharacterModel]) {
        if let urlImage = URL(string: character.thumbnail.url){
            print("***********\(urlImage)")
            imageCharacter.kf.indicatorType = .activity
            imageCharacter.kf.setImage(with: urlImage)
            imageCharacter.layer.cornerRadius = 5
//            imageCharacter.kf.setImage(with: urlImage, placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        }
        
        let isFavorite = favoritesData.contains(where: {$0.id == character.id})
        
        if isFavorite {
            favoriteCharacter.setImage(UIImage(named: "favorite_selected"), for: .normal)
        }
        
        nameCharacter.text = character.name
    }
    
    func downloadImage(`with` urlString : String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url)

        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            switch result {
            case .success(let value):
                print("Image: \(value.image). Got from: \(value.cacheType)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
