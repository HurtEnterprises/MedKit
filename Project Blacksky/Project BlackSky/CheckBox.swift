//
//  CheckBox.swift
//  Project BlackSky
//
//  Created by Deven  on 1/19/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class CheckBox: UIButton {
    // Images
    let checkedImage = UIImage(named: "checked_checkbox")
    let uncheckedImage = UIImage(named: "checkbox_unchecked_icon")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action: "Clicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.setImage(uncheckedImage, forState: .Normal)
        self.isChecked = false
        //other stuff
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, forState: .Normal)
            } else {
                self.setImage(uncheckedImage, forState: .Normal)
            }
        }
    }
    
    
    func Clicked(sender: UIButton) {
        if sender == self {
            if isChecked == true {
                isChecked = false
            } else {
                isChecked = true
            }
        }
    }
}