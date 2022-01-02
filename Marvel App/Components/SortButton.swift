//
//  UpdateListButton.swift
//  Marvel App
//
//  Created by Luciano Berchon on 02/01/22.
//

import UIKit

class SortButton: UIView {

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
         Bundle.main.loadNibNamed("SortButton", owner: self, options: nil)
         addSubview(contentView)
         contentView.frame = self.bounds
         contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
     }

}