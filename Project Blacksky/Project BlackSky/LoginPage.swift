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
    
    var underlineAttributes = [
        NSFontAttributeName : UIFont.systemFontOfSize(27.0),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSUnderlineStyleAttributeName : 1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // NOTES: Views must be added in a specific order as they stack (Background, boxes, all labels and textboxes)

        creationFunctions.setBackgroundColor("MainBackground", page: self)
        
        let infoBox = UIView(frame: CGRectMake(width/10, height/4, width * 8/10, height/2.35))
        infoBox.backgroundColor = UIColor.clearColor()
        infoBox.layer.borderWidth = 5
        infoBox.layer.borderColor = UIColor.whiteColor().CGColor
        infoBox.layer.cornerRadius = 8.0
        infoBox.clipsToBounds = true
        view.addSubview(infoBox)
        
        // Makes Text Fields
        creationFunctions.makeTextField(usernameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(width/4, height/3.5 + 50, width/2, 30), page:self)
        usernameField.font = usernameField.font!.fontWithSize(30)
        usernameField.text = "blackmamba9in"
        usernameField.layer.backgroundColor = UIColor.clearColor().CGColor
        usernameField.layer.borderColor = UIColor.clearColor().CGColor
        usernameField.layer.borderWidth = 2.0
        let usernameBorder = CALayer()
        usernameBorder.borderColor = UIColor.whiteColor().CGColor
        usernameBorder.frame = CGRect(x: 0, y: usernameField.frame.size.height - usernameField.layer.borderWidth, width:  usernameField.frame.size.width, height: usernameField.frame.size.height)
        usernameBorder.borderWidth = width
        usernameField.layer.addSublayer(usernameBorder)
        usernameField.layer.masksToBounds = true
        
        creationFunctions.makeTextField(passwordField,backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(width/4, height/2.5 + 50, width/2, 30), page:self)
        passwordField.font = passwordField.font!.fontWithSize(30)
        passwordField.text = "plunger"
        passwordField.secureTextEntry = true
        creationFunctions.disableAutocorrect(passwordField)
        passwordField.layer.backgroundColor = UIColor.clearColor().CGColor
        passwordField.layer.borderColor = UIColor.clearColor().CGColor
        passwordField.layer.borderWidth = 2.0
        let passwordBorder = CALayer()
        passwordBorder.borderColor = UIColor.whiteColor().CGColor
        passwordBorder.frame = CGRect(x: 0, y: passwordField.frame.size.height - passwordField.layer.borderWidth, width:  passwordField.frame.size.width, height: passwordField.frame.size.height)
        passwordBorder.borderWidth = width
        passwordField.layer.addSublayer(passwordBorder)
        passwordField.layer.masksToBounds = true


        
        // Makes Text Labels
        let usernameLabel: UILabel = UILabel()
        creationFunctions.makeLabel(usernameLabel, name: "USERNAME", textColor: UIColor.whiteColor(), alignment:NSTextAlignment.Center, frame: CGRectMake(width/4, height/3.5, width/5, height/10), page: self)
        usernameLabel.font = usernameLabel.font.fontWithSize(30)
        usernameLabel.sizeToFit()

        
        let passwordLabel: UILabel = UILabel()
        creationFunctions.makeLabel(passwordLabel, name: "PASSWORD", textColor: UIColor.whiteColor(), alignment:NSTextAlignment.Center, frame: CGRectMake(width/4, height/2.5, width/5, height/10), page: self)
        passwordLabel.font = passwordLabel.font.fontWithSize(30)
        passwordLabel.sizeToFit()
        
        //TODO: Redo the buttons so they are placed and the length is chosen based upon the legnth of the word
        
        // Makes login, register, and forgot password button.
        let loginButton = UIButton()
        creationFunctions.makeClearButton(loginButton, name: "LOGIN", titleColor: UIColor.whiteColor(), location: CGRectMake((2/3*width)/2,  height/2, width/3, height/12), page: self)
        loginButton.titleLabel?.font = UIFont(name: (loginButton.titleLabel?.font?.fontName)!, size: 60)
        loginButton.layer.borderColor = UIColor.clearColor().CGColor
        loginButton.layer.shadowColor = UIColor.blackColor().CGColor
        loginButton.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        loginButton.layer.shadowRadius = 3
        loginButton.layer.shadowOpacity = 0.2
        loginButton.addTarget(self, action: "loginChecks:", forControlEvents: .TouchUpInside)
        
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = loginButton.frame.size
        
        let color1 = UIColor(red: 190/256, green: 190/256, blue: 190/256, alpha: 1.0).CGColor as CGColorRef
        let color2 = UIColor(red: 255/256, green: 251/256, blue: 251/256, alpha: 0.0).CGColor as CGColorRef
      
        layer.colors = [color2, color1]
        
        layer.locations = [0.0, 0.7]
        
        loginButton.layer.insertSublayer(layer, atIndex: 0)
        
        let register = UIButton()
        
        creationFunctions.makeClearButton(register, name: "CREATE AN ACCOUNT",titleColor: UIColor.whiteColor(), location: CGRectMake((width * 2/10)/2, 7.5*height/10, width * 8/10, height/8),page: self)
        register.titleLabel?.font = UIFont(name: (register.titleLabel?.font?.fontName)!, size: 60)
        register.addTarget(self, action: "registerSwitch:", forControlEvents: .TouchUpInside)
        register.layer.borderWidth = 5
        let forgotPassword = UIButton()
        
        //String is made this way b/c it is attributed
        var forgotPasswordString = NSMutableAttributedString(string:"Forgot Password?", attributes: underlineAttributes)
        creationFunctions.makeButton(forgotPassword, name: "Forgot Password?",titleColor: UIColor.whiteColor(), location: CGRectMake((4 * width/5)/2, height * 12/20, width/5, height/20), page: self)
        forgotPassword.titleLabel?.textAlignment = .Center
        forgotPassword.setAttributedTitle(forgotPasswordString, forState: .Normal)
        forgotPassword.addTarget(self, action: "forgotPasswordSwitch:", forControlEvents: .TouchUpInside)
        forgotPassword.sizeToFit()
        
        let imageName = "MedKitLogoWhite.png"
        creationFunctions.addImage(imageName, frame: CGRectMake(width/2, 0, width/4, height/4), center:true, page: self)

        
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

/*
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
    
    
    let usernameField: UITextField = UITextField()
    let passwordField: UITextField = UITextField()
    
    func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var keychainPassword: String = ""
        var keychainUsername: String = ""
        
        if KeychainWrapper.stringForKey("Password") == nil {
            keychainPassword = ""
        }
        else{
            keychainPassword = KeychainWrapper.stringForKey("Password")!
        }
        
        
        // Makes Text Fields
        creationFunctions.makeTextField(usernameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(width*65/100, height*13/100, width*22/100, height*3/100), page:self)
        usernameField.text = keychainUsername
        
        creationFunctions.makeTextField(passwordField,backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(width*65/100, height*26/100, width*22/100, height*3/100), page:self)
        passwordField.secureTextEntry = true
        passwordField.text = keychainPassword
       
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
        loginButton.titleLabel?.font = UIFont(name: (loginButton.titleLabel?.font?.fontName)!, size: 30)

        loginButton.addTarget(self, action: "loginChecks:", forControlEvents: .TouchUpInside)
        loginButton.sizeToFit()
        
        let register = UIButton()

        creationFunctions.makeButton(register, name: "Register",titleColor: UIColor.blueColor(), location: CGRectMake(width*34/100, height*66/100, width*177/1000, height*22/1000), page: self)
        register.titleLabel?.font = UIFont(name: (register.titleLabel?.font?.fontName)!, size: 30)
        register.addTarget(self, action: "registerSwitch:", forControlEvents: .TouchUpInside)
        register.sizeToFit()
        
        let forgotPassword = UIButton()

        creationFunctions.makeButton(forgotPassword, name: "Forgot Password",titleColor: UIColor.blueColor(), location: CGRectMake(width*52/100, height*66/100, width*146/1000, height*22/1000), page: self)
        forgotPassword.titleLabel?.font = UIFont(name: (forgotPassword.titleLabel?.font?.fontName)!, size: 30)
        forgotPassword.addTarget(self, action: "forgotPasswordSwitch:", forControlEvents: .TouchUpInside)
        forgotPassword.sizeToFit()
        
        // Makes Navigation Bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "Login", color: UIColor.lightGrayColor(), forwardButton: false, backButton: false, page: self)
        
        self.configureView()
        
    }
    
    func didReceiveMemoryWarning() {
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
                verifyLogin(usernameField.text!)
            }
            
        }
    

    // Called when 'return' key pressed. return NO to ignore. Resigns first responder (closes keyboard)
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    // Called when the user click on the view (outside the UITextField). Resigns first responder (closes keyboard)
    func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
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
                    if passwordField.text == loginData.Password {
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
}
*/
