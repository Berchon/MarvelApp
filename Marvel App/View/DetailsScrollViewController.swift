//
//  testeScrollViewController.swift
//  Marvel App
//
//  Created by Luciano Berchon on 10/01/22.
//

import UIKit
import Kingfisher

class DetailsScrollViewController: UIViewController {

    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var CharacterName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    
    @IBOutlet weak var comicsCollection: ComicsCollectionView!
    @IBOutlet weak var seriesCollection: SeriesCollectionView!
    
    var character: CharacterModel
    
    init(character: CharacterModel) {
        self.character = character
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.viewControllers.last?.title = "Details"
        
        let data: [String] = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸", "10 🍖", "11 🐯", "12 🌋"]
        comicsCollection.setData(data: data)
        seriesCollection.setData(data: [])
        
        fillViewData()
    }
    
    
    func fillViewData() {
        CharacterName.text = character.name
        characterDescription.text = character.verifiedDescription
        
        if let urlImage = URL(string: character.thumbnail.url){
            imageCard.kf.indicatorType = .activity
            imageCard.kf.setImage(with: urlImage, placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
