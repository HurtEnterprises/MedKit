//
//  ForgotPassword.swift
//  Project BlackSky
//
//  Created by Deven  on 12/27/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class ForgotPasswordPage: UIViewController {
    let loginPage:LoginPage = LoginPage()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        self.view.backgroundColor = UIColor.white
    }
    
    // Initializes text fields & labels
    let emailField: UITextField = UITextField()
    let emailLabel: UILabel = UILabel()
    
    let physicianIDField: UITextField = UITextField()
    let physicianIDLabel: UILabel = UILabel()
    
    let forgotPasswordLabel: UILabel = UILabel()
    let forgotPasswordParagraph: UITextView = UITextView()
    
    let submit: UIButton = UIButton()
    
    var underlineAttributes = [
        NSFontAttributeName : UIFont.systemFont(ofSize: 27.0),
        NSForegroundColorAttributeName : UIColor.white,
        NSUnderlineStyleAttributeName : 1] as [String : Any]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets background
        creationFunctions.setBackgroundColor("ForgotPasswordBackground", page: self)
        
        // Adds logo in top right
        let imageName = "MedKitLogoWhite.png"
        creationFunctions.addImage(imageName, frame: CGRect(x: 8.5 * width/10, y: 5, width: width/8, height: height/8), center:false, alpha: 0.5, page: self)
        
        // Makes white box
        let infoBox = UIView(frame: CGRect(x: width/20,y: 0.375 * height, width: width * 9/10, height: height/2.15))
        infoBox.backgroundColor = UIColor.clear
        infoBox.layer.borderWidth = 5
        infoBox.layer.borderColor = UIColor.white.cgColor
        infoBox.layer.cornerRadius = 8.0
        infoBox.clipsToBounds = true
        view.addSubview(infoBox)
        
        // Makes navigaiton bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 10, width: width, height: height/20)
        
        let backArrowButton =  UIButton(type: .custom)
        backArrowButton.setImage(UIImage(named: "BackArrow"), for: UIControlState())
        backArrowButton.addTarget(self, action: #selector(ForgotPasswordPage.backClicked(_:)), for: .touchUpInside)
        backArrowButton.frame = CGRect(x: 0, y: 0, width: width/25, height: height/12)
        
        
        let backWord: UIButton = UIButton()
        creationFunctions.makeButton(backWord, name: "Back", titleColor: UIColor.white, location: CGRect(x: width/25, y: height/35, width: width/10, height: 34), page: self)
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 34)
        backWord.titleLabel?.text = "Back"
        backWord.titleLabel?.textAlignment = .center
        backWord.titleLabel?.textColor = UIColor.white
        backWord.backgroundColor = UIColor.clear
        backWord.addTarget(self, action: #selector(ForgotPasswordPage.backClicked(_:)), for: .touchUpInside)
        backArrowButton.addSubview(backWord)
        let barButton = UIBarButtonItem(customView: backArrowButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        
        // Makes Text Fields
        creationFunctions.makeTextField(emailField, backgroundColor: UIColor.lightGray, frame: CGRect(x: width/4, y: height/2.25 + 50, width: width/2, height: 30), page:self)
        emailField.font = emailField.font!.withSize(30)
        emailField.layer.backgroundColor = UIColor.clear.cgColor
        emailField.layer.borderColor = UIColor.clear.cgColor
        emailField.layer.borderWidth = 2.0
        let emailLayer = CALayer()
        emailLayer.borderColor = UIColor.white.cgColor
        emailLayer.frame = CGRect(x: 0, y: emailField.frame.size.height - emailField.layer.borderWidth, width: emailField.frame.size.width, height: emailField.frame.size.height)
        emailLayer.borderWidth = width
        creationFunctions.disableAutocorrect(emailField)
        emailField.layer.addSublayer(emailLayer)
        emailField.layer.masksToBounds = true
        
        creationFunctions.makeTextField(physicianIDField,backgroundColor: UIColor.lightGray, frame: CGRect(x: width/4, y: height/1.75 + 50, width: width/2, height: 30), page:self)
        physicianIDField.font = physicianIDField.font!.withSize(30)
        physicianIDField.layer.backgroundColor = UIColor.clear.cgColor
        physicianIDField.layer.borderColor = UIColor.clear.cgColor
        physicianIDField.layer.borderWidth = 2.0
        let physicanIDBoarder = CALayer()
        physicanIDBoarder.borderColor = UIColor.white.cgColor
        physicanIDBoarder.frame = CGRect(x: 0, y: physicianIDField.frame.size.height - physicianIDField.layer.borderWidth, width:  physicianIDField.frame.size.width, height: physicianIDField.frame.size.height)
        physicanIDBoarder.borderWidth = width
        physicianIDField.layer.addSublayer(physicanIDBoarder)
        physicianIDField.layer.masksToBounds = true
        
        // Makes Text Labels
        let usernameLabel: UILabel = UILabel()
        creationFunctions.makeLabel(usernameLabel, name: "EMAIL", textColor: UIColor.white, alignment:NSTextAlignment.center, frame: CGRect(x: width/4, y: height/2.25, width: width/5, height: height/10), page: self)
        usernameLabel.font = usernameLabel.font.withSize(30)
        usernameLabel.sizeToFit()
        
        let passwordLabel: UILabel = UILabel()
        creationFunctions.makeLabel(passwordLabel, name: "PHYSICIAN ID", textColor: UIColor.white, alignment:NSTextAlignment.center, frame: CGRect(x: width/4, y: height/1.75, width: width/5, height: height/10), page: self)
        passwordLabel.font = passwordLabel.font.withSize(30)
        passwordLabel.sizeToFit()
        //
        
        creationFunctions.makeLabel(forgotPasswordLabel, name: "FORGOT PASSWORD?", textColor: UIColor.white, alignment: NSTextAlignment.left, frame: CGRect(x: width/20,y: height/10, width: 0.75 * width, height: height/10), page: self)
        forgotPasswordLabel.font = UIFont(name: (forgotPasswordLabel.font.fontName), size: 60)
        
        forgotPasswordParagraph.frame = CGRect(x: width/20, y: 0.2 * height, width: 0.8 * width, height: 0.3 * height)
        self.view.addSubview(forgotPasswordParagraph)
        forgotPasswordParagraph.text = "AFTER CONFIRMING YOUR IDENTITY WITH THE \n\nINFORMATION BELOW, YOU WILL RECEIVE AN EMAIL WITH \n\nINSTRUCTIONS ON NEXT STEPS"
        forgotPasswordParagraph.font = UIFont(name: (forgotPasswordParagraph.font!.fontName), size: 28)
        forgotPasswordParagraph.textColor = UIColor.white
        forgotPasswordParagraph.backgroundColor = UIColor.clear
        
        creationFunctions.makeClearButton(submit, name: "SUBMIT", titleColor: UIColor.white, location: CGRect(x: (2/3*width)/2, y: 0.7 * height, width: width * 0.4, height: height/12), page: self)
        submit.titleLabel?.font = UIFont(name: (submit.titleLabel?.font?.fontName)!, size: 60)
        submit.layer.borderColor = UIColor.clear.cgColor
        submit.layer.shadowColor = UIColor.black.cgColor
        submit.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        submit.layer.shadowRadius = 3
        submit.layer.shadowOpacity = 0.2
        submit.addTarget(self, action: #selector(ForgotPasswordPage.pressed(_:)), for: .touchUpInside)
        
        // Adds gradient to submit button
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = submit.frame.size
        let color1 = UIColor(red: 190/256, green: 190/256, blue: 190/256, alpha: 1.0).cgColor as CGColor
        let color2 = UIColor(red: 255/256, green: 251/256, blue: 251/256, alpha: 0.0).cgColor as CGColor
        layer.colors = [color2, color1]
        layer.locations = [0.0, 0.7]
        submit.layer.insertSublayer(layer, at: 0)
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pressed(_ sender: UIButton!) {
        // I created an alert this way to allow a page change upon clicking okay
        if(emailField.text == "" || emailField.text == ""){
            creationFunctions.makeAlert("Incomplete Form", message: "Please fill out the form in its entirety.", printStatement: "Incomplete forgot password form.", page: self)
        }
        //TODO @Mehrab: make sure usernmae and email map to same user
        let alertController = UIAlertController(title: "Success", message: "Check your email for instructions on resetting your password.", preferredStyle: .alert)
        // Initialize Actions
        let okayAction = UIAlertAction(title: "Okay", style: .default) { (action) -> Void in
            self.present(self.loginPage, animated: true, completion: nil)
            print("*insert username* forgot password")
        }
        // Add Actions
        alertController.addAction(okayAction)
        // Present Alert Controller
        self.present(alertController, animated: true, completion: nil)
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
    func backClicked(_ sender: UIBarButtonItem!){
        print("Back Clicked")
        self.navigationController?.popViewController(animated: true)
    }
}
