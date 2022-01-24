//
//  testeScrollViewController.swift
//  Marvel App
//
//  Created by Luciano Berchon on 10/01/22.
//

import UIKit
import Kingfisher

class DetailsScrollViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var CharacterName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    
    @IBOutlet weak var comicsCollection: ComicsCollectionView!
    @IBOutlet weak var seriesCollection: SeriesCollectionView!
    
    var character: CharacterModel
    var comics: [ComicsSeriesModel] = []
    var series: [ComicsSeriesModel] = []
    
    
    init(character: CharacterModel, comics: [ComicsSeriesModel], series: [ComicsSeriesModel]) {
        self.character = character
        self.comics = comics
        self.series = series
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.viewControllers.last?.title = "Details"
        
        fillViewData()
    }
    
    
    func fillViewData() {
        configureContentViewFrame(isEmpty: self.comics.isEmpty)
        configureContentViewFrame(isEmpty: self.series.isEmpty)

        comicsCollection.setData(data: self.comics)
        seriesCollection.setData(data: self.series)
        
        CharacterName.text = character.name
        characterDescription.text = character.verifiedDescription
        
        if let urlImage = URL(string: character.thumbnail.url){
            imageCard.kf.indicatorType = .activity
            imageCard.kf.setImage(with: urlImage, placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        }
    }


    func configureContentViewFrame(isEmpty: Bool) {
        let layout = comicsCollection.collectionViewLayout

        let x = layout.collectionView?.frame.origin.x
        let y = layout.collectionView?.frame.origin.y
        var height = 200
        let width = layout.collectionView?.frame.width

        if isEmpty {
            height = 50
        }
        layout.collectionView?.frame = CGRect(x: x!, y: y!, width: width!, height: CGFloat(height))

    }
    

}
