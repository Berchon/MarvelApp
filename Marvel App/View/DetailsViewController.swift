//
//  DetailsViewController.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 08/01/22.
//

import UIKit

class DetailsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.viewControllers.last?.title = "Details"

    }

}
