//
//  Conclusions.swift
//  Project BlackSky
//
//  Created by Tim Bryant on 1/24/17.
//  Copyright © 2017 Hurt Enterprises. All rights reserved.
//

import Foundation
import DropDown
import UIKit

class Conclusions: UIViewController {
    func configureView() {
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    let tealColor = UIColor(hue: 0.5583, saturation: 1, brightness: 0.74, alpha: 1.0)
    
    let Rxbutton: UIButton = UIButton(type: UIButtonType.custom)
    //set image for button
    Rxbutton.setImage(UIImage(named: "Rx"), for: UIControlState.normal)
    //add function for button
    Rxbutton.addTarget(self, action: "RxbuttonClicked", for: UIControlEvents.touchUpInside)
    //set frame
    Rxbutton.frame = CGRect(x: width/38,y: 0.750 * height, width: width * 9/10, height: height/10)
    self.view.addSubview(Rxbutton)

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // Called when 'return' key pressed. return NO to ignore. Resigns first responder (closes keyboard)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func RxbuttonClicked(){
        allergiesdropDown.show()
        print("Rx Clicked")
    }
    
    
    
}
}
