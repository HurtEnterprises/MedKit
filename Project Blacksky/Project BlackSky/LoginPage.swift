//
//  LoginPage.swift
//  Project BlackSky
//
//  Created by Deven  on 12/26/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit
import AWSS3
import AWSDynamoDB
import AWSSQS
import AWSSNS
import AWSCognito
import GoogleAPIClient
import GTMOAuth2

class LoginPage: UIViewController {
    
    let mainMenu: MainMenu = MainMenu()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    let delegate: AppDelegate = AppDelegate()
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        self.view.backgroundColor = UIColor.cyan
    }
    
    let usernameField: UITextField = UITextField()
    let passwordField: UITextField = UITextField()
    
    var underlineAttributes = [
        NSFontAttributeName : UIFont.systemFont(ofSize: 27.0),
        NSForegroundColorAttributeName : UIColor.white,
        NSUnderlineStyleAttributeName : 1] as [String : Any]

    
    
   /* override func viewDidAppear(_ animated: Bool) {
        if let authorizer = service.authorizer,
            let canAuth = authorizer.canAuthorize , canAuth {
            fetchEvents()
        } else {
            present(
                createAuthController(),
                animated: true,
                completion: nil
            )
        }
    }
    // Construct a query and get a list of upcoming events from the user calendar
    func fetchEvents() {
        let query = GTLQueryCalendar.queryForEventsList(withCalendarId: "primary")
        query?.maxResults = 10
        query?.timeMin = GTLDateTime(date: Date(), timeZone: TimeZone.autoupdatingCurrent)
        query?.singleEvents = true
        query?.orderBy = kGTLCalendarOrderByStartTime
        service.executeQuery(
            query!,
            delegate: self,
            didFinish: #selector(LoginPage.displayResultWithTicket(_:finishedWithObject:error:))
        )
    }
    
    // Display the start dates and event summaries in the UITextView
    func displayResultWithTicket(
        _ ticket: GTLServiceTicket,
        finishedWithObject response : GTLCalendarEvents,
                           error : NSError?) {
        
        if let error = error {
            showAlert("Error", message: error.localizedDescription)
            return
        }
        
        var eventString = ""
        
        if let events = response.items() , !events.isEmpty {
            for event in events as! [GTLCalendarEvent] {
                let start : GTLDateTime! = event.start.dateTime ?? event.start.date
                let startString = DateFormatter.localizedString(
                    from: start.date,
                    dateStyle: .short,
                    timeStyle: .short
                )
                eventString += "\(startString) - \(event.summary)\n"
            }
        } else {
            eventString = "No upcoming events found."
        }
        
        print(eventString)
    }
    
    // Creates the auth controller for authorizing access to Google Calendar API
    fileprivate func createAuthController() -> GTMOAuth2ViewControllerTouch {
        let scopeString = scopes.joined(separator: " ")
        return GTMOAuth2ViewControllerTouch(
            scope: scopeString,
            clientID: kClientID,
            clientSecret: nil,
            keychainItemName: kKeychainItemName,
            delegate: self,
            finishedSelector: #selector(LoginPage.viewController(_:finishedWithAuth:error:))
        )
    }
    
    // Handle completion of the authorization process, and update the Google Calendar API
    // with the new credentials.
    func viewController(_ vc : UIViewController,
                        finishedWithAuth authResult : GTMOAuth2Authentication, error : NSError?) {
        
        if let error = error {
            service.authorizer = nil
            showAlert("Authentication Error", message: error.localizedDescription)
            return
        }
        
        service.authorizer = authResult
        dismiss(animated: true, completion: nil)
    }
   */


    
    // Helper for showing an alert
    func showAlert(_ title : String, message: String) {
        let alert = UIAlertView(
            title: title,
            message: message,
            delegate: nil,
            cancelButtonTitle: "OK"
        )
        alert.show()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // NOTES: Views must be added in a specific order as they stack (Background, boxes, all labels and textboxes)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 10, width: width, height: height/10)
        //let backButton: UIBarButtonItem = UIBarButtonItem(title: "BACK", style: UIBarButtonItemStyle.Bordered, target: self, action: nil)
        let navBgImage:UIImage = UIImage(named: "BackArrow")!
        
        let backButton:UIBarButtonItem = UIBarButtonItem(image:navBgImage, style:.plain, target:self, action:"backButtonPressed:")
        navigationItem.backBarButtonItem = backButton
        self.navigationController?.navigationItem.leftBarButtonItem?.image = UIImage(named: "BackArrow")!
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 20, width: width, height: height/10)

        creationFunctions.setBackgroundColor("MainBackground", page: self)
        
        let infoBox = UIView(frame: CGRect(x: width/10, y: height/4, width: width * 8/10, height: height/2.35))
        infoBox.backgroundColor = UIColor.clear
        infoBox.layer.borderWidth = 5
        infoBox.layer.borderColor = UIColor.white.cgColor
        infoBox.layer.cornerRadius = 8.0
        infoBox.clipsToBounds = true
        view.addSubview(infoBox)
 
        // Makes Text Fields
        
        
        creationFunctions.makeTextField(usernameField, backgroundColor: UIColor.lightGray, frame: CGRect(x: width/4, y: height/3.5 + 50, width: width/2, height: 30), page:self)
        usernameField.font = usernameField.font!.withSize(30)
        usernameField.text = "123456"
        usernameField.layer.backgroundColor = UIColor.clear.cgColor
        usernameField.layer.borderColor = UIColor.clear.cgColor
        usernameField.layer.borderWidth = 2.0
        let usernameBorder = CALayer()
        usernameBorder.borderColor = UIColor.white.cgColor
        usernameBorder.frame = CGRect(x: 0, y: usernameField.frame.size.height - usernameField.layer.borderWidth, width:  usernameField.frame.size.width, height: usernameField.frame.size.height)
        usernameBorder.borderWidth = width
        usernameField.layer.addSublayer(usernameBorder)
        usernameField.layer.masksToBounds = true
        
        creationFunctions.makeTextField(passwordField,backgroundColor: UIColor.lightGray, frame: CGRect(x: width/4, y: height/2.5 + 50, width: width/2, height: 30), page:self)
        passwordField.font = passwordField.font!.withSize(30)
        passwordField.text = "Testing123!"
        passwordField.isSecureTextEntry = true
        creationFunctions.disableAutocorrect(passwordField)
        passwordField.layer.backgroundColor = UIColor.clear.cgColor
        passwordField.layer.borderColor = UIColor.clear.cgColor
        passwordField.layer.borderWidth = 2.0
        let passwordBorder = CALayer()
        passwordBorder.borderColor = UIColor.white.cgColor
        passwordBorder.frame = CGRect(x: 0, y: passwordField.frame.size.height - passwordField.layer.borderWidth, width:  passwordField.frame.size.width, height: passwordField.frame.size.height)
        passwordBorder.borderWidth = width
        passwordField.layer.addSublayer(passwordBorder)
        passwordField.layer.masksToBounds = true
        
        // Makes Text Labels
        let usernameLabel: UILabel = UILabel()
        creationFunctions.makeLabel(usernameLabel, name: "USERNAME", textColor: UIColor.white, alignment:NSTextAlignment.center, frame: CGRect(x: width/4, y: height/3.5, width: width/5, height: height/10), page: self)
        usernameLabel.font = usernameLabel.font.withSize(30)
        usernameLabel.sizeToFit()

        let passwordLabel: UILabel = UILabel()
        creationFunctions.makeLabel(passwordLabel, name: "PASSWORD", textColor: UIColor.white, alignment:NSTextAlignment.center, frame: CGRect(x: width/4, y: height/2.5, width: width/5, height: height/10), page: self)
        passwordLabel.font = passwordLabel.font.withSize(30)
        passwordLabel.sizeToFit()
        //TODO: Redo the buttons so they are placed and the length is chosen based upon the legnth of the word
        
        // Makes login, register, and forgot password button.
        let loginButton = UIButton()
        creationFunctions.makeClearButton(loginButton, name: "LOGIN", titleColor: UIColor.white, location: CGRect(x: (2/3*width)/2,  y: height/2, width: width/3, height: height/12), page: self)
        loginButton.titleLabel?.font = UIFont(name: (loginButton.titleLabel?.font?.fontName)!, size: 60)
        loginButton.layer.borderColor = UIColor.clear.cgColor
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        loginButton.layer.shadowRadius = 3
        loginButton.layer.shadowOpacity = 0.2
        loginButton.addTarget(self, action: #selector(LoginPage.loginChecks(_:)), for: .touchUpInside)
        // Gradient stuff for login button
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = loginButton.frame.size
        let color1 = UIColor(red: 190/256, green: 190/256, blue: 190/256, alpha: 1.0).cgColor as CGColor
        let color2 = UIColor(red: 255/256, green: 251/256, blue: 251/256, alpha: 0.0).cgColor as CGColor
        layer.colors = [color2, color1]
        layer.locations = [0.0, 0.7]
        loginButton.layer.insertSublayer(layer, at: 0)
        
        let register = UIButton()
        
        creationFunctions.makeClearButton(register, name: "CREATE AN ACCOUNT",titleColor: UIColor.white, location: CGRect(x: (width * 2/10)/2, y: 7.5*height/10, width: width * 8/10, height: height/8),page: self)
        register.titleLabel?.font = UIFont(name: (register.titleLabel?.font?.fontName)!, size: 60)
        register.addTarget(self, action: #selector(LoginPage.registerSwitch(_:)), for: .touchUpInside)
        register.layer.borderWidth = 5
        let forgotPassword = UIButton()
        
        //String is made this way b/c it is attributed
        var forgotPasswordString = NSMutableAttributedString(string:"Forgot Password?", attributes: underlineAttributes)
        creationFunctions.makeButton(forgotPassword, name: "Forgot Password?",titleColor: UIColor.white, location: CGRect(x: (4 * width/5)/2, y: height * 12/20, width: width/5, height: height/20), page: self)
        forgotPassword.titleLabel?.textAlignment = .center
        forgotPassword.setAttributedTitle(forgotPasswordString, for: UIControlState())
        forgotPassword.addTarget(self, action: #selector(LoginPage.forgotPasswordSwitch(_:)), for: .touchUpInside)
        forgotPassword.sizeToFit()
        
        let imageName = "MedKitLogoWhite.png"
        creationFunctions.addImage(imageName, frame: CGRect(x: width/2, y: 0, width: width/4, height: height/4), center:true, alpha: 1.0, page: self)
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Private Functions
    
    //Login Verification
    func loginChecks(_ sender: UIButton!){
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    // Called when the user click on the view (outside the UITextField). Resigns first responder (closes keyboard)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Transitions
    
    // Changes to Register Page
    func registerSwitch(_ sender: UIButton!) {
        let AccountRegister:AccountRegisterPage = AccountRegisterPage()
        self.navigationController?.pushViewController(AccountRegister, animated: true)
        //self.presentViewController(AccountRegister, animated: true, completion: nil)
    }
    
    // Changes to Feorgot Password Page
    func forgotPasswordSwitch(_ sender: UIButton!) {
        let ForgotPassword:ForgotPasswordPage = ForgotPasswordPage()
        self.navigationController?.pushViewController(ForgotPassword, animated: true)
    }
    
    func verifyLogin(_ username: String){
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default();
        
        let task: AWSTask! = dynamoDBObjectMapper.load(DDBLoginData.self, hashKey: username, rangeKey: nil)
        
        task.continue(with: AWSExecutor.mainThread(), with: { (task:AWSTask!) -> AnyObject! in
            if (task.error == nil) { //no error
                if (task.result != nil) {//the item exists in the db; the username exists.
                    print("Found username")
                    let loginData = task.result as! DDBLoginData //get the login data object we received
                     
                    //compare the password on the db to the password they supplied:
                    if self.passwordField.text == loginData.Password {
                        print("Valid. Signed in.")
                        //self.presentViewController(self.mainMenu, animated: true, completion: nil)
                        self.navigationController?.pushViewController(self.mainMenu, animated: true)
                    } else {
                        self.creationFunctions.makeAlert("Wrong Passowrd", message: "You inputted the incorrect password.", printStatement: "Wrong Password.", page: self)
                    }
                    currentUser = loginData
                }
            } else {
                print("Error: \(task.error)")
            }
            return nil
        })
        
    }
    
}

