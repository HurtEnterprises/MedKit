//
//  NewPatient.swift
//  Project BlackSky
//
//  Created by Deven  on 1/9/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

let mainMenu: MainMenu = MainMenu()
let patientHistoryPage: NewPatientHistory = NewPatientHistory()

class NewPatient: UIViewController {
    
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
    
    let DOBLabel:UILabel = UILabel() //DOB = Date of Birth
    let insuranceProviderLabel:UILabel = UILabel()
    let policyNumberLabel:UILabel = UILabel()
    let phoneNumberLabel:UILabel = UILabel()

    
    let firstNameField:UITextField = UITextField()
    let lastNameField:UITextField = UITextField()
    let middleNameField:UITextField = UITextField()
    let emailField:UITextField = UITextField()
    let DOBField:UITextField = UITextField()
    let insuranceProviderField:UITextField = UITextField() //TODO: Give options for insurance provider
    let policyNumberField:UITextField = UITextField()
    let streetAddressField:UITextField = UITextField()
    let cityField:UITextField = UITextField()
    let stateField:UITextField = UITextField()
    let zipField:UITextField = UITextField()
    let phoneNumberField:UITextField = UITextField()
    
    let dobPicker:UIDatePicker = UIDatePicker()
    
    let toolBar = UIToolbar(frame: CGRectMake(0, 0, 0, 40))
    
    let nextButton:UIButton = UIButton()
    //TODO: Consult with practicing doctors to see what other info is required
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Makes Navigation Bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
        
