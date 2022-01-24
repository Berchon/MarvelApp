//
//  button.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 08/01/22.
//

import UIKit

class button: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        ConfigureButton()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ConfigureButton()
    }

    
    func ConfigureButton() {
        self.layer.cornerRadius = 10
    }
}
