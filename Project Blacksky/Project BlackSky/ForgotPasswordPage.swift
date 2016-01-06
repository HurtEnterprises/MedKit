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
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "Forgot Password", color: UIColor.whiteColor(), forwardButton: false, backButton: true, page: self)
        
        let getStarted = UIButton()
        creationFunctions.makeButton(getStarted, name: "Forgot Password", titleColor: UIColor.blueColor(), location: CGRectMake((screenSize.width-200)/2, 7*screenSize.height/10, 200, 30), page: self)// X, Y, width, height
        getStarted.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(getStarted)
        
        
        // Adds text fields and their cooresponding identifying labels
        creationFunctions.makeLabel(usernameLabel, name: "Current Username:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((screenSize.width-300)/2 - 300, 150, 300, 35), page: self)
        creationFunctions.makeTextField(usernameField, backgroundColor: UIColor.cyanColor(), frame: CGRectMake((screenSize.width-300)/2 + 300, 150, 300, 35), page: self)
        
        creationFunctions.makeLabel(emailLabel, name: "Email Address:",textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((screenSize.width-300)/2 - 300, 300, 300, 35), page:self)
        creationFunctions.makeTextField(emailField,backgroundColor: UIColor.cyanColor(), frame: CGRectMake((screenSize.width-300)/2 + 300, 300, 300, 35), page: self)
        
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

    
    func backClicked (sender: UIBarButtonItem!){
        self.presentViewController(loginPage, animated: true, completion: nil)
    }
}