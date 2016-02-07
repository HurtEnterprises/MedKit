//
//  NewPatient.swift
//  Project BlackSky
//
//  Created by Deven  on 1/9/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class NewPatient: UIViewController {
    
    let mainMenu: MainMenu = MainMenu()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    let patientHistoryPage: NewPatientHistory = NewPatientHistory()
    
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
        firstNameField.placeholder = "First Name"
        
        creationFunctions.makeTextField(middleNameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2, screenSize.height/10 , 300, 35), page: self)
        middleNameField.placeholder = "Middle Name"
        
        creationFunctions.makeTextField(lastNameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 + 350, screenSize.height/10, 300, 35), page: self)
        lastNameField.placeholder = "Last Name"
        

  //      creationFunctions.makeLabel(<#T##label: UILabel##UILabel#>, name: <#T##String#>, textColor: <#T##UIColor#>, alignment: <#T##NSTextAlignment#>, frame: //<#T##CGRect#>, page: <#T##UIViewController#>)

        creationFunctions.makeTextField(streetAddressField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width - 700)/2, 3 * screenSize.height/10, 700, 35), page: self)
        streetAddressField.placeholder = "Street Address"
        
        creationFunctions.makeTextField(cityField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width - 500)/2 - 100, 3.5 * screenSize.height/10, 300, 35), page: self)
        cityField.placeholder = "City"
        
        creationFunctions.makeTextField(stateField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width - 200)/2 + 250 , 3.5 * screenSize.height/10, 200, 35), page: self)
        stateField.placeholder = "State"
        
        creationFunctions.makeTextField(zipField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width - 200)/2 - 250, 4 * screenSize.height/10, 200, 35), page: self)
        zipField.placeholder = "Zip Code"
        
        creationFunctions.makeLabel(phoneNumberLabel, name: "Phone Number:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((screenSize.width-300)/2 + 125, 6*screenSize.height/10, 300, 35), page: self)
        
        creationFunctions.makeTextField(phoneNumberField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 + 350 , 6*screenSize.height/10, 200, 35), page: self)
        
        creationFunctions.makeLabel(DOBLabel, name: "Date of Birth:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((screenSize.width-300)/2 - 350, 6*screenSize.height/10, 300, 35), page: self)
        
        creationFunctions.makeTextField(DOBField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 - 125 , 6*screenSize.height/10, 200, 35), page: self)
        
        creationFunctions.makeLabel(insuranceProviderLabel, name: "Insurance Provider:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((screenSize.width-300)/2 - 375, 6.5*screenSize.height/10, 300, 35), page: self)
        
        creationFunctions.makeTextField(insuranceProviderField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 - 125, 6.5*screenSize.height/10, 300, 35), page: self)
        
        creationFunctions.makeLabel(policyNumberLabel, name: "Policy Number:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Center, frame: CGRectMake((screenSize.width-300)/2 + 125, 6.5*screenSize.height/10, 300, 35), page: self)
        
        creationFunctions.makeTextField(policyNumberField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-200)/2 + 300, 6.5*screenSize.height/10, 200, 35), page: self)
        
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
        
        
        creationFunctions.makeButton(nextButton, name: "Next", titleColor: UIColor.blackColor(), location: CGRectMake((screenSize.width - 300)/2, 7.5 * screenSize.height/10, 300, 45), page: self)
        
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
    
    func nextClicked(sender: UIButton){
        if(firstNameField.text == "" || lastNameField.text == "" ){
            creationFunctions.makeAlert("Paitent name isn't complete.", message: "Please input a first and last name for the patient.", printStatement: "First or last name missing on New Patient Page.", page: self)
        } else if (streetAddressField.text == "" || cityField.text == "" || stateField.text == "" || zipField.text == ""){
            creationFunctions.makeAlert("Address Incomplete", message: "Please complete the patient's address", printStatement: "Incomplete address on new patient.", page: self)
        }else if(DOBField.text == ""){
            creationFunctions.makeAlert("No Date of Birth", message: "Please input a date of birth for the patient", printStatement: "No DOB for new patient.", page: self)
        }else if(phoneNumberField.text == ""){
            let alertController = UIAlertController(title: "No Phone Number", message: "Please input a phone number for the patient.", preferredStyle: .Alert)
            print("No phone number for new patient.")
            // Initialize Actions
            let ContinueAction = UIAlertAction(title: "Continue Anyway", style: .Default) { (action) -> Void in
                self.presentViewController(self.patientHistoryPage, animated: true, completion: nil)
                print("New Patient Added.")
            }
            let okayAction = UIAlertAction(title: "Okay", style: .Default) { (action) -> Void in
                self.presentViewController(self.patientHistoryPage, animated: true, completion: nil)
            }
            // Add Actions
            alertController.addAction(ContinueAction)
            alertController.addAction(okayAction)
            // Present Alert Controller
            print("New Patient Added.")
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if(insuranceProviderField.text == "" || policyNumberField.text == ""){
            
    }else{
            
        
      //      let encryptedFirstName = Encrypt2(firstNameField.text!,publicKeyFunctionParameter: findKey(PublicTag!)!)
            print(middleNameField.text)
        let encryptedMiddleName = Encrypt2((middleNameField.text)!,publicKeyFunctionParameter: findKey(PublicTag!)!)
        let encryptedLastName = Encrypt2(lastNameField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
        let encryptedStreetAddress = Encrypt2(streetAddressField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
        let encryptedCity = Encrypt2(cityField.text!, publicKeyFunctionParameter:findKey(PublicTag!)!)
        let encryptedState = Encrypt2(stateField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
        let encryptedPhoneNumber = Encrypt2(phoneNumberField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
        let encryptedInsuranceProvider = Encrypt2(insuranceProviderField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
        let encryptedPolicyNumber = Encrypt2(policyNumberField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
        let encryptedZip = Encrypt2(zipField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
        let encryptedDOB = Encrypt2(DOBField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
            
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
    
    func closeButtonPressed(){
        self.dobPicker.removeFromSuperview()
        self.toolBar.removeFromSuperview()
    }

}