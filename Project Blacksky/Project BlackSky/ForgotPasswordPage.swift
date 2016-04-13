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
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        self.view.backgroundColor = UIColor.whiteColor()
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }
    
    // Initializes text fields & labels
    let emailField: UITextField = UITextField()
    let emailLabel: UILabel = UILabel()
    
    let physicianIDField: UITextField = UITextField()
    let physicianIDLabel: UILabel = UILabel()
    
    let forgotPasswordLabel: UILabel = UILabel()
    let forgotPasswordParagraph: UITextView = UITextView()
    
    let submit: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Sets background
        creationFunctions.setBackgroundColor("ForgotPasswordBackground", page: self)
        
        // Adds logo in top right
        let imageName = "MedKitLogoWhite.png"
        creationFunctions.addImage(imageName, frame: CGRectMake(8.5 * width/10, 5, width/8, height/8), center:false, alpha: 0.5, page: self)
        
        // Makes white box
        let infoBox = UIView(frame: CGRectMake(width/20,0.375 * height, width * 9/10, height/2.15))
        infoBox.backgroundColor = UIColor.clearColor()
        infoBox.layer.borderWidth = 5
        infoBox.layer.borderColor = UIColor.whiteColor().CGColor
        infoBox.layer.cornerRadius = 8.0
        infoBox.clipsToBounds = true
        view.addSubview(infoBox)
        
        // Makes navigaiton bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.frame = CGRectMake(0, 10, width, height/20)
        var backButton: UIBarButtonItem = UIBarButtonItem(title: "BACK", style: UIBarButtonItemStyle.Bordered, target: self, action: nil)
        navigationItem.backBarButtonItem = backButton
        navigationItem.backBarButtonItem?.setTitleTextAttributes([ NSFontAttributeName: UIFont(name: "Arial", size: 30)!], forState: UIControlState.Normal)
        
        creationFunctions.makeLabel(forgotPasswordLabel, name: "FORGOT PASSWORD?", textColor: UIColor.whiteColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(width/20,height/10, 0.75 * width, height/10), page: self)
        forgotPasswordLabel.font = UIFont(name: (forgotPasswordLabel.font.fontName), size: 60)
        
        forgotPasswordParagraph.frame = CGRectMake(width/20, 0.2 * height, 0.8 * width, 0.3 * height)
        self.view.addSubview(forgotPasswordParagraph)
        forgotPasswordParagraph.text = "AFTER CONFIRMING YOUR IDENTITY WITH THE \n\nINFORMATION BELOW, YOU WILL RECEIVE AN EMAIL WITH \n\nINSTRUCTIONS ON NEXT STEPS"
        forgotPasswordParagraph.font = UIFont(name: (forgotPasswordParagraph.font!.fontName), size: 28)
        forgotPasswordParagraph.textColor = UIColor.whiteColor()
        forgotPasswordParagraph.backgroundColor = UIColor.clearColor()
        
        creationFunctions.makeClearButton(submit, name: "SUBMIT", titleColor: UIColor.whiteColor(), location: CGRectMake((2/3*width)/2, 0.7 * height, width * 0.4, height/12), page: self)
        submit.titleLabel?.font = UIFont(name: (submit.titleLabel?.font?.fontName)!, size: 60)
        submit.layer.borderColor = UIColor.clearColor().CGColor
        submit.layer.shadowColor = UIColor.blackColor().CGColor
        submit.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        submit.layer.shadowRadius = 3
        submit.layer.shadowOpacity = 0.2
        submit.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = submit.frame.size
        let color1 = UIColor(red: 190/256, green: 190/256, blue: 190/256, alpha: 1.0).CGColor as CGColorRef
        let color2 = UIColor(red: 255/256, green: 251/256, blue: 251/256, alpha: 0.0).CGColor as CGColorRef
        layer.colors = [color2, color1]
        layer.locations = [0.0, 0.7]
        submit.layer.insertSublayer(layer, atIndex: 0)
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pressed(sender: UIButton!) {
        // I created an alert this way to allow a page change upon clicking okay
        if(emailField.text == "" || emailField.text == ""){
            creationFunctions.makeAlert("Incomplete Form", message: "Please fill out the form in its entirety.", printStatement: "Incomplete forgot password form.", page: self)
        }
        //TODO @Mehrab: make sure usernmae and email map to same user
        let alertController = UIAlertController(title: "Success", message: "Check your email for instructions on resetting your password.", preferredStyle: .Alert)
        // Initialize Actions
        let okayAction = UIAlertAction(title: "Okay", style: .Default) { (action) -> Void in
            self.presentViewController(self.loginPage, animated: true, completion: nil)
            print("*insert username* forgot password")
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
    func backClicked (sender: UIBarButtonItem!){
        self.dismissViewControllerAnimated(true, completion: {});
    }
}