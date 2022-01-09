//
//  SearchView.swift
//  Marvel App
//
//  Created by Luciano Berchon on 01/01/22.
//

import UIKit

@IBDesignable
class SearchView: UIView {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("SearchView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        searchBar.backgroundImage = UIImage()
        
        searchBar.searchTextField.textColor = .lightGray
        searchBar.searchTextField.backgroundColor = UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1)
        searchBar.searchTextField.leftView?.tintColor = .lightGray
        searchBar.tintColor = .white
    }

}
