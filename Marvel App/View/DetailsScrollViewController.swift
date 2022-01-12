//
//  testeScrollViewController.swift
//  Marvel App
//
//  Created by Luciano Berchon on 10/01/22.
//

import UIKit

class DetailsScrollViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.viewControllers.last?.title = "Details"
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
