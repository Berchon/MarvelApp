//
//  SearchBar.swift
//  MarvelApp3
//
//  Created by Luciano Berchon on 07/01/22.
//

import UIKit

class SearchBar: UISearchBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ConfigureSearchBar()
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        ConfigureSearchBar()
    }
    
    
    func ConfigureSearchBar() {
        let newGray = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
        let translucentWhite = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        let translucentWhite_15 = UIColor(red: 1, green: 1, blue: 1, alpha: 0.15)
        self.backgroundImage = UIImage()
        self.backgroundColor = translucentWhite
        
        self.tintColor =  newGray //Cursor
        self.searchTextField.textColor = newGray //text color

        self.searchTextField.backgroundColor = translucentWhite_15 //background text color
        self.searchTextField.leftView?.tintColor = newGray //left image color of search bar
    }

}
