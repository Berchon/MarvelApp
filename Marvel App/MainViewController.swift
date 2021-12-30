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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    class func instantiateFromNib() -> UITabBarController {
        let nib = UINib(nibName: "MainViewController", bundle: nil)
        let vc = nib.instantiate(withOwner: nil, options: nil).first as! UITabBarController
        
        return vc
    }

}
