//
//  ForgotPassword.swift
//  Project BlackSky
//
//  Created by Deven  on 12/27/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class ForgotPasswordPage: UIViewController {
    let loginPage:LoginPage = LoginPage()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        self.view.backgroundColor = UIColor.whiteColor()
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }
    
    // Initializes text fields & labels
    let usernameField: UITextField = UITextField()
    let usernameLabel: UILabel = UILabel()
    
    let emailField: UITextField = UITextField()
    let emailLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Adds navigation bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, height*146/10000, self.view.frame.size.width, height*366/10000)) // Offset by 20 pixels vertically to take the status bar into account
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "Forgot Password", color: UIColor.whiteColor(), forwardButton: false, backButton: true, page: self)
        
        let getStarted = UIButton()
        
        creationFunctions.makeButton(getStarted, name: "Forgot Password", titleColor: UIColor.blueColor(), location: CGRectMake(width*40/100, 7*screenSize.height/10, width*19/100, height*2/100), page: self)// X, Y, width, height
        getStarted.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(getStarted)
        getStarted.sizeToFit()
        
        
        // Adds text fields and their cooresponding identifying labels
        creationFunctions.makeLabel(usernameLabel, name: "Current Username:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width*71/1000, height*11/100, width*29/100, height*26/1000), page: self)
        usernameLabel.sizeToFit()
        
        creationFunctions.makeTextField(usernameField, backgroundColor: UIColor.cyanColor(), frame: CGRectMake(64*width/100, height*11/100, width*29/100, height*26/1000), page: self)
        
        creationFunctions.makeLabel(emailLabel, name: "Email Address:",textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width*71/1000, height*22/100, width*29/100, height*26/1000), page:self)
        emailLabel.sizeToFit()
        
        creationFunctions.makeTextField(emailField,backgroundColor: UIColor.cyanColor(), frame: CGRectMake(width*64/100, height*22/100, width*29/100, height*26/1000), page: self)
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pressed(sender: UIButton!) {
        // I created an alert this way to allow a page change upon clicking okay
        if(usernameField.text == "" || emailField.text == ""){
            creationFunctions.makeAlert("Incomplete Form", message: "Please fill out the form in its entirety.", printStatement: "Incomplete forgot password form.", page: self)
        }
        //TODO @Mehrab: make sure usernmae and email map to same user
        let alertController = UIAlertController(title: "Success", message: "Check your email for instructions on resetting your password.", preferredStyle: .Alert)
        // Initialize Actions
        let okayAction = UIAlertAction(title: "Okay", style: .Default) { (action) -> Void in
            self.presentViewController(self.loginPage, animated: true, completion: nil)
            print("*insert username* forgot password")
        }
        // Add Actions
        alertController.addAction(okayAction)
        // Present Alert Controller
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    // Called when 'return' key pressed. return NO to ignore. Resigns first responder (closes keyboard)
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // Called when the user click on the view (outside the UITextField). Resigns first responder (closes keyboard)
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    func backClicked (sender: UIBarButtonItem!){
        self.dismissViewControllerAnimated(true, completion: {});
    }
}