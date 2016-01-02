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

// Creates Button
func makeButton(button: UIButton, name: String, titleColor: UIColor, location: CGRect){
    button.setTitle(name, forState: .Normal)
    button.setTitleColor(titleColor, forState: .Normal)
    button.frame = location // X, Y, width, height
}

// Makes a Text Field
    func makeTextField(field: UITextField, backgroundColor: UIColor, frame: CGRect){
    field.frame = frame
    field.backgroundColor = backgroundColor
}

// Makes a label
    func makeLabel(label: UILabel, name: String, textColor:UIColor, frame: CGRect){
    label.frame = frame
    label.textColor = textColor
    label.textAlignment = NSTextAlignment.Center
    label.text = name
}

// Makes an alert
func makeAlert(title: String, message: String, printStatement: String){
    // Makes the iphone popup alert
    let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    // Initialize Actions
    let okayAction = UIAlertAction(title: "Okay", style: .Default) { (action) -> Void in
        print(printStatement)
    }
    // Add Actions
    alertController.addAction(okayAction)
    // Present Alert Controller
    }

// Makes a navigation Bar
func makeNavigationBar(navigationBar: UINavigationBar, barTitle: String, forwardButton: Bool, backButton: Bool, classofOrigin: UIViewController){
    navigationBar.backgroundColor = UIColor.whiteColor()
    // Create a navigation item with a title
    let navigationItem = UINavigationItem()
    navigationItem.title = "Register Account"
    // Create left navigation item
    let leftButton =  UIBarButtonItem(title: "Back", style:   UIBarButtonItemStyle.Plain, target: classofOrigin, action: "backClicked:")
    // Create two buttons for the navigation item
    navigationItem.leftBarButtonItem = leftButton
    // Assign the navigation item to the navigation bar
    navigationBar.items = [navigationItem]
}