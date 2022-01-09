//
//  DetailsViewController.swift
//  Marvel App
//
//  Created by Luciano Berchon on 05/01/22.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("É nóis")
        // Do any additional setup after loading the view.
    }
    @IBAction func butt(_ sender: Any) {
        navigationController?.pushViewController(testeViewController(), animated: true)
    }
}
