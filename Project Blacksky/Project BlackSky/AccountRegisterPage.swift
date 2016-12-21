//
//  AccountRegister.swift
//  Project BlackSky
//
//  Created by Deven  on 12/27/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit
import AWSS3
import AWSDynamoDB
import AWSSQS
import AWSSNS
import AWSCognito

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
        NSFontAttributeName : UIFont.systemFont(ofSize: 27.0),
        NSForegroundColorAttributeName : UIColor.white,
        NSUnderlineStyleAttributeName : 1] as [String : Any]
    
    var boldUnderline = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 27.0),
                         NSForegroundColorAttributeName : UIColor.white,
                         NSUnderlineStyleAttributeName : 1] as [String : Any]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets background
        creationFunctions.setBackgroundColor("MainBackground", page: self)
        
        // Adds navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 10, width: width, height: height/20)
        
        let backArrowButton =  UIButton(type: .custom)
        backArrowButton.setImage(UIImage(named: "BackArrow"), for: UIControlState())
        backArrowButton.addTarget(self, action: #selector(AccountRegisterPage.backClicked(_:)), for: .touchUpInside)
        backArrowButton.frame = CGRect(x: 0, y: 0, width: width/25, height: height/12)
        
        
        let backWord: UIButton = UIButton()
        creationFunctions.makeButton(backWord, name: "Back", titleColor: UIColor.white, location: CGRect(x: width/25, y: height/35, width: width/10, height: 34), page: self)
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 34)
        backWord.titleLabel?.text = "Back"
        backWord.titleLabel?.textAlignment = .center
        backWord.titleLabel?.textColor = UIColor.white
        backWord.backgroundColor = UIColor.clear
        backWord.addTarget(self, action: #selector(AccountRegisterPage.backClicked(_:)), for: .touchUpInside)
        backArrowButton.addSubview(backWord)
        let barButton = UIBarButtonItem(customView: backArrowButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        // Adds logo in top right
        let imageName = "MedKitLogoWhite.png"
        creationFunctions.addImage(imageName, frame: CGRect(x: 8.5 * width/10, y: 5, width: width/8, height: height/8), center:false, alpha: 0.5, page: self)
        
        // Adds white box
        let infoBox = UIView(frame: CGRect(x: width/10, y: height/4, width: width * 8/10, height: height/1.6))
        infoBox.backgroundColor = UIColor.clear
        infoBox.layer.borderWidth = 5
        infoBox.layer.borderColor = UIColor.white.cgColor
        infoBox.layer.cornerRadius = 8.0
        infoBox.clipsToBounds = true
        view.addSubview(infoBox)
        
        forgotPasswordParagraph.frame = CGRect(x: width/20, y: 0.1 * height, width: 0.8 * width, height: 0.3 * height)
        self.view.addSubview(forgotPasswordParagraph)
        forgotPasswordParagraph.text = "BETTER HEALTHCARE \nIS ONLY A FEW CLICKS AWAY..."
        forgotPasswordParagraph.font = UIFont(name: (forgotPasswordParagraph.font!.fontName), size: 44)
        forgotPasswordParagraph.textColor = UIColor.white
        forgotPasswordParagraph.backgroundColor = UIColor.clear
        
        // Creates registration button
        let register = UIButton()
        
        creationFunctions.makeClearButton(register, name: "REGISTER", titleColor: UIColor.white, location: CGRect(x: (2/3*width)/2, y: 0.7 * height, width: width * 0.4, height: height/12), page: self)
        register.titleLabel?.font = UIFont(name: (register.titleLabel?.font?.fontName)!, size: 60)
        register.layer.borderColor = UIColor.clear.cgColor
        register.layer.shadowColor = UIColor.black.cgColor
        register.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        register.layer.shadowRadius = 3
        register.layer.shadowOpacity = 0.2
        register.addTarget(self, action: #selector(AccountRegisterPage.Confirm(_:)), for: .touchUpInside)
        
        // Adds gradient to register button
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = register.frame.size
        let color1 = UIColor(red: 190/256, green: 190/256, blue: 190/256, alpha: 1.0).cgColor as CGColor
        let color2 = UIColor(red: 255/256, green: 251/256, blue: 251/256, alpha: 0.0).cgColor as CGColor
        layer.colors = [color2, color1]
        layer.locations = [0.0, 0.7]
        register.layer.insertSublayer(layer, at: 0)
        
        register.addTarget(self, action: #selector(AccountRegisterPage.Confirm(_:)), for: .touchUpInside)
        
        let haveLogin = UIButton()
        //String is made this way b/c it is attributed
        let haveLoginString = NSMutableAttributedString(string:"Have an account?", attributes: underlineAttributes)
        let signInString = NSMutableAttributedString(string: " Sign in", attributes: boldUnderline)
        haveLoginString.append(signInString)
        creationFunctions.makeButton(haveLogin, name: "Forgot Password?",titleColor: UIColor.white, location: CGRect(x: (4 * width/5)/2, y: height * 16/20, width: width/5, height: height/20), page: self)
        haveLogin.titleLabel?.textAlignment = .center
        haveLogin.setAttributedTitle(haveLoginString, for: UIControlState())
        haveLogin.addTarget(self, action: #selector(AccountRegisterPage.backClicked(_:)), for: .touchUpInside)
        haveLogin.sizeToFit()

        // Adds text fields and their cooresponding identifying labels
        
        creationFunctions.makeLabel(emailLabel, name: "EMAIL", textColor: UIColor.white, alignment:NSTextAlignment.center, frame: CGRect(x: (2/3*width)/2, y: height/3.25, width: width/5, height: height/10), page: self)
        emailLabel.font = emailLabel.font.withSize(30)
        emailLabel.sizeToFit()
        
        creationFunctions.makeTextField(emailField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (2/3*width)/2, y: height/3.25 + 50, width: width * 0.4, height: 30), page:self)
        emailField.font = emailField.font!.withSize(30)
        emailField.layer.backgroundColor = UIColor.clear.cgColor
        emailField.layer.borderColor = UIColor.clear.cgColor
        emailField.layer.borderWidth = 4.0
        let emailLayer = CALayer()
        emailLayer.borderColor = UIColor.white.cgColor
        emailLayer.frame = CGRect(x: 0, y: emailField.frame.size.height - emailField.layer.borderWidth, width: emailField.frame.size.width, height: emailField.frame.size.height)
        emailLayer.borderWidth = width
        creationFunctions.disableAutocorrect(emailField)
        emailField.layer.addSublayer(emailLayer)
        emailField.layer.masksToBounds = true
        
        creationFunctions.makeTextField(physicianIDField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (2/3*width)/2, y: height/2.5 + 50, width: width * 0.4, height: 30), page:self)
        physicianIDField.font = physicianIDField.font!.withSize(30)
        physicianIDField.layer.backgroundColor = UIColor.clear.cgColor
        physicianIDField.layer.borderColor = UIColor.clear.cgColor
        physicianIDField.layer.borderWidth = 4.0
        let physicianIDLayer = CALayer()
        physicianIDLayer.borderColor = UIColor.white.cgColor
        physicianIDLayer.frame = CGRect(x: 0, y: physicianIDField.frame.size.height - physicianIDField.layer.borderWidth, width: physicianIDField.frame.size.width, height: physicianIDField.frame.size.height)
        physicianIDLayer.borderWidth = width
        creationFunctions.disableAutocorrect(physicianIDField)
        physicianIDField.layer.addSublayer(physicianIDLayer)
        physicianIDField.layer.masksToBounds = true
        
        creationFunctions.makeLabel(physicianIDLabel, name: "PHYSICIAN ID", textColor: UIColor.white, alignment:NSTextAlignment.center, frame: CGRect(x: (2/3*width)/2, y: height/2.5, width: width/5, height: height/10), page: self)
        physicianIDLabel.font = physicianIDLabel.font.withSize(30)
        physicianIDLabel.sizeToFit()
        
        creationFunctions.makeTextField(desiredPasswordField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (2/3*width)/2, y: height/2.05 + 50, width: width * 0.4, height: 30), page:self)
        desiredPasswordField.font = desiredPasswordField.font!.withSize(30)
        desiredPasswordField.layer.backgroundColor = UIColor.clear.cgColor
        desiredPasswordField.layer.borderColor = UIColor.clear.cgColor
        desiredPasswordField.layer.borderWidth = 4.0
        let passwordIDLayer = CALayer()
        passwordIDLayer.borderColor = UIColor.white.cgColor
        passwordIDLayer.frame = CGRect(x: 0, y: desiredPasswordField.frame.size.height - desiredPasswordField.layer.borderWidth, width: desiredPasswordField.frame.size.width, height: desiredPasswordField.frame.size.height)
        passwordIDLayer.borderWidth = width
        creationFunctions.disableAutocorrect(desiredPasswordField)
        desiredPasswordField.layer.addSublayer(passwordIDLayer)
        desiredPasswordField.layer.masksToBounds = true
        
        creationFunctions.makeLabel(desiredPasswordLabel, name: "PASSWORD", textColor: UIColor.white, alignment:NSTextAlignment.center, frame: CGRect(x: (2/3*width)/2, y: height/2.05, width: width/5, height: height/10), page: self)
        desiredPasswordLabel.font = desiredPasswordLabel.font.withSize(30)
        desiredPasswordLabel.sizeToFit()
        
        creationFunctions.makeTextField(confirmPasswordField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (2/3*width)/2, y: height/1.75 + 50, width: width * 0.4, height: 30), page:self)
        confirmPasswordField.font = confirmPasswordField.font!.withSize(30)
        confirmPasswordField.layer.backgroundColor = UIColor.clear.cgColor
        confirmPasswordField.layer.borderColor = UIColor.clear.cgColor
        confirmPasswordField.layer.borderWidth = 4.0
        let confirmPasswordLayer = CALayer()
        confirmPasswordLayer.borderColor = UIColor.white.cgColor
        confirmPasswordLayer.frame = CGRect(x: 0, y: confirmPasswordField.frame.size.height - confirmPasswordField.layer.borderWidth, width: confirmPasswordField.frame.size.width, height: confirmPasswordField.frame.size.height)
        confirmPasswordLayer.borderWidth = width
        creationFunctions.disableAutocorrect(confirmPasswordField)
        confirmPasswordField.layer.addSublayer(confirmPasswordLayer)
        confirmPasswordField.layer.masksToBounds = true
        
        creationFunctions.makeLabel(confirmPasswordLabel, name: "CONFIRM PASSWORD", textColor: UIColor.white, alignment:NSTextAlignment.center, frame: CGRect(x: (2/3*width)/2, y: height/1.75, width: width/5, height: height/10), page: self)
        confirmPasswordLabel.font = confirmPasswordLabel.font.withSize(30)
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
    func Confirm(_ sender: UIButton!){
        if(desiredPasswordField.text == "" || physicianIDField.text == "" || confirmPasswordField.text == "" || emailField.text == ""){
            creationFunctions.makeAlert("Incomplete Form", message: "Please fill out all text fields", printStatement: "Form not filled out completely", page: self)
        } else {
        
//            verifyEmailAddress(emailAddressField.text!)
//            
            KeychainWrapper.setString(desiredPasswordField.text!, forKey: "Password")
<<<<<<< .merge_file_wnWNI9
<<<<<<< .merge_file_8CAhVy
<<<<<<< .merge_file_t25RmX
            KeychainWrapper.setString(physicianIDField.text!, forKey: "physicianIDField")
=======
            KeychainWrapper.setString(physicianIDField.text!, forKey: "Username")
>>>>>>> .merge_file_0IeIC0
=======
            KeychainWrapper.setString(physicianIDField.text!, forKey: "Username")
>>>>>>> .merge_file_dsWeh2
=======
            KeychainWrapper.setString(physicianIDField.text!, forKey: "Username")
>>>>>>> .merge_file_wGY8xW
//            
            let loginData = DDBLoginData() //initialize a loginData object.
//            
            PublicTag = emailField.text! //used to generate secret keys for encryption
            PrivateTag = desiredPasswordField.text!
            generateKeys() //generate public and private keys using the email as a tag
<<<<<<< .merge_file_wnWNI9
<<<<<<< .merge_file_8CAhVy
<<<<<<< .merge_file_t25RmX
            
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
=======
=======
>>>>>>> .merge_file_dsWeh2
=======
>>>>>>> .merge_file_wGY8xW
//            
            loginData?.PhysicianID = physicianIDField.text!
            loginData?.Password = desiredPasswordField.text!
            loginData?.Email = physicianIDField.text!
//            print(Decrypt2(loginData.internalName!, privateKeyFunctionParameter: findKey(PrivateTag!)!))

            loginData?.internalState = 0 //set its properties.
//            
//            
               sendLoginData(loginData!) //run the send function and push it to ddb.
//            //Verify email address? I'll(Deven) look into it. I'll also look into keeping track of the date they registered/signed in
>>>>>>> .merge_file_0IeIC0
            
            
            //Take them to main menu & automatically log them in
            let alertController = UIAlertController(title: "Congrats", message: "Account Successfully Created.", preferredStyle: .alert)
                // Initialize Actions
            let okayAction = UIAlertAction(title: "Okay", style: .default) { (action) -> Void in
                self.present(self.mainMenu, animated: true, completion: nil)
                }
                // Add Actions
                alertController.addAction(okayAction)
                // Present Alert Controller
            print("Successful register.")
            self.present(alertController, animated: true, completion: nil)
        }
        
    }
    
    func backClicked (_ sender: UIBarButtonItem!){
        self.navigationController?.popViewController(animated: true)
    }
    

    // Called when 'return' key pressed. return NO to ignore. Resigns first responder (closes keyboard)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    // Called when the user click on the view (outside the UITextField). Resigns first responder (closes keyboard)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func sendLoginData(_ loginData: DDBLoginData){
        //get object mapper in order to allow us to send a logindata object to the ddb server.
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default();

        //save allows us to "save" this new login data to the server.
        dynamoDBObjectMapper.save(loginData).continue(with: AWSExecutor.mainThread(), with:
            { (task:AWSTask!) -> AnyObject! in
                if(task.error == nil){ //no error has occurred, we have successfully sent the login info
                    print("Successful push to db.")
                } else { //an error has occurred, we have not successfully sent the login info.
                    print("Error:  \(task.error)")
                }
                
                currentUser = loginData
                return nil
            })
        
        currentUser = loginData
    }
}
