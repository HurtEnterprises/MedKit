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
        self.view.backgroundColor = UIColor.cyan
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
    
    let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 40))
    
    let nextButton:UIButton = UIButton()
    //TODO: Consult with practicing doctors to see what other info is required
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Makes Navigation Bar
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 50)) // Offset by 20 pixels vertically to take the status bar into account
        
        // Makes cooresponding labels and text fields and next button
        
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "New Patient: General Information", forwardButton: false, backButton: true, page: self)
        
        creationFunctions.makeTextField(firstNameField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width-300)/2 - 350, y: screenSize.height/10, width: 300, height: 35), page: self)
        firstNameField.autocorrectionType = .no
        firstNameField.placeholder = "First Name"
        
        creationFunctions.makeTextField(middleNameField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width-300)/2, y: screenSize.height/10 , width: 300, height: 35), page: self)
        middleNameField.autocorrectionType = .no
        middleNameField.placeholder = "Middle Name"
        
        creationFunctions.makeTextField(lastNameField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width-300)/2 + 350, y: screenSize.height/10, width: 300, height: 35), page: self)
        lastNameField.autocorrectionType = .no
        lastNameField.placeholder = "Last Name"
        
        creationFunctions.makeTextField(emailField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width-400)/2, y: 2*screenSize.height/10, width: 400, height: 35), page: self)
        emailField.autocorrectionType = .no
        emailField.placeholder = "Email Address"
        
  //      creationFunctions.makeLabel(<#T##label: UILabel##UILabel#>, name: <#T##String#>, textColor: <#T##UIColor#>, alignment: <#T##NSTextAlignment#>, frame: //<#T##CGRect#>, page: <#T##UIViewController#>)

        creationFunctions.makeTextField(streetAddressField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width - 700)/2, y: 3 * screenSize.height/10, width: 700, height: 35), page: self)
        streetAddressField.placeholder = "Street Address"
        
        creationFunctions.makeTextField(cityField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width - 500)/2 - 100, y: 3.5 * screenSize.height/10, width: 300, height: 35), page: self)
        cityField.autocorrectionType = .no
        cityField.placeholder = "City"
        
        creationFunctions.makeTextField(stateField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width - 200)/2 + 250 , y: 3.5 * screenSize.height/10, width: 200, height: 35), page: self)
        stateField.placeholder = "State"
        
        creationFunctions.makeTextField(zipField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width - 200)/2 - 250, y: 4 * screenSize.height/10, width: 200, height: 35), page: self)
        zipField.keyboardType = UIKeyboardType.numberPad
        zipField.placeholder = "Zip Code"
        
        creationFunctions.makeLabel(phoneNumberLabel, name: "Phone Number:", textColor: UIColor.black, alignment: NSTextAlignment.center, frame: CGRect(x: (screenSize.width-300)/2 + 200, y: 6*screenSize.height/10, width: 300, height: 35), page: self)
        phoneNumberLabel.sizeToFit()
        
        creationFunctions.makeTextField(phoneNumberField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width-300)/2 + 350 , y: 6*screenSize.height/10, width: 200, height: 35), page: self)
        phoneNumberField.keyboardType = UIKeyboardType.numberPad
        //makePhoneNumber(<#T##textField: UITextField##UITextField#>, shouldChangeCharactersInRange: <#T##NSRange#>, replacementString: <#T##String#>)
        

        
        creationFunctions.makeLabel(DOBLabel, name: "Date of Birth:", textColor: UIColor.black, alignment: NSTextAlignment.center, frame: CGRect(x: (screenSize.width-300)/2 - 300, y: 6*screenSize.height/10, width: 300, height: 35), page: self)
        DOBLabel.sizeToFit()
        
        creationFunctions.makeTextField(DOBField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width-300)/2 - 125 , y: 6*screenSize.height/10, width: 200, height: 35), page: self)
        
        creationFunctions.makeLabel(insuranceProviderLabel, name: "Insurance Provider:", textColor: UIColor.black, alignment: NSTextAlignment.center, frame: CGRect(x: (screenSize.width-300)/2 - 300, y: 6.5*screenSize.height/10, width: 300, height: 35), page: self)
        insuranceProviderLabel.sizeToFit()
        
        creationFunctions.makeTextField(insuranceProviderField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width-300)/2 - 125, y: 6.5*screenSize.height/10, width: 300, height: 35), page: self)
        insuranceProviderField.autocorrectionType = .no
        
        creationFunctions.makeLabel(policyNumberLabel, name: "Policy Number:", textColor: UIColor.black, alignment: NSTextAlignment.center, frame: CGRect(x: (screenSize.width-300)/2 + 200, y: 6.5*screenSize.height/10, width: 300, height: 35), page: self)
        policyNumberLabel.sizeToFit()
        
        creationFunctions.makeTextField(policyNumberField, backgroundColor: UIColor.lightGray, frame: CGRect(x: (screenSize.width-200)/2 + 300, y: 6.5*screenSize.height/10, width: 200, height: 35), page: self)
        policyNumberField.keyboardType = UIKeyboardType.numberPad

        
        //TODO: Refactor date picker stuff to outside function
        
        dobPicker.datePickerMode = UIDatePickerMode.date // Sets date picker to the month, date, year format
        DOBField.inputView = dobPicker //Makes the text field go to date picker
        dobPicker.addTarget(self, action: #selector(NewPatient.datePickerValueChanged(_:)), for: UIControlEvents.valueChanged) //Goes to thiis function when value is changed

        // Sets up done button on date picker
        toolBar.barStyle = UIBarStyle.default
        toolBar.tintColor = UIColor.black
        toolBar.backgroundColor = UIColor.green
        let toolBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(NewPatient.closeButtonPressed))
        toolBar.items = [toolBarButton]
        DOBField.inputAccessoryView = toolBar
        
        
        creationFunctions.makeButton(nextButton, name: "Next", titleColor: UIColor.black, location: CGRect(x: (screenSize.width - 200)/2, y: 8 * screenSize.height/10, width: 200, height: 50), page: self)
        
        nextButton.titleLabel?.font = UIFont(name: (nextButton.titleLabel?.font?.fontName)!, size: 30)
        nextButton.addTarget(self, action: #selector(NewPatient.nextClicked(_:)), for: .touchUpInside)
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        self.dismiss(animated: true, completion: {});
        //self.presentViewController(self.mainMenu, animated: true, completion: nil)
    }
    
    func nextClicked(_ sedner: UIButton){
        //loginChecks()
        
        patientPrototype.firstName = firstNameField.text!
        patientPrototype.middleName = middleNameField.text!
        patientPrototype.lastName = lastNameField.text!
        patientPrototype.streetAddress = streetAddressField.text!
        patientPrototype.city = cityField.text!
        patientPrototype.state = stateField.text!
        patientPrototype.phoneNumber = phoneNumberField.text!
        patientPrototype.insuranceProvider = insuranceProviderField.text!
        patientPrototype.policyNumber = policyNumberField.text!
        patientPrototype.zip = zipField.text!
        patientPrototype.DOB = DOBField.text!
        patientPrototype.Email = emailField.text!

        self.present(patientHistoryPage, animated: true, completion: nil)
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
            let alertController = UIAlertController(title: "No Phone Number", message: "Please input a phone number for the patient.", preferredStyle: .alert)
            print("No phone number for new patient.")
            // Initialize Actions
            let ContinueAction = UIAlertAction(title: "Continue Anyway", style: .default) { (action) -> Void in
                self.present(patientHistoryPage, animated: true, completion: nil)
                print("New Patient Added.")
            }
            let okayAction = UIAlertAction(title: "Okay", style: .default) { (action) -> Void in
                print("They are revisiting the New Patient form.")
            }
            // Add Actions
            alertController.addAction(ContinueAction)
            alertController.addAction(okayAction)
            // Present Alert Controller
            print("New Patient Added.")
            self.present(alertController, animated: true, completion: nil)
        } else if(insuranceProviderField.text == "" || policyNumberField.text == ""){
            creationFunctions.makeAlert("Insurance Information Not completed.", message: "Please complete the patient's insurance information.", printStatement: "Incomplete Insurance Info", page: self)
    }else{
            
        
      //      let encryptedFirstName = Encrypt2(firstNameField.text!,publicKeyFunctionParameter: findKey(PublicTag!)!)
//        let encryptedMiddleName = Encrypt2((middleNameField.text)!,publicKeyFunctionParameter: findKey(PublicTag!)!)
//        let encryptedLastName = Encrypt2(lastNameField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
//        let encryptedStreetAddress = Encrypt2(streetAddressField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
//        let encryptedCity = Encrypt2(cityField.text!, publicKeyFunctionParameter:findKey(PublicTag!)!)
//        let encryptedState = Encrypt2(stateField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
//        let encryptedPhoneNumber = Encrypt2(phoneNumberField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
//        let encryptedInsuranceProvider = Encrypt2(insuranceProviderField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
//        let encryptedPolicyNumber = Encrypt2(policyNumberField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
//        let encryptedZip = Encrypt2(zipField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)
//        let encryptedDOB = Encrypt2(DOBField.text!, publicKeyFunctionParameter: findKey(PublicTag!)!)

            
        self.present(patientHistoryPage, animated: true, completion: nil)
        }
    }
    
    func datePickerValueChanged(_ sender:UIDatePicker) {
        // Makes date picker format year, month, day
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let strDate = dateFormatter.string(from: dobPicker.date)
        self.DOBField.text = strDate
        DOBField.text = dateFormatter.string(from: sender.date)
    }
    
    func makePhoneNumber(_ textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool
    {
        if (textField == phoneNumberField)
        {
            let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            let components = newString.components(separatedBy: CharacterSet.decimalDigits.inverted)
            
            let decimalString = components.joined(separator: "") as NSString
            let length = decimalString.length
            let hasLeadingOne = length > 0 && decimalString.character(at: 0) == (1 as unichar)
            
            if length == 0 || (length > 10 && !hasLeadingOne) || length > 11
            {
                let newLength = (textField.text! as NSString).length + (string as NSString).length - range.length as Int
                
                return (newLength > 10) ? false : true
            }
            var index = 0 as Int
            let formattedString = NSMutableString()
            
            if hasLeadingOne
            {
                formattedString.append("1 ")
                index += 1
            }
            if (length - index) > 3
            {
                let areaCode = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("(%@)", areaCode)
                index += 3
            }
            if length - index > 3
            {
                let prefix = decimalString.substring(with: NSMakeRange(index, 3))
                formattedString.appendFormat("%@-", prefix)
                index += 3
            }
            
            let remainder = decimalString.substring(from: index)
            formattedString.append(remainder)
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
