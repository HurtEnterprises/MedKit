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
//        if let detail = self.detailItem {
//            if let label = self.detailDescriptionLabel {
//                label.text = detail.description
//            }
//        }
    }
    
    // Initializes text fields
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Gets size of screen
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        // Creates registration button
        let register = UIButton()
        makeButton(register, name: "Register", location: CGRectMake((screenSize.width-120)/2, screenSize.height/2 + 300, 120, 30))// X, Y, width, height
        register.addTarget(self, action: "Confirm:", forControlEvents: .TouchUpInside)
        
        // Adds navigation bar (will pullout as function in the great UI refactor of 2016)
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
        navigationBar.backgroundColor = UIColor.whiteColor()
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = "Register Account"
        // Create left navigation item
        let leftButton =  UIBarButtonItem(title: "Back", style:   UIBarButtonItemStyle.Plain, target: self, action: "backClicked:")
        // Create two buttons for the navigation item
        navigationItem.leftBarButtonItem = leftButton
        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]
        // Make the navigation bar a subview of the current view controller
        self.view.addSubview(navigationBar)
        
        // Adds text fields and their cooresponding identifying labels
        // TODO(DEVEN): Make passwords show up as stars
        makeLabel(desiredUsernameLabel, name: "Desired Username:", frame: CGRectMake((screenSize.width-300)/2 - 300, 150, 300, 35))
        makeTextField(desiredUsernameField, frame: CGRectMake((screenSize.width-300)/2 + 300, 150, 300, 35))
        
        makeLabel(desiredPasswordLabel, name: "Desired Password:", frame: CGRectMake((screenSize.width-300)/2 - 300, 350, 300, 35))
        makeTextField(desiredPasswordField, frame: CGRectMake((screenSize.width-300)/2 + 300, 300, 300, 35))
        
        makeLabel(confirmPasswordLabel, name: "Confirm Password:", frame: CGRectMake((screenSize.width-300)/2 - 300, 450, 300, 35))
        makeTextField(confirmPasswordField, frame: CGRectMake((screenSize.width-300)/2 + 300, 450, 300, 35))
        
        makeLabel(emailAddressLabel, name: "Email Address:", frame: CGRectMake((screenSize.width-300)/2 - 300, 600, 300, 35))
        makeTextField(emailAddressField, frame: CGRectMake((screenSize.width-300)/2 + 300, 600, 300, 35))
        
        makeLabel(accessCodeLabelabel, name: "Access Code:", frame: CGRectMake((screenSize.width-300)/2 - 300, 750, 300, 35))
        makeTextField(accessCodeField, frame: CGRectMake((screenSize.width-300)/2 + 300, 750, 300, 35))
        
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
            loginPage.makeAlert("Incomplete Form", message: "Please fill out all text fields", printStatement: "Form not filled out completely")
        } else {
            let loginData = DDBLoginData() //initialize a loginData object.
            
            Tag = emailAddressField.text! //used to generate secret keys for encryption
            generateKeys() //generate public and private keys using the email as a tag
            
            loginData.Username = Encrypt2(desiredUsernameField.text!)
            loginData.Password = Encrypt2(desiredPasswordField.text!)
            loginData.email = Encrypt2(emailAddressField.text!)
            loginData.internalName = Encrypt2(accessCodeField.text!)
            loginData.internalState = 0 //set its properties.
            
            
            sendLoginData(loginData) //run the send function and push it to ddb.
            //Verify email address? I'll(Deven) look into it. I'll also look into keeping track of the date they registered/signed in
            loginPage.makeAlert("Congrats", message: "You have successfully created an account. You will automaticall be logged in.", printStatement: "New User created")
            // Take them to next page we have after & automatically log them in
        }

    }
    
    func backClicked (sender: UIBarButtonItem!){
        self.presentViewController(loginPage, animated: true, completion: nil)
    }
    
    // Creates Button
    func makeButton(button: UIButton, name: String, location: CGRect){
        button.setTitle(name, forState: .Normal)
        button.setTitleColor(UIColor.blueColor(), forState: .Normal)
        button.frame = location // X, Y, width, height
        self.view.addSubview(button)
    }
    
    // Makes a Text Field
    func makeTextField(field: UITextField, frame: CGRect){
        field.frame = frame
        field.backgroundColor = UIColor.whiteColor()
        ()
        self.view.addSubview(field)
    }
    
    // Makes a label
    func makeLabel(label: UILabel, name: String, frame: CGRect){
        label.frame = frame
        label.textColor = UIColor.cyanColor()
        label.textAlignment = NSTextAlignment.Center
        label.text = name
        self.view.addSubview(label)
        
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
