//
//  testeScrollViewController.swift
//  Marvel App
//
//  Created by Luciano Berchon on 10/01/22.
//

import UIKit

class DetailsScrollViewController: UIViewController {

    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var CharacterName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    
    @IBOutlet weak var comicsCollection: ComicsCollectionView!
    @IBOutlet weak var seriesCollection: SeriesCollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.viewControllers.last?.title = "Details"
        
        let data: [String] = ["1 🏆", "2 🐸", "3 🍩", "4 😸", "5 🤡", "6 👾", "7 👻", "8 👩‍🎤", "9 🎸", "10 🍖", "11 🐯", "12 🌋"]
        comicsCollection.setData(data: data)
        seriesCollection.setData(data: [])
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
