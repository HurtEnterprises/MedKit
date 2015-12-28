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
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    
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
        
        
        //TODO: Redo the buttons so they are placed and the length is chosen based upon the legnth of the word
        // Makes login, register, and forgot password buttons
        let Login = UIButton()
        makeButton(Login, name: "Login", location: CGRectMake((screenSize.width-120)/2, 5*screenSize.width/6, 120, 30))
        Login.addTarget(self, action: "loginChecks:", forControlEvents: .TouchUpInside)
        
        let register = UIButton()
        makeButton(register, name: "Register", location: CGRectMake((screenSize.width-120)/2-100, 8*screenSize.width/9, 120, 30))
        register.addTarget(self, action: "registerSwitch:", forControlEvents: .TouchUpInside)
        
        let forgotPassword = UIButton()
        makeButton(forgotPassword, name: "Forgot Password", location: CGRectMake((screenSize.width-150)/2+100, 8*screenSize.width/9, 150, 30))
        forgotPassword.addTarget(self, action: "forgotPasswordSwitch:", forControlEvents: .TouchUpInside)
        
        
        // Makes Text Fields
        let username: UITextField = UITextField()
        makeTextField(username, frame: CGRectMake((screenSize.width-300)/2 + 300, 175, 300, 35))
    
        
        let password: UITextField = UITextField()
        makeTextField(password, frame: CGRectMake((screenSize.width-300)/2 + 300, 350, 300, 35))
        
       
        // Makes Text Labels
        let dynamicLabel: UILabel = UILabel()
        dynamicLabel.frame = CGRectMake(50, 150, 200, 21)
        dynamicLabel.backgroundColor = UIColor.orangeColor()
        dynamicLabel.textColor = UIColor.blackColor()
        dynamicLabel.textAlignment = NSTextAlignment.Center
        dynamicLabel.text = "test label"
        self.view.addSubview(dynamicLabel)
        
        self.configureView()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Functions
    
    func loginChecks(sender: UIButton!) {
        let alertController = UIAlertController(title: "Alert", message: "Is this working?", preferredStyle: .Alert)
        // Initialize Actions
        let yesAction = UIAlertAction(title: "Yes", style: .Default) { (action) -> Void in
            print("Working.")
        }
        let noAction = UIAlertAction(title: "No", style: .Default) { (action) -> Void in
            print("You say it isn't, but it is.")
        }
        // Add Actions
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        // Present Alert Controller
        self.presentViewController(alertController, animated: true, completion: nil)
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

