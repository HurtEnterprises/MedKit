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
    }
    
    // Initializes text fields & labels
    let emailField: UITextField = UITextField()
    let emailLabel: UILabel = UILabel()
    
    let desiredPasswordField: UITextField = UITextField()
    let desiredPasswordLabel: UILabel = UILabel()
    
    let confirmPasswordField: UITextField = UITextField()
    let confirmPasswordLabel: UILabel = UILabel()
    
    let physicianIDField: UITextField = UITextField()
    let physicianIDLabel: UILabel = UILabel()
    
    let forgotPasswordParagraph: UITextView = UITextView()
    
    let width = screenSize.width
    let height = screenSize.height
    
    var underlineAttributes = [
        NSFontAttributeName : UIFont.systemFontOfSize(27.0),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSUnderlineStyleAttributeName : 1]
    
    var boldUnderline = [NSFontAttributeName : UIFont.boldSystemFontOfSize(27.0),
                         NSForegroundColorAttributeName : UIColor.whiteColor(),
                         NSUnderlineStyleAttributeName : 1]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets background
        creationFunctions.setBackgroundColor("MainBackground", page: self)
        
        // Adds navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.frame = CGRectMake(0, 10, width, height/20)
        
        let backArrowButton =  UIButton(type: .Custom)
        backArrowButton.setImage(UIImage(named: "BackArrow"), forState: .Normal)
        backArrowButton.addTarget(self, action: "backClicked:", forControlEvents: .TouchUpInside)
        backArrowButton.frame = CGRectMake(0, 0, width/25, height/12)
        
        
        let backWord: UIButton = UIButton()
        creationFunctions.makeButton(backWord, name: "Back", titleColor: UIColor.whiteColor(), location: CGRectMake(width/25, height/35, width/10, 34), page: self)
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 34)
        backWord.titleLabel?.text = "Back"
        backWord.titleLabel?.textAlignment = .Center
        backWord.titleLabel?.textColor = UIColor.whiteColor()
        backWord.backgroundColor = UIColor.clearColor()
        backWord.addTarget(self, action: "backClicked:", forControlEvents: .TouchUpInside)
        backArrowButton.addSubview(backWord)
        let barButton = UIBarButtonItem(customView: backArrowButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        // Adds logo in top right
        let imageName = "MedKitLogoWhite.png"
        creationFunctions.addImage(imageName, frame: CGRectMake(8.5 * width/10, 5, width/8, height/8), center:false, alpha: 0.5, page: self)
        
        // Adds white box
        let infoBox = UIView(frame: CGRectMake(width/10, height/4, width * 8/10, height/1.6))
        infoBox.backgroundColor = UIColor.clearColor()
        infoBox.layer.borderWidth = 5
        infoBox.layer.borderColor = UIColor.whiteColor().CGColor
        infoBox.layer.cornerRadius = 8.0
        infoBox.clipsToBounds = true
        view.addSubview(infoBox)
        
        forgotPasswordParagraph.frame = CGRectMake(width/20, 0.1 * height, 0.8 * width, 0.3 * height)
        self.view.addSubview(forgotPasswordParagraph)
        forgotPasswordParagraph.text = "BETTER HEALTHCARE \nIS ONLY A FEW CLICKS AWAY..."
        forgotPasswordParagraph.font = UIFont(name: (forgotPasswordParagraph.font!.fontName), size: 44)
        forgotPasswordParagraph.textColor = UIColor.whiteColor()
        forgotPasswordParagraph.backgroundColor = UIColor.clearColor()
        
        // Creates registration button
        let register = UIButton()
        
        creationFunctions.makeClearButton(register, name: "REGISTER", titleColor: UIColor.whiteColor(), location: CGRectMake((2/3*width)/2, 0.7 * height, width * 0.4, height/12), page: self)
        register.titleLabel?.font = UIFont(name: (register.titleLabel?.font?.fontName)!, size: 60)
        register.layer.borderColor = UIColor.clearColor().CGColor
        register.layer.shadowColor = UIColor.blackColor().CGColor
        register.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        register.layer.shadowRadius = 3
        register.layer.shadowOpacity = 0.2
        register.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        
        // Adds gradient to register button
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = register.frame.size
        let color1 = UIColor(red: 190/256, green: 190/256, blue: 190/256, alpha: 1.0).CGColor as CGColorRef
        let color2 = UIColor(red: 255/256, green: 251/256, blue: 251/256, alpha: 0.0).CGColor as CGColorRef
        layer.colors = [color2, color1]
        layer.locations = [0.0, 0.7]
        register.layer.insertSublayer(layer, atIndex: 0)
        
        register.addTarget(self, action: "Confirm:", forControlEvents: .TouchUpInside)
        
        let haveLogin = UIButton()
        //String is made this way b/c it is attributed
        let haveLoginString = NSMutableAttributedString(string:"Have an account?", attributes: underlineAttributes)
        let signInString = NSMutableAttributedString(string: " Sign in", attributes: boldUnderline)
        haveLoginString.appendAttributedString(signInString)
        creationFunctions.makeButton(haveLogin, name: "Forgot Password?",titleColor: UIColor.whiteColor(), location: CGRectMake((4 * width/5)/2, height * 16/20, width/5, height/20), page: self)
        haveLogin.titleLabel?.textAlignment = .Center
        haveLogin.setAttributedTitle(haveLoginString, forState: .Normal)
        haveLogin.addTarget(self, action: "backClicked:", forControlEvents: .TouchUpInside)
        haveLogin.sizeToFit()

        // Adds text fields and their cooresponding identifying labels
        
        creationFunctions.makeLabel(emailLabel, name: "EMAIL", textColor: UIColor.whiteColor(), alignment:NSTextAlignment.Center, frame: CGRectMake((2/3*width)/2, height/3.25, width/5, height/10), page: self)
        emailLabel.font = emailLabel.font.fontWithSize(30)
        emailLabel.sizeToFit()
        
        creationFunctions.makeTextField(emailField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((2/3*width)/2, height/3.25 + 50, width * 0.4, 30), page:self)
        emailField.font = emailField.font!.fontWithSize(30)
        emailField.layer.backgroundColor = UIColor.clearColor().CGColor
        emailField.layer.borderColor = UIColor.clearColor().CGColor
        emailField.layer.borderWidth = 4.0
        let emailLayer = CALayer()
        emailLayer.borderColor = UIColor.whiteColor().CGColor
        emailLayer.frame = CGRect(x: 0, y: emailField.frame.size.height - emailField.layer.borderWidth, width: emailField.frame.size.width, height: emailField.frame.size.height)
        emailLayer.borderWidth = width
        creationFunctions.disableAutocorrect(emailField)
        emailField.layer.addSublayer(emailLayer)
        emailField.layer.masksToBounds = true
        
        creationFunctions.makeTextField(physicianIDField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((2/3*width)/2, height/2.5 + 50, width * 0.4, 30), page:self)
        physicianIDField.font = physicianIDField.font!.fontWithSize(30)
        physicianIDField.layer.backgroundColor = UIColor.clearColor().CGColor
        physicianIDField.layer.borderColor = UIColor.clearColor().CGColor
        physicianIDField.layer.borderWidth = 4.0
        let physicianIDLayer = CALayer()
        physicianIDLayer.borderColor = UIColor.whiteColor().CGColor
        physicianIDLayer.frame = CGRect(x: 0, y: physicianIDField.frame.size.height - physicianIDField.layer.borderWidth, width: physicianIDField.frame.size.width, height: physicianIDField.frame.size.height)
        physicianIDLayer.borderWidth = width
        creationFunctions.disableAutocorrect(physicianIDField)
        physicianIDField.layer.addSublayer(physicianIDLayer)
        physicianIDField.layer.masksToBounds = true
        
        creationFunctions.makeLabel(physicianIDLabel, name: "PHYSICIAN ID", textColor: UIColor.whiteColor(), alignment:NSTextAlignment.Center, frame: CGRectMake((2/3*width)/2, height/2.5, width/5, height/10), page: self)
        physicianIDLabel.font = physicianIDLabel.font.fontWithSize(30)
        physicianIDLabel.sizeToFit()
        
        creationFunctions.makeTextField(desiredPasswordField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((2/3*width)/2, height/2.05 + 50, width * 0.4, 30), page:self)
        desiredPasswordField.font = desiredPasswordField.font!.fontWithSize(30)
        desiredPasswordField.layer.backgroundColor = UIColor.clearColor().CGColor
        desiredPasswordField.layer.borderColor = UIColor.clearColor().CGColor
        desiredPasswordField.layer.borderWidth = 4.0
        let passwordIDLayer = CALayer()
        passwordIDLayer.borderColor = UIColor.whiteColor().CGColor
        passwordIDLayer.frame = CGRect(x: 0, y: desiredPasswordField.frame.size.height - desiredPasswordField.layer.borderWidth, width: desiredPasswordField.frame.size.width, height: desiredPasswordField.frame.size.height)
        passwordIDLayer.borderWidth = width
        creationFunctions.disableAutocorrect(desiredPasswordField)
        desiredPasswordField.layer.addSublayer(passwordIDLayer)
        desiredPasswordField.layer.masksToBounds = true
        
        creationFunctions.makeLabel(desiredPasswordLabel, name: "PASSWORD", textColor: UIColor.whiteColor(), alignment:NSTextAlignment.Center, frame: CGRectMake((2/3*width)/2, height/2.05, width/5, height/10), page: self)
        desiredPasswordLabel.font = desiredPasswordLabel.font.fontWithSize(30)
        desiredPasswordLabel.sizeToFit()
        
        creationFunctions.makeTextField(confirmPasswordField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((2/3*width)/2, height/1.75 + 50, width * 0.4, 30), page:self)
        confirmPasswordField.font = confirmPasswordField.font!.fontWithSize(30)
        confirmPasswordField.layer.backgroundColor = UIColor.clearColor().CGColor
        confirmPasswordField.layer.borderColor = UIColor.clearColor().CGColor
        confirmPasswordField.layer.borderWidth = 4.0
        let confirmPasswordLayer = CALayer()
        confirmPasswordLayer.borderColor = UIColor.whiteColor().CGColor
        confirmPasswordLayer.frame = CGRect(x: 0, y: confirmPasswordField.frame.size.height - confirmPasswordField.layer.borderWidth, width: confirmPasswordField.frame.size.width, height: confirmPasswordField.frame.size.height)
        confirmPasswordLayer.borderWidth = width
        creationFunctions.disableAutocorrect(confirmPasswordField)
        confirmPasswordField.layer.addSublayer(confirmPasswordLayer)
        confirmPasswordField.layer.masksToBounds = true
        
        creationFunctions.makeLabel(confirmPasswordLabel, name: "CONFIRM PASSWORD", textColor: UIColor.whiteColor(), alignment:NSTextAlignment.Center, frame: CGRectMake((2/3*width)/2, height/1.75, width/5, height/10), page: self)
        confirmPasswordLabel.font = confirmPasswordLabel.font.fontWithSize(30)
        confirmPasswordLabel.sizeToFit()
     
        
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
        if(desiredPasswordField.text == "" || physicianIDField.text == "" || confirmPasswordField.text == "" || emailField.text == ""){
            creationFunctions.makeAlert("Incomplete Form", message: "Please fill out all text fields", printStatement: "Form not filled out completely", page: self)
        } else {
        
//            verifyEmailAddress(emailAddressField.text!)
//            
            KeychainWrapper.setString(desiredPasswordField.text!, forKey: "Password")
            KeychainWrapper.setString(physicianIDField.text!, forKey: "physicianIDField")
//            
//            let loginData = DDBLoginData() //initialize a loginData object.
//            
            PublicTag = emailField.text! //used to generate secret keys for encryption
            PrivateTag = desiredPasswordField.text!
            generateKeys() //generate public and private keys using the email as a tag
            
      //      loginData.physicianIDField = Encrypt2(physicianIDField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
        //    loginData.Password = Encrypt2(desiredPasswordField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
          //  loginData.email = Encrypt2(emailField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
        
//            print(Decrypt2(loginData.internalName!, privateKeyFunctionParameter: findKey(PrivateTag!)!))
//            for testing purposes 
            
           // loginData.internalState = 0 //set its properties.
//            
//            
          //  sendLoginData(loginData) //run the send function and push it to ddb.
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
        self.navigationController?.popViewControllerAnimated(true)
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
    
//    func sendLoginData(loginData: DDBLoginData){
//        //get object mapper in order to allow us to send a logindata object to the ddb server.
//        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper();
//        
//        //save allows us to "save" this new login data to the server.
//        dynamoDBObjectMapper.save(loginData).continueWithExecutor(AWSExecutor.mainThreadExecutor(), withBlock:
//            { (task:AWSTask!) -> AnyObject! in
//                if(task.error == nil){ //no error has occurred, we have successfully sent the login info
//                    print("Successful push to db.")
//                } else { //an error has occurred, we have not successfully sent the login info.
//                    print("Error:  \(task.error)")
//                }
//                
//                return nil
//            })
//    }
}
