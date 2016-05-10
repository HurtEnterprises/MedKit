//
//  AccountRegister.swift
//  Project BlackSky
//
//  Created by Deven  on 12/27/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class AccountRegisterPage: UIViewController {
    let loginPage:LoginPage = LoginPage()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    let mainMenu: MainMenu = MainMenu()

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
            
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        self.view.backgroundColor = UIColor.lightGrayColor()
    }
    
    // Initializes text fields & labels
    let desiredUsernameField: UITextField = UITextField()
    let desiredUsernameLabel: UILabel = UILabel()
    
    let desiredPasswordField: UITextField = UITextField()
    let desiredPasswordLabel: UILabel = UILabel()
    
    let confirmPasswordField: UITextField = UITextField()
    let confirmPasswordLabel: UILabel = UILabel()
    
    let emailAddressField: UITextField = UITextField()
    let emailAddressLabel: UILabel = UILabel()
    
    let accessCodeField: UITextField = UITextField()
    let accessCodeLabelabel: UILabel = UILabel()
    
    let width = screenSize.width
    let height = screenSize.height
    
    override func viewDidLoad() {
        print(width)
        print(height)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Creates registration button
        let register = UIButton()
        creationFunctions.makeButton(register, name: "Register", titleColor: UIColor.blueColor(), location: CGRectMake((width*45/100), height*61/100, width*70/1000, height*11/10000), page: self) // X, Y, width, height for CGRect
        register.addTarget(self, action: "Confirm:", forControlEvents: .TouchUpInside)
        register.sizeToFit()
        
        // Adds navigation bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "Resister Account", color: UIColor.whiteColor(), forwardButton: false, backButton: true, page: self)
        
        // Adds text fields and their cooresponding identifying labels
        creationFunctions.makeLabel(desiredUsernameLabel, name: "Desired Username", textColor: UIColor.cyanColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((width*6)/100, height*11/100, width*30/100, height*26/1000), page: self)
        creationFunctions.makeTextField(desiredUsernameField, backgroundColor: UIColor.whiteColor(), frame: CGRectMake(width*65/100, height*11/100, width*30/100, height*26/1000), page: self)
        creationFunctions.disableAutocorrect(desiredUsernameField)
        
        creationFunctions.makeLabel(desiredPasswordLabel, name: "Desired Password:",textColor: UIColor.cyanColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width*6/100, height*22/100, width*30/100, height*26/1000), page:self)
        creationFunctions.makeTextField(desiredPasswordField,backgroundColor: UIColor.whiteColor(), frame: CGRectMake(width*65/100, height*22/100, width*30/100, height*26/1000), page: self)
        desiredPasswordField.secureTextEntry = true
        creationFunctions.disableAutocorrect(desiredPasswordField)
        
        creationFunctions.makeLabel(confirmPasswordLabel, name: "Confirm Password:", textColor: UIColor.cyanColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width*6/100, height*33/100, width*30/100, height*26/1000), page: self)
        creationFunctions.makeTextField(confirmPasswordField,backgroundColor: UIColor.whiteColor(), frame: CGRectMake(width*65/100, height*33/100, width*30/100, height*26/1000), page:self)
        confirmPasswordField.secureTextEntry = true
        creationFunctions.disableAutocorrect(confirmPasswordField)
        
        creationFunctions.makeLabel(emailAddressLabel, name: "Email Address:", textColor: UIColor.cyanColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width*6/100, height*44/100, width*30/100, height*26/1000), page: self)
        creationFunctions.makeTextField(emailAddressField, backgroundColor: UIColor.whiteColor(),frame: CGRectMake(width*65/100, height*44/100, width*30/100, height*26/1000), page: self)
        creationFunctions.disableAutocorrect(emailAddressField)

        
        creationFunctions.makeLabel(accessCodeLabelabel, name: "Access Code:",textColor: UIColor.cyanColor(), alignment: NSTextAlignment.Center,  frame: CGRectMake(width*6/100, height*55/100, width*30/100, height*26/1000), page: self)
        creationFunctions.makeTextField(accessCodeField,backgroundColor: UIColor.whiteColor(), frame: CGRectMake(width*65/100, height*55/100, width*30/100, height*26/1000), page: self)
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Fuctions, methods, and the like
    
    // Access code is there cause theoretically we'll give them one valid for some time to register (so everyone can't just register)
    // Also, hoping with an access code (that we can cross reference with email?) we can avoid having them put in all their identifying information and it'll just automatically add and they can edit as they wish. I'll (Deven) look into all this stuff
    
    // Runs checks if register button pressed
    func Confirm(sender: UIButton!){
        print(desiredUsernameField.text)
        print(desiredPasswordField.text)
        print(confirmPasswordField.text)
        print(accessCodeField.text)
        print(emailAddressField.text)
        
        
        
        if(desiredPasswordField.text == "" || desiredUsernameField.text == "" || confirmPasswordField.text == "" || accessCodeField.text == ""){
            creationFunctions.makeAlert("Incomplete Form", message: "Please fill out all text fields", printStatement: "Form not filled out completely", page: self)
        } else {
            
     //       verifyEmailAddress(emailAddressField.text!)
            
            KeychainWrapper.setString(desiredPasswordField.text!, forKey: "Password")
            KeychainWrapper.setString(desiredUsernameField.text!, forKey: "Username")
            
            let loginData = DDBLoginData() //initialize a loginData object.
            
            PublicTag = emailAddressField.text! //used to generate secret keys for encryption
            PrivateTag = desiredPasswordField.text!
            generateKeys() //generate public and private keys using the email as a tag
            
            loginData.Username = Encrypt2(desiredUsernameField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
            loginData.Password = Encrypt2(desiredPasswordField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
            loginData.email = Encrypt2(emailAddressField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
            loginData.internalName = Encrypt2(accessCodeField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
            print(Decrypt2(loginData.internalName!, privateKeyFunctionParameter: findKey(PrivateTag!)!))

            loginData.internalState = 0 //set its properties.
            
            
            sendLoginData(loginData) //run the send function and push it to ddb.
            //Verify email address? I'll(Deven) look into it. I'll also look into keeping track of the date they registered/signed in
            
            
            //Take them to main menu & automatically log them in
            let alertController = UIAlertController(title: "Congrats", message: "Account Successfully Created.", preferredStyle: .Alert)
                // Initialize Actions
            let okayAction = UIAlertAction(title: "Okay", style: .Default) { (action) -> Void in
                self.presentViewController(self.mainMenu, animated: true, completion: nil)
                }
                // Add Actions
                alertController.addAction(okayAction)
                // Present Alert Controller
            print("Successful regiser.")
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    func backClicked (sender: UIBarButtonItem!){
        self.dismissViewControllerAnimated(true, completion: {});
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
    
    func sendLoginData(loginData: DDBLoginData){
        //get object mapper in order to allow us to send a logindata object to the ddb server.
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper();
        
        //save allows us to "save" this new login data to the server.
        dynamoDBObjectMapper.save(loginData).continueWithExecutor(AWSExecutor.mainThreadExecutor(), withBlock:
            { (task:AWSTask!) -> AnyObject! in
                if(task.error == nil){ //no error has occurred, we have successfully sent the login info
                    print("Successful push to db.")
                } else { //an error has occurred, we have not successfully sent the login info.
                    print("Error:  \(task.error)")
                }
                
                return nil
            })
    }
}
