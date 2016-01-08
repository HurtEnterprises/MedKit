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
// Creates Button
    func makeButton(button: UIButton, name: String, titleColor: UIColor, location: CGRect, page:UIViewController){
    button.setTitle(name, forState: .Normal)
    button.setTitleColor(titleColor, forState: .Normal)
    button.frame = location // X, Y, width, height
    page.view.addSubview(button)
}

// Makes a Text Field
    func makeTextField(field: UITextField, backgroundColor: UIColor, frame: CGRect, page: UIViewController){
    field.frame = frame
    field.backgroundColor = backgroundColor
    page.view.addSubview(field)
}

// Makes a label
    func makeLabel(label: UILabel, name: String, textColor:UIColor, alignment: NSTextAlignment, frame: CGRect, page: UIViewController){
    label.frame = frame
    label.textColor = textColor
    label.textAlignment = alignment
    label.text = name
    page.view.addSubview(label)
}

// Makes an alert
    func makeAlert(title: String, message: String, printStatement: String, page:UIViewController){
    // Makes the iphone popup alert
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    // Initialize Actions
    let okayAction = UIAlertAction(title: "Okay", style: .Default) { (action) -> Void in
        print(printStatement)
    }
    // Add Actions
    alertController.addAction(okayAction)
    // Present Alert Controller
    page.presentViewController(alertController, animated: true, completion: nil)
    print(printStatement)
}

// Makes a navigation Bar
    func makeNavigationBar(navigationBar: UINavigationBar, barTitle: String,color: UIColor, forwardButton: Bool, backButton: Bool, page: UIViewController){
    navigationBar.backgroundColor = color
    // Create a navigation item with a title
    let navigationItem = UINavigationItem()
    navigationItem.title = barTitle
    // Create left navigation item
    if(backButton){
    let leftButton =  UIBarButtonItem(title: "Back", style:   UIBarButtonItemStyle.Plain, target: page, action: "backClicked:")
    // Create two buttons for the navigation item
    navigationItem.leftBarButtonItem = leftButton
    }
    if(forwardButton){
        let rightButton =  UIBarButtonItem(title: "Next", style:   UIBarButtonItemStyle.Plain, target: page, action: "nextClickedClicked:")
        // Create two buttons for the navigation item
        navigationItem.rightBarButtonItem = rightButton
    }
    // Assign the navigation item to the navigation bar
    navigationBar.items = [navigationItem]
    //Adds the bar to the view
    page.view.addSubview(navigationBar)
}
}