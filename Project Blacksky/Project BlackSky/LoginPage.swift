//
//  LoginPage.swift
//  Project BlackSky
//
//  Created by Deven  on 12/26/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class LoginPage: UINavigationController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    class subclassedUIButton: UIButton {
        var username: String?
        var password: String?
    }
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        self.view.backgroundColor = UIColor.cyanColor()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        // Adds Navigation Bar
        navigationItem.title = "Login"
        
        //TODO: Redo the buttons so they are placed and the length is chosen based upon the legnth of the word
        // Makes login, register, and forgot password button.
        
        let Login = subclassedUIButton()
        makeButton(Login, name: "Login", location: CGRectMake((screenSize.width-120)/2, 5*screenSize.width/6, 120, 30))
        Login.addTarget(self, action: "loginChecks:", forControlEvents: .TouchUpInside)
        
        let register = UIButton()
        makeButton(register, name: "Register", location: CGRectMake((screenSize.width-120)/2-100, 8*screenSize.width/9, 120, 30))
        register.addTarget(self, action: "registerSwitch:", forControlEvents: .TouchUpInside)
        
        let forgotPassword = subclassedUIButton()
        makeButton(forgotPassword, name: "Forgot Password", location: CGRectMake((screenSize.width-150)/2+100, 8*screenSize.width/9, 150, 30))
        forgotPassword.addTarget(self, action: "forgotPasswordSwitch:", forControlEvents: .TouchUpInside)
        
        
        
        // Makes Text Fields
        let usernameField: UITextField = UITextField()
        makeTextField(usernameField, frame: CGRectMake((screenSize.width-300)/2 + 300, 175, 300, 35))
        Login.username = usernameField.text
        
        let passwordField: UITextField = UITextField()
        makeTextField(passwordField, frame: CGRectMake((screenSize.width-300)/2 + 300, 350, 300, 35))
        Login.password = passwordField.text
       
        // Makes Text Labels
        let usernameLabel: UILabel = UILabel()
        makeLabel(usernameLabel, name: "Username", frame: CGRectMake((screenSize.width-300)/2 - 300, 175, 300, 55))
    
        let passwordLabel: UILabel = UILabel()
        makeLabel(passwordLabel, name: "Password", frame: CGRectMake((screenSize.width-300)/2 - 300, 350, 300, 55))
        
        self.configureView()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Functions
    
    func loginChecks(sender: subclassedUIButton!) {
        // Checks login logic
         var inputtedPassword = sender.password
         var inputtedUsername = sender.username
        print(inputtedUsername)
        print(inputtedPassword)
        
        if (inputtedUsername == ""){
            makeAlert("No Username", message: "Please input a username.", printStatement: "No username")
            return
        } else if(inputtedPassword == ""){
            makeAlert("No Password", message: "Please input a password.", printStatement: "No password")
            return
        } else {
            //TODO: @Mehrab connect to database and do checks to see if matches valid login
        }
        
        
        
    }
    
    func registerSwitch(sender: UIButton!) {
        let AccountRegister:AccountRegisterPage = AccountRegisterPage()
        self.presentViewController(AccountRegister, animated: true, completion: nil)
    }
    
    func forgotPasswordSwitch(sender: UIButton!) {
        let ForgotPassword:ForgotPasswordPage = ForgotPasswordPage()
        self.presentViewController(ForgotPassword, animated: true, completion: nil)
    }
    
    func makeButton(button: UIButton, name: String, location: CGRect){
        button.setTitle(name, forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.frame = location // X, Y, width, height
        self.view.addSubview(button)
    }
    
    func makeTextField(field: UITextField, frame: CGRect){
        field.frame = frame
        field.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(field)
    }
    
    func makeLabel(label: UILabel, name: String, frame: CGRect){
        label.frame = frame
        label.textColor = UIColor.lightGrayColor()
        label.textAlignment = NSTextAlignment.Center
        label.text = name
        self.view.addSubview(label)

    }
    
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
        self.presentViewController(alertController, animated: true, completion: nil)
    }

    // Called when 'return' key pressed. return NO to ignore. Resigns first responder
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    // Called when the user click on the view (outside the UITextField). Resigns first responder
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
}

