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
    func setBackgroundColor(name: String, page:UIViewController){
        let imageName = name
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = UIScreen.mainScreen().bounds
        page.view.addSubview(imageView)
    }
    
    // Creates Button
    func makeButton(button: UIButton, name: String, titleColor: UIColor, location: CGRect, page:UIViewController){
    button.setTitle(name, forState: .Normal)
    button.setTitleColor(titleColor, forState: .Normal)
    button.frame = location // X, Y, width, height
    page.view.addSubview(button)
    }
    
    // Creates the clear button with the white outline we will commonly use
    func makeClearButton(button: UIButton, name: String, titleColor:UIColor, location: CGRect, page:UIViewController){
        button.setTitle(name, forState: .Normal)
        button.setTitleColor(titleColor, forState: .Normal)
        button.frame = location // X, Y, width, height
        button.backgroundColor = UIColor.clearColor()
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.whiteColor().CGColor
        page.view.addSubview(button)
    }
    
    // Creates the grayish raised button we will commonly use
    
    // Makes a checkbox
    func makeCheckBox(box: CheckBox,frame: CGRect, page: UIViewController){
        box.frame = frame
        box.backgroundColor = page.view.backgroundColor
        page.view.addSubview(box)
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
    func makeNavigationBar(navigationBar: UINavigationBar, barTitle: String, forwardButton: Bool, backButton: Bool, page: UIViewController){
    // Create a navigation item with a title
    let navigationItem = UINavigationItem()
    navigationItem.title = barTitle
    
    // Makes bar clear
    navigationBar.backgroundColor = UIColor.clearColor()
    navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
    navigationBar.shadowImage = UIImage()
    //navigationBar.translucent = true
        
    // Changes text color
    let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    navigationBar.titleTextAttributes = titleDict as! [String : AnyObject]
    // Create left navigation item
    if(backButton){
        navigationItem.backBarButtonItem?.tintColor = UIColor.whiteColor()
        navigationBar.tintColor = UIColor.whiteColor()
        let backButton = UIBarButtonItem(title: "< Back", style: UIBarButtonItemStyle.Plain, target: self, action: "backClicked")
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Arial", size: 30)!], forState: UIControlState.Normal)
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
    // Disables autocorrect and auto capitalization
    func disableAutocorrect(textField: UITextField){
        textField.autocorrectionType = .No
        textField.autocapitalizationType = .None
    }
    
    // Adds an image
    func addImage(imageName: String, frame: CGRect,center: Bool, alpha: CGFloat, page: UIViewController){
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.frame = frame
        imageView.alpha = alpha
        if center{
            imageView.frame.origin.x = (page.view.bounds.size.width - imageView.frame.size.width) / 2.0
        }
        page.view.addSubview(imageView)
    }
    
    func drawRectangle(color: UIColor, frame: CGRect){
        let context = UIGraphicsGetCurrentContext()
        CGContextSetLineWidth(context, 4.0)
        CGContextSetStrokeColorWithColor(context,
            UIColor.blueColor().CGColor)
        let rectangle = frame
        CGContextAddRect(context, rectangle)
        CGContextStrokePath(context)
    }
    
}