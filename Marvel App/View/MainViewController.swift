//
//  MainViewController.swift
//  Marvel App
//
//  Created by Luciano Berchon on 27/12/21.
//

import UIKit

class MainViewController: UITabBarController {

    override var nibName: String? {
        "MainViewController"
    }

    class func instantiateFromNib() -> UITabBarController {
        let nib = UINib(nibName: "MainViewController", bundle: nil)
        let vc = nib.instantiate(withOwner: nil, options: nil).last as! UITabBarController
        
        return vc
    }

    @IBAction func botao(_ sender: Any) {
//        present(DetailsViewController(), animated: true, completion: nil)
        navigationController?.pushViewController(DetailsViewController(), animated: true)
    }
    
}

extension MainViewController: CharactersCollectionDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("================")
//        self.navigationController?.pushViewController(DetailsViewController(), animated: true)
    }
    
    func pushDetails() {
        navigationController?.pushViewController(DetailsViewController(), animated: true)
    }
}
