//
//  NewPatientFamilyHistory.swift
//  Project BlackSky
//
//  Created by Deven  on 1/19/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit
import AWSS3
import AWSDynamoDB
import AWSSQS
import AWSSNS
import AWSCognito

let newPatientPage: NewPatient = NewPatient()

class NewPatientFamilyHistory: UIViewController {

    
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
    
    //Smoker? Current Meds? Current illnesses? Family history of illness?
    
    let greetingLabel:UILabel = UILabel()
    let saveButton:UIButton = UIButton()
    let familyHistoryStatusLabel:UILabel = UILabel()
    let familyHistoryBox:CheckBox = CheckBox()
    let familyHistoryButton:UIButton = UIButton()
    let familyHistoryField:UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Makes Navigation Bar
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 50)) // Offset by 20 pixels vertically to take the status bar into account
    
        creationFunctions.makeLabel(greetingLabel, name: "Please answer the following question by touching the checkbox:", textColor: UIColor.black, alignment: NSTextAlignment.left, frame: CGRect(x: screenSize.width/10, y: screenSize.height/15, width: 800, height: 40), page: self)
        greetingLabel.font = UIFont(name: (greetingLabel.font?.fontName)!, size: 25)
        greetingLabel.sizeToFit()
        
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "New Patient: Family History", forwardButton: false, backButton: true, page: self)
        
        creationFunctions.makeButton(saveButton, name: "Save", titleColor: UIColor.black, location: CGRect(x: (screenSize.width-150)/2, y: 8*screenSize.height/10, width: 150, height: 40), page: self)
        saveButton.titleLabel?.font = UIFont(name: (saveButton.titleLabel?.font?.fontName)!, size: 30)
        saveButton.addTarget(self, action: #selector(NewPatientFamilyHistory.saveClicked(_:)), for: .touchUpInside)
        
        creationFunctions.makeLabel(familyHistoryStatusLabel, name: "Do they have any family history of hereditary illnesses?", textColor: UIColor.black, alignment: NSTextAlignment.left, frame: CGRect(x: screenSize.width/20, y: 2 * screenSize.height/10, width: 500, height: 30), page: self)
        familyHistoryStatusLabel.font = UIFont(name: (familyHistoryStatusLabel.font?.fontName)!, size:30)
        familyHistoryStatusLabel.sizeToFit()
        creationFunctions.makeCheckBox(familyHistoryBox, frame: CGRect(x: 8.5 * screenSize.width/10 , y: screenSize.height*2/10, width: 50, height: 50), page: self)
        creationFunctions.makeButton(familyHistoryButton, name: "", titleColor: UIColor.clear, location: familyHistoryBox.frame, page: self)
        familyHistoryButton.addTarget(self, action: #selector(NewPatientFamilyHistory.yesHistory(_:)), for: .touchUpInside)
        creationFunctions.makeTextField(familyHistoryField, backgroundColor: UIColor.lightGray, frame: CGRect(x: screenSize.width/20 , y: screenSize.height * 3/10, width: 800, height: 400), page: self)
        familyHistoryField.placeholder = "PLease Elaborate"
        familyHistoryField.isHidden = true

        
        self.configureView()
    }
    
    func saveClicked(_ sender: UIButton){
        let alertController = UIAlertController(title: "Form not comleted", message: "You checked a box and that you did not elaborate for.", preferredStyle: .alert)
        print("Didn't elaborate on a field on NewPatient.")
        // Initialize Actions
        let ContinueAction = UIAlertAction(title: "Continue Anyway", style: .default) { (action) -> Void in
            //@Mehrab save the data
            print("Saving new patient data.")
        }
        let okayAction = UIAlertAction(title: "Okay", style: .default) { (action) -> Void in
            print("Completing NewPatientFamilyHistoryPage")
        }
        // Add Actions
        alertController.addAction(ContinueAction)
        alertController.addAction(okayAction)
    if familyHistoryBox.isChecked && familyHistoryField.text == ""{
    self.present(alertController, animated: true, completion: nil)
    }else{
    //@Mehrab do your thing. I didn't wanna make seperate variables for everything cause that seemed sloppy, but the family history string is gonna be in familyHistoryField.text
        creationFunctions.makeAlert("Data saved.", message: "All patient data saved.", printStatement: "New Patient successfully added.", page: self)
        //TODO: Transition to main menu
        let familyArray = familyHistoryField.text!.characters.split{$0 == ","}.map(String.init)
        patientPrototype.familyHistory = familyArray
        sendPatientData(patientPrototype)
        
        print(patientPrototype.firstName)
        print(patientPrototype.middleName)
        print(patientPrototype.lastName)
        print(patientPrototype.Email)
        print(patientPrototype.phoneNumber)
        print(patientPrototype.insuranceProvider)
        print(patientPrototype.policyNumber)
        print(patientPrototype.smokerStatus)
        print(patientPrototype.drinkerStatus)
        print(patientPrototype.currentMedications)
        print(patientPrototype.prexistingContitions)
        print(patientPrototype.familyHistory)
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backClicked(_ sender: UIBarButtonItem!){
        self.dismiss(animated: true, completion: {});
    }
    
    func yesHistory (_ sender:UIButton){
        if !familyHistoryBox.isChecked{
            familyHistoryBox.isChecked = !familyHistoryBox.isChecked
            familyHistoryField.text = ""
            familyHistoryField.isHidden = false
            familyHistoryField.isEnabled = true
            self.configureView()
        } else{
            familyHistoryBox.isChecked = !familyHistoryBox.isChecked
            familyHistoryField.isHidden = true
            familyHistoryField.isEnabled = false
            self.configureView()
        }
    }
    
    func sendPatientData(_ patientData: PatientData){
        //get object mapper in order to allow us to send a logindata object to the ddb server.
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.default();
        
        //save allows us to "save" this new login data to the server.
<<<<<<< .merge_file_2iNh7a
        dynamoDBObjectMapper.save(patientData).continue(with: AWSExecutor.mainThread(), with:
=======
        dynamoDBObjectMapper?.save(patientData).continue(with: AWSExecutor.mainThread(), with:
>>>>>>> .merge_file_ChPHdj
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
