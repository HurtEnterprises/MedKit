//
//  UICreationFunctions.swift
//  Project BlackSky
//
//  Created by Deven  on 12/30/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

// This file will contain general UI creation functions

class UICreationFunctions: UIViewController{
    
    //sets background color
    func setBackgroundColor(_ name: String, page:UIViewController){
        let imageName = name
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = UIScreen.main.bounds
        page.view.addSubview(imageView)
    }
    
    // Creates Button
    func makeButton(_ button: UIButton, name: String, titleColor: UIColor, location: CGRect, page:UIViewController){
    button.setTitle(name, for: UIControlState())
    button.setTitleColor(titleColor, for: UIControlState())
    button.frame = location // X, Y, width, height
    page.view.addSubview(button)
    }
    
    // Creates the clear button with the white outline we will commonly use
    func makeClearButton(_ button: UIButton, name: String, titleColor:UIColor, location: CGRect, page:UIViewController){
        button.setTitle(name, for: UIControlState())
        button.setTitleColor(titleColor, for: UIControlState())
        button.frame = location // X, Y, width, height
        button.backgroundColor = UIColor.clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        page.view.addSubview(button)
    }
    
    // Creates the grayish raised button we will commonly use
    
    // Makes a checkbox
    func makeCheckBox(_ box: CheckBox,frame: CGRect, page: UIViewController){
        box.frame = frame
        box.backgroundColor = page.view.backgroundColor
        page.view.addSubview(box)
    }

// Makes a Text Field
    func makeTextField(_ field: UITextField, backgroundColor: UIColor, frame: CGRect, page: UIViewController){
    field.frame = frame
    field.backgroundColor = backgroundColor
    page.view.addSubview(field)
    }

// Makes a label
    func makeLabel(_ label: UILabel, name: String, textColor:UIColor, alignment: NSTextAlignment, frame: CGRect, page: UIViewController){
    label.frame = frame
    label.textColor = textColor
    label.textAlignment = alignment
    label.text = name
    page.view.addSubview(label)
    }

// Makes an alert
    func makeAlert(_ title: String, message: String, printStatement: String, page:UIViewController){
    // Makes the iphone popup alert
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    // Initialize Actions
    let okayAction = UIAlertAction(title: "Okay", style: .default) { (action) -> Void in
        print(printStatement)
    }
    // Add Actions
    alertController.addAction(okayAction)
    // Present Alert Controller
    page.present(alertController, animated: true, completion: nil)
    print(printStatement)
    }

// Makes a navigation Bar
    func makeNavigationBar(_ navigationBar: UINavigationBar, barTitle: String, forwardButton: Bool, backButton: Bool, page: UIViewController){
    // Create a navigation item with a title
    let navigationItem = UINavigationItem()
    navigationItem.title = barTitle
    
    // Makes bar clear
    navigationBar.backgroundColor = UIColor.clear
    navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    navigationBar.shadowImage = UIImage()
    //navigationBar.translucent = true
        
    // Changes text color
    let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.white]
    navigationBar.titleTextAttributes = titleDict as! [String : AnyObject]
    // Create left navigation item
    if(backButton){
        navigationItem.backBarButtonItem?.tintColor = UIColor.white
        navigationBar.tintColor = UIColor.white
        let backButton = UIBarButtonItem(title: "< Back", style: UIBarButtonItemStyle.plain, target: self, action: "backClicked")
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Arial", size: 30)!], for: UIControlState())
    }
    if(forwardButton){
        let rightButton =  UIBarButtonItem(title: "Next", style:   UIBarButtonItemStyle.plain, target: page, action: "nextClickedClicked:")
        // Create two buttons for the navigation item
        navigationItem.rightBarButtonItem = rightButton
    }
    // Assign the navigation item to the navigation bar
    navigationBar.items = [navigationItem]
    //Adds the bar to the view
    page.view.addSubview(navigationBar)
}
    // Disables autocorrect and auto capitalization
    func disableAutocorrect(_ textField: UITextField){
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
    }
    
    // Adds an image
    func addImage(_ imageName: String, frame: CGRect,center: Bool, alpha: CGFloat, page: UIViewController){
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = frame
        imageView.alpha = alpha
        if center{
            imageView.frame.origin.x = (page.view.bounds.size.width - imageView.frame.size.width) / 2.0
        }
        page.view.addSubview(imageView)
    }
    
    func drawRectangle(_ color: UIColor, frame: CGRect){
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(4.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle = frame
        context?.addRect(rectangle)
        context?.strokePath()
    }
    
}