        // Makes cooresponding labels and text fields and next button
        
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "New Patient: General Information", color: UIColor.grayColor(), forwardButton: false, backButton: true, page: self)
        
        creationFunctions.makeTextField(firstNameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 - 350, screenSize.height/10, 300, 35), page: self)
        firstNameField.autocorrectionType = .No
        firstNameField.placeholder = "First Name"
        
        creationFunctions.makeTextField(middleNameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2, screenSize.height/10 , 300, 35), page: self)
        middleNameField.autocorrectionType = .No
        middleNameField.placeholder = "Middle Name"
        
        creationFunctions.makeTextField(lastNameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 + 350, screenSize.height/10, 300, 35), page: self)
        lastNameField.autocorrectionType = .No
        lastNameField.placeholder = "Last Name"
        
        creationFunctions.makeTextField(emailField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-400)/2, 2*screenSize.height/10, 400, 35), page: self)
        emailField.autocorrectionType = .No
        emailField.placeholder = "Email Address"
        
        creationFunctions.makeTextField(streetAddressField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width - 700)/2, 3 * screenSize.height/10, 700, 35), page: self)
        streetAddressField.placeholder = "Street Address"
        
        creationFunctions.makeTextField(cityField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width - 500)/2 - 100, 3.5 * screenSize.height/10, 300, 35), page: self)
        cityField.autocorrectionType = .No
        cityField.placeholder = "City"
        
        creationFunctions.makeTextField(stateField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width - 200)/2 + 250 , 3.5 * screenSize.height/10, 200, 35), page: self)
        stateField.placeholder = "State"
        
        creationFunctions.makeTextField(zipField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width - 200)/2 - 250, 4 * screenSize.height/10, 200, 35), page: self)
        zipField.keyboardType = UIKeyboardType.NumberPad
        zipField.placeholder = "Zip Code"
        
        creationFunctions.makeLabel(phoneNumberLabel, name: "Phone Number:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((screenSize.width-300)/2 + 200, 6*screenSize.height/10, 300, 35), page: self)
        phoneNumberLabel.sizeToFit()
        
        creationFunctions.makeTextField(phoneNumberField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 + 350 , 6*screenSize.height/10, 200, 35), page: self)
        phoneNumberField.keyboardType = UIKeyboardType.NumberPad
        //makePhoneNumber(<#T##textField: UITextField##UITextField#>, shouldChangeCharactersInRange: <#T##NSRange#>, replacementString: <#T##String#>)
        

        
        creationFunctions.makeLabel(DOBLabel, name: "Date of Birth:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((screenSize.width-300)/2 - 300, 6*screenSize.height/10, 300, 35), page: self)
        DOBLabel.sizeToFit()
        
        creationFunctions.makeTextField(DOBField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 - 125 , 6*screenSize.height/10, 200, 35), page: self)
        
        creationFunctions.makeLabel(insuranceProviderLabel, name: "Insurance Provider:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((screenSize.width-300)/2 - 300, 6.5*screenSize.height/10, 300, 35), page: self)
        insuranceProviderLabel.sizeToFit()
        
        creationFunctions.makeTextField(insuranceProviderField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 - 125, 6.5*screenSize.height/10, 300, 35), page: self)
        insuranceProviderField.autocorrectionType = .No
        
        creationFunctions.makeLabel(policyNumberLabel, name: "Policy Number:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((screenSize.width-300)/2 + 200, 6.5*screenSize.height/10, 300, 35), page: self)
        policyNumberLabel.sizeToFit()
        
        creationFunctions.makeTextField(policyNumberField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-200)/2 + 300, 6.5*screenSize.height/10, 200, 35), page: self)
        policyNumberField.keyboardType = UIKeyboardType.NumberPad

        
        //TODO: Refactor date picker stuff to outside function
        
        dobPicker.datePickerMode = UIDatePickerMode.Date // Sets date picker to the month, date, year format
        DOBField.inputView = dobPicker //Makes the text field go to date picker
        dobPicker.addTarget(self, action: Selector("datePickerValueChanged:"), forControlEvents: UIControlEvents.ValueChanged) //Goes to thiis function when value is changed

        // Sets up done button on date picker
        toolBar.barStyle = UIBarStyle.Default
        toolBar.tintColor = UIColor.blackColor()
        toolBar.backgroundColor = UIColor.greenColor()
        let toolBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Done, target: self, action: "closeButtonPressed")
        toolBar.items = [toolBarButton]
        DOBField.inputAccessoryView = toolBar
        
        
        creationFunctions.makeButton(nextButton, name: "Next", titleColor: UIColor.blackColor(), location: CGRectMake((screenSize.width - 200)/2, 8 * screenSize.height/10, 200, 50), page: self)
        
        nextButton.titleLabel?.font = UIFont(name: (nextButton.titleLabel?.font?.fontName)!, size: 30)
        nextButton.addTarget(self, action: "nextClicked:", forControlEvents: .TouchUpInside)
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func backClicked(sender: UIBarButtonItem!){
        self.dismissViewControllerAnimated(true, completion: {});
        //self.presentViewController(self.mainMenu, animated: true, completion: nil)
    }
    
    func nextClicked(sedner: UIButton){
        loginChecks()
    }
    func loginChecks(){
        let zipInt = Int(zipField.text!)

        if(firstNameField.text == "" || lastNameField.text == "" ){
            creationFunctions.makeAlert("Paitent name isn't complete.", message: "Please input a first and last name for the patient.", printStatement: "First or last name missing on New Patient Page.", page: self)
        } else if (streetAddressField.text == "" || cityField.text == "" || stateField.text == "" || zipField.text == ""){
            creationFunctions.makeAlert("Address Incomplete", message: "Please complete the patient's address", printStatement: "Incomplete address on new patient.", page: self)
        }else if(zipInt == nil){
            creationFunctions.makeAlert("Zip Code is Non-Numberic", message: "Please only enter numbers for your zip code.", printStatement: "Zip non-numberic.", page: self)
        }else if(DOBField.text == ""){
            creationFunctions.makeAlert("No Date of Birth", message: "Please input a date of birth for the patient", printStatement: "No DOB for new patient.", page: self)
        }else if(phoneNumberField.text == ""){
            let alertController = UIAlertController(title: "No Phone Number", message: "Please input a phone number for the patient.", preferredStyle: .Alert)
            print("No phone number for new patient.")
            // Initialize Actions
            let ContinueAction = UIAlertAction(title: "Continue Anyway", style: .Default) { (action) -> Void in
                self.presentViewController(patientHistoryPage, animated: true, completion: nil)
                print("New Patient Added.")
            }
            let okayAction = UIAlertAction(title: "Okay", style: .Default) { (action) -> Void in
                print("They are revisiting the New Patient form.")
            }
            // Add Actions
            alertController.addAction(ContinueAction)
            alertController.addAction(okayAction)
            // Present Alert Controller
            print("New Patient Added.")
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if(insuranceProviderField.text == "" || policyNumberField.text == ""){
            creationFunctions.makeAlert("Insurance Information Not completed.", message: "Please complete the patient's insurance information.", printStatement: "Incomplete Insurance Info", page: self)
    }else{
        self.presentViewController(patientHistoryPage, animated: true, completion: nil)
        }
    }
    
    func datePickerValueChanged(sender:UIDatePicker) {
        // Makes date picker format year, month, day
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let strDate = dateFormatter.stringFromDate(dobPicker.date)
        self.DOBField.text = strDate
        DOBField.text = dateFormatter.stringFromDate(sender.date)
    }
    
    func makePhoneNumber(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        if (textField == phoneNumberField)
        {
            let newString = (textField.text! as NSString).stringByReplacingCharactersInRange(range, withString: string)
            let components = newString.componentsSeparatedByCharactersInSet(NSCharacterSet.decimalDigitCharacterSet().invertedSet)
            
            let decimalString = components.joinWithSeparator("") as NSString
            let length = decimalString.length
            let hasLeadingOne = length > 0 && decimalString.characterAtIndex(0) == (1 as unichar)
            
            if length == 0 || (length > 10 && !hasLeadingOne) || length > 11
            {
                let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
                
                return (newLength > 10) ? false : true
            }
            var index = 0 as Int
            let formattedString = NSMutableString()
            
            if hasLeadingOne
            {
                formattedString.appendString("1 ")
                index += 1
            }
            if (length - index) > 3
            {
                let areaCode = decimalString.substringWithRange(NSMakeRange(index, 3))
                formattedString.appendFormat("(%@)", areaCode)
                index += 3
            }
            if length - index > 3
            {
                let prefix = decimalString.substringWithRange(NSMakeRange(index, 3))
                formattedString.appendFormat("%@-", prefix)
                index += 3
            }
            
            let remainder = decimalString.substringFromIndex(index)
            formattedString.appendString(remainder)
            textField.text = formattedString as String
            return false
        }
        else
        {
            return true
        }
    }
    
    func closeButtonPressed(){
        self.dobPicker.removeFromSuperview()
        self.toolBar.removeFromSuperview()
    }

}