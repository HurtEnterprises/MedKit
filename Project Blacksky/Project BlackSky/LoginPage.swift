//
//  LoginPage.swift
//  Project BlackSky
//
//  Created by Deven  on 12/26/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class LoginPage: UIViewController {
        
    let mainMenu: MainMenu = MainMenu()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    
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
    
    let usernameField: UITextField = UITextField()
    let passwordField: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Makes Text Fields
        creationFunctions.makeTextField(usernameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(width*65/100, height*13/100, width*22/100, height*3/100), page:self)
        usernameField.text = "Ladiesman69"
        
        creationFunctions.makeTextField(passwordField,backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(width*65/100, height*26/100, width*22/100, height*3/100), page:self)
        passwordField.secureTextEntry = true
        passwordField.text = "Cashmoneyballer"
       
        // Makes Text Labels
        let usernameLabel: UILabel = UILabel()
        creationFunctions.makeLabel(usernameLabel, name: "Username", textColor: UIColor.lightGrayColor(), alignment:NSTextAlignment.Center, frame: CGRectMake(width*55/1000, height*13/100, width*29/100, height*4/100), page: self)
        usernameLabel.sizeToFit()
    
        let passwordLabel: UILabel = UILabel()
        creationFunctions.makeLabel(passwordLabel, name: "Password", textColor: UIColor.lightGrayColor(), alignment:NSTextAlignment.Center, frame: CGRectMake(width*55/1000, height*26/100, width*29/100, height*4/100), page: self)
        passwordLabel.sizeToFit()
        
        //TODO: Redo the buttons so they are placed and the length is chosen based upon the legnth of the word
        
        // Makes login, register, and forgot password button.
        let loginButton = UIButton()
        creationFunctions.makeButton(loginButton, name: "Login", titleColor: UIColor.blueColor(), location: CGRectMake(width*44/100, height*63/100, width*117/1000, height*22/1000), page: self)
        loginButton.addTarget(self, action: "loginChecks:", forControlEvents: .TouchUpInside)
        loginButton.sizeToFit()
        
        let register = UIButton()
        creationFunctions.makeButton(register, name: "Register",titleColor: UIColor.blueColor(), location: CGRectMake(width*34/100, height*66/100, width*177/1000, height*22/1000), page: self)
        register.addTarget(self, action: "registerSwitch:", forControlEvents: .TouchUpInside)
        register.sizeToFit()
        
        let forgotPassword = UIButton()
        creationFunctions.makeButton(forgotPassword, name: "Forgot Password",titleColor: UIColor.blueColor(), location: CGRectMake(width*52/100, height*66/100, width*146/1000, height*22/1000), page: self)
        forgotPassword.addTarget(self, action: "forgotPasswordSwitch:", forControlEvents: .TouchUpInside)
        forgotPassword.sizeToFit()
        
        self.configureView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Private Functions
    
    //Login Verification
    func loginChecks(sender: UIButton!){
            // Checks login logic
            print(usernameField.text)
            print(passwordField.text)
            
            if (usernameField.text == ""){
                creationFunctions.makeAlert("No Username", message: "Please input a username.", printStatement: "No username", page: self)
                return
            } else if(passwordField.text == ""){
                creationFunctions.makeAlert("No Password", message: "Please input a password.", printStatement: "No password", page: self)
                return
            } else {
                //TODO: @Mehrab connect to database and do checks to see if matches valid login
                verifyLogin(usernameField.text!)
            }
            
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
    
    //Transitions
    
    // Changes to Register Page
    func registerSwitch(sender: UIButton!) {
        let AccountRegister:AccountRegisterPage = AccountRegisterPage()
        self.presentViewController(AccountRegister, animated: true, completion: nil)
    }
    
    // Changes to Forgot Password Page
    func forgotPasswordSwitch(sender: UIButton!) {
       let ForgotPassword:ForgotPasswordPage = ForgotPasswordPage()
       self.presentViewController(ForgotPassword, animated: true, completion: nil)
    }
    
    func verifyLogin(username: String){
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper();
        
        let task: AWSTask! = dynamoDBObjectMapper.load(DDBLoginData.self, hashKey: username, rangeKey: nil)
        
        task.continueWithExecutor(AWSExecutor.mainThreadExecutor(), withBlock: { (task:AWSTask!) -> AnyObject! in
            if (task.error == nil) { //no error
                if (task.result != nil) {//the item exists in the db; the username exists.
                    let loginData = task.result as! DDBLoginData //get the login data object we received
                    
                    //compare the password on the db to the password they supplied:
                    if self.passwordField.text == loginData.Password {
                        print("Valid. Signed in.")
                        self.presentViewController(self.mainMenu, animated: true, completion: nil)
                    } else {
                        self.creationFunctions.makeAlert("Wrong Passowrd", message: "You inputted the incorrect password.", printStatement: "Wrong Password.", page: self)
                    }
                }
            } else {
                print("Error: \(task.error)")
                
            }
            return nil
        })

    }
    
}

