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
    
    private let kKeychainItemName = "Google Calendar API"
    private let kClientID = "45994898732-dkpdmhmqh68nhrlt2sgg7u62dhv41utu.apps.googleusercontent.com"
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    private let scopes = [kGTLAuthScopeCalendarReadonly]
    
    private let service = GTLServiceCalendar()
    
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
    
    
    override func viewDidAppear(animated: Bool) {
        if let authorizer = service.authorizer,
            canAuth = authorizer.canAuthorize where canAuth {
            fetchEvents()
        } else {
            presentViewController(
                createAuthController(),
                animated: true,
                completion: nil
            )
        }
    }
    // Construct a query and get a list of upcoming events from the user calendar
    func fetchEvents() {
        let query = GTLQueryCalendar.queryForEventsListWithCalendarId("primary")
        query.maxResults = 10
        query.timeMin = GTLDateTime(date: NSDate(), timeZone: NSTimeZone.localTimeZone())
        query.singleEvents = true
        query.orderBy = kGTLCalendarOrderByStartTime
        service.executeQuery(
            query,
            delegate: self,
            didFinishSelector: "displayResultWithTicket:finishedWithObject:error:"
        )
    }
    
    // Display the start dates and event summaries in the UITextView
    func displayResultWithTicket(
        ticket: GTLServiceTicket,
        finishedWithObject response : GTLCalendarEvents,
                           error : NSError?) {
        
        if let error = error {
            showAlert("Error", message: error.localizedDescription)
            return
        }
        
        var eventString = ""
        
        if let events = response.items() where !events.isEmpty {
            for event in events as! [GTLCalendarEvent] {
                let start : GTLDateTime! = event.start.dateTime ?? event.start.date
                let startString = NSDateFormatter.localizedStringFromDate(
                    start.date,
                    dateStyle: .ShortStyle,
                    timeStyle: .ShortStyle
                )
                eventString += "\(startString) - \(event.summary)\n"
            }
        } else {
            eventString = "No upcoming events found."
        }
        
        print(eventString)
    }
    
    
    // Creates the auth controller for authorizing access to Google Calendar API
    private func createAuthController() -> GTMOAuth2ViewControllerTouch {
        let scopeString = scopes.joinWithSeparator(" ")
        return GTMOAuth2ViewControllerTouch(
            scope: scopeString,
            clientID: kClientID,
            clientSecret: nil,
            keychainItemName: kKeychainItemName,
            delegate: self,
            finishedSelector: "viewController:finishedWithAuth:error:"
        )
    }
    
    // Handle completion of the authorization process, and update the Google Calendar API
    // with the new credentials.
    func viewController(vc : UIViewController,
                        finishedWithAuth authResult : GTMOAuth2Authentication, error : NSError?) {
        
        if let error = error {
            service.authorizer = nil
            showAlert("Authentication Error", message: error.localizedDescription)
            return
        }
        
        service.authorizer = authResult
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // Helper for showing an alert
    func showAlert(title : String, message: String) {
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
        //google cal auth
        if let auth = GTMOAuth2ViewControllerTouch.authForGoogleFromKeychainForName(
            kKeychainItemName,
            clientID: kClientID,
            clientSecret: nil) {
            service.authorizer = auth
        }
        
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.frame = CGRectMake(0, 10, width, height/10)
        //let backButton: UIBarButtonItem = UIBarButtonItem(title: "BACK", style: UIBarButtonItemStyle.Bordered, target: self, action: nil)
        let navBgImage:UIImage = UIImage(named: "BackArrow")!
        
        let backButton:UIBarButtonItem = UIBarButtonItem(image:navBgImage, style:.Plain, target:self, action:"backButtonPressed:")
        navigationItem.backBarButtonItem = backButton
        self.navigationController?.navigationItem.leftBarButtonItem?.image = UIImage(named: "BackArrow")!
        self.navigationController?.navigationBar.frame = CGRectMake(0, 20, width, height/10)

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
        usernameField.text = "123456"
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
        passwordField.text = "Testing123!"
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
        // Gradient stuff for login button
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
        creationFunctions.addImage(imageName, frame: CGRectMake(width/2, 0, width/4, height/4), center:true, alpha: 1.0, page: self)
        
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
        self.navigationController?.pushViewController(AccountRegister, animated: true)
        //self.presentViewController(AccountRegister, animated: true, completion: nil)
    }
    
    // Changes to Feorgot Password Page
    func forgotPasswordSwitch(sender: UIButton!) {
        let ForgotPassword:ForgotPasswordPage = ForgotPasswordPage()
        self.navigationController?.pushViewController(ForgotPassword, animated: true)
    }
    
    func verifyLogin(username: String){
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper();
        
        let task: AWSTask! = dynamoDBObjectMapper.load(DDBLoginData.self, hashKey: username, rangeKey: nil)
        
        task.continueWithExecutor(AWSExecutor.mainThreadExecutor(), withBlock: { (task:AWSTask!) -> AnyObject! in
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
                }
            } else {
                print("Error: \(task.error)")
                
            }
            return nil
        })
        
    }
    
}

