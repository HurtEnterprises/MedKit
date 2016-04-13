//
//  NewPatientFamilyHistory.swift
//  Project BlackSky
//
//  Created by Deven  on 1/19/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

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
        self.view.backgroundColor = UIColor.cyanColor()
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
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
    
        creationFunctions.makeLabel(greetingLabel, name: "Please answer the following question by touching the checkbox:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(screenSize.width/10, screenSize.height/15, 800, 40), page: self)
        greetingLabel.font = UIFont(name: (greetingLabel.font?.fontName)!, size: 25)
        greetingLabel.sizeToFit()
        
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "New Patient: Family History", forwardButton: false, backButton: true, page: self)
        
        creationFunctions.makeButton(saveButton, name: "Save", titleColor: UIColor.blackColor(), location: CGRectMake((screenSize.width-150)/2, 8*screenSize.height/10, 150, 40), page: self)
        saveButton.titleLabel?.font = UIFont(name: (saveButton.titleLabel?.font?.fontName)!, size: 30)
        saveButton.addTarget(self, action: "saveClicked:", forControlEvents: .TouchUpInside)
        
        creationFunctions.makeLabel(familyHistoryStatusLabel, name: "Do they have any family history of hereditary illnesses?", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(screenSize.width/20, 2 * screenSize.height/10, 500, 30), page: self)
        familyHistoryStatusLabel.font = UIFont(name: (familyHistoryStatusLabel.font?.fontName)!, size:30)
        familyHistoryStatusLabel.sizeToFit()
        creationFunctions.makeCheckBox(familyHistoryBox, frame: CGRectMake(8.5 * screenSize.width/10 , screenSize.height*2/10, 50, 50), page: self)
        creationFunctions.makeButton(familyHistoryButton, name: "", titleColor: UIColor.clearColor(), location: familyHistoryBox.frame, page: self)
        familyHistoryButton.addTarget(self, action: "yesHistory:", forControlEvents: .TouchUpInside)
        creationFunctions.makeTextField(familyHistoryField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(screenSize.width/20 , screenSize.height * 3/10, 800, 400), page: self)
        familyHistoryField.placeholder = "PLease Elaborate"
        familyHistoryField.hidden = true

        
        self.configureView()
    }
    
    func saveClicked(sender: UIButton){
        let alertController = UIAlertController(title: "Form not comleted", message: "You checked a box and that you did not elaborate for.", preferredStyle: .Alert)
        print("Didn't elaborate on a field on NewPatient.")
        // Initialize Actions
        let ContinueAction = UIAlertAction(title: "Continue Anyway", style: .Default) { (action) -> Void in
            //@Mehrab save the data
            print("Saving new patient data.")
        }
        let okayAction = UIAlertAction(title: "Okay", style: .Default) { (action) -> Void in
            print("Completing NewPatientFamilyHistoryPage")
        }
        // Add Actions
        alertController.addAction(ContinueAction)
        alertController.addAction(okayAction)
    if familyHistoryBox.isChecked && familyHistoryField.text == ""{
    self.presentViewController(alertController, animated: true, completion: nil)
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
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    
    // Called when the user click on the view (outside the UITextField). Resigns first responder (closes keyboard)
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backClicked(sender: UIBarButtonItem!){
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
    func yesHistory (sender:UIButton){
        if !familyHistoryBox.isChecked{
            familyHistoryBox.isChecked = !familyHistoryBox.isChecked
            familyHistoryField.text = ""
            familyHistoryField.hidden = false
            familyHistoryField.enabled = true
            self.configureView()
        } else{
            familyHistoryBox.isChecked = !familyHistoryBox.isChecked
            familyHistoryField.hidden = true
            familyHistoryField.enabled = false
            self.configureView()
        }
    }
    
    func sendPatientData(patientData: PatientData){
        //get object mapper in order to allow us to send a logindata object to the ddb server.
        let dynamoDBObjectMapper = AWSDynamoDBObjectMapper.defaultDynamoDBObjectMapper();
        
        //save allows us to "save" this new login data to the server.
        dynamoDBObjectMapper.save(patientData).continueWithExecutor(AWSExecutor.mainThreadExecutor(), withBlock:
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