//
//  NewPatientHistory.swift
//  Project BlackSky
//
//  Created by Deven  on 1/10/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit 

let patientFamilyHistoryPage: NewPatientFamilyHistory = NewPatientFamilyHistory()

class NewPatientHistory: UIViewController {
    
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
    let smokerStatusLabel:UILabel = UILabel()
    let smokerBox:CheckBox = CheckBox()
    let smokerButton:UIButton = UIButton()
    let smokerField:UITextField = UITextField()
    let drinkLabel:UILabel = UILabel()
    let drinkBox:CheckBox = CheckBox()
    let drinkButton:UIButton = UIButton()
    let drinkerField:UITextField = UITextField()
    let currentMedsLabel:UILabel = UILabel()
    let currentMedsBox:CheckBox = CheckBox()
    let currentMedsButton:UIButton = UIButton()
    let medsField:UITextField = UITextField()
    let currentConditionsLabel:UILabel = UILabel()
    let currentConditionsButton:UIButton = UIButton()
    let currentConditionsBox:CheckBox = CheckBox()
    let conditionsField:UITextField = UITextField()
    let nextButton:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Makes Navigation Bar
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 50)) // Offset by 20 pixels vertically to take the status bar into account
        
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "New Patient: Personal History", forwardButton: false, backButton: true, page: self)
        
        creationFunctions.makeButton(nextButton, name: "Next", titleColor: UIColor.black, location: CGRect(x: (screenSize.width-150)/2, y: 8*screenSize.height/10, width: 150, height: 40), page: self)
        nextButton.titleLabel?.font = UIFont(name: (nextButton.titleLabel?.font?.fontName)!, size: 30)
        nextButton.addTarget(self, action: #selector(NewPatientHistory.nextClicked(_:)), for: .touchUpInside)
        
        creationFunctions.makeLabel(greetingLabel, name: "Please answer the following questions by touching the checkbox:", textColor: UIColor.black, alignment: NSTextAlignment.left, frame: CGRect(x: screenSize.width/10, y: screenSize.height/15, width: 800, height: 40), page: self)
        greetingLabel.font = UIFont(name: (greetingLabel.font?.fontName)!, size: 25)
        greetingLabel.sizeToFit()
        
        creationFunctions.makeLabel(smokerStatusLabel, name: "Do they regularly smoke?", textColor: UIColor.black, alignment: NSTextAlignment.left, frame: CGRect(x: screenSize.width/20, y: 2 * screenSize.height/10, width: 500, height: 30), page: self)
        smokerStatusLabel.font = UIFont(name: (smokerStatusLabel.font?.fontName)!, size:30)
        smokerStatusLabel.sizeToFit()
        creationFunctions.makeCheckBox(smokerBox, frame: CGRect(x: 8 * screenSize.width/10 , y: screenSize.height*2/10, width: 50, height: 50), page: self)
        creationFunctions.makeButton(smokerButton, name: "", titleColor: UIColor.clear, location: smokerBox.frame, page: self)
        smokerButton.addTarget(self, action: #selector(NewPatientHistory.doesSmoke(_:)), for: .touchUpInside)
        creationFunctions.makeTextField(smokerField, backgroundColor: UIColor.lightGray, frame: CGRect(x: screenSize.width/20 , y: screenSize.height * 2.5/10, width: 600, height: 50), page: self)
        smokerField.placeholder = "How much/how often?"
        smokerField.isHidden = true
        
        creationFunctions.makeLabel(drinkLabel, name: "Do they regularly consume alcohol?", textColor: UIColor.black, alignment: NSTextAlignment.left, frame: CGRect(x: 0.5 * screenSize.width/10, y: 3.5 * screenSize.height/10, width: 500, height: 35), page: self)
        drinkLabel.font = UIFont(name: (drinkLabel.font?.fontName)!, size:30)
        drinkLabel.sizeToFit()
        creationFunctions.makeCheckBox(drinkBox, frame: CGRect(x: 8 * screenSize.width/10 , y: screenSize.height*3.5/10, width: 50, height: 50), page: self)
        creationFunctions.makeButton(drinkButton, name: "", titleColor: UIColor.clear, location: drinkBox.frame, page: self)
        drinkButton.addTarget(self, action: #selector(NewPatientHistory.doesDrink(_:)), for: .touchUpInside)
        creationFunctions.makeTextField(drinkerField, backgroundColor: UIColor.lightGray, frame: CGRect(x: screenSize.width/20 , y: screenSize.height * 4/10, width: 600, height: 50), page: self)
        drinkerField.placeholder = "How much/how often?"
        drinkerField.isHidden = true

        creationFunctions.makeLabel(currentMedsLabel, name: "Do they regularly take any medications?", textColor: UIColor.black, alignment: NSTextAlignment.left, frame: CGRect(x: screenSize.width/20, y: 5 * screenSize.height/10, width: 500, height: 35), page: self)
        currentMedsLabel.font = UIFont(name: (currentMedsLabel.font?.fontName)!, size:30)
        creationFunctions.makeCheckBox(currentMedsBox, frame: CGRect(x: 8 * screenSize.width/10 , y: screenSize.height*5/10, width: 50, height: 50), page: self)
        currentMedsLabel.sizeToFit()
        creationFunctions.makeButton(currentMedsButton, name: "", titleColor: UIColor.clear, location: currentMedsBox.frame, page: self)
        currentMedsButton.addTarget(self, action: #selector(NewPatientHistory.yesMeds(_:)), for: .touchUpInside)
        creationFunctions.makeTextField(medsField, backgroundColor: UIColor.lightGray, frame: CGRect(x: screenSize.width/20 , y: screenSize.height * 5.5/10, width: 600, height: 50), page: self)
        medsField.placeholder = "Which ones/how often?"
        medsField.isHidden = true
        
        creationFunctions.makeLabel(currentConditionsLabel, name: "Do they have any persisting medical conditions?", textColor: UIColor.black, alignment: NSTextAlignment.left, frame: CGRect(x: screenSize.width/20, y: 6.5 * screenSize.height/10, width: 500, height: 35), page: self)
        currentConditionsLabel.font = UIFont(name: (currentConditionsLabel.font?.fontName)!, size:30)
        currentConditionsLabel.sizeToFit()
        creationFunctions.makeCheckBox(currentConditionsBox, frame: CGRect(x: 8 * screenSize.width/10 , y: screenSize.height*6.5/10, width: 50, height: 50), page: self)
        creationFunctions.makeButton(currentConditionsButton, name: "", titleColor: UIColor.clear, location: currentConditionsBox.frame, page: self)
        currentConditionsButton.addTarget(self, action: #selector(NewPatientHistory.yesConditions(_:)), for: .touchUpInside)
        creationFunctions.makeTextField(conditionsField, backgroundColor: UIColor.lightGray, frame: CGRect(x: screenSize.width/20 , y: screenSize.height * 7/10, width: 600, height: 50), page: self)
        conditionsField.placeholder = "Please elaborate"
        conditionsField.isHidden = true
        
        self.configureView()
    }
    
    func doesSmoke(_ sender: UIButton){
        if !smokerBox.isChecked{
            smokerBox.isChecked = !smokerBox.isChecked
            smokerField.text = ""
            smokerField.isHidden = false
            smokerField.isEnabled = true
            self.configureView()
        } else{
            smokerBox.isChecked = !smokerBox.isChecked
            smokerField.isHidden = true
            smokerField.isEnabled = false
            self.configureView()
        }
    }
    
    func doesDrink(_ Sender: UIButton){
        if !drinkBox.isChecked{
            drinkBox.isChecked = !drinkBox.isChecked
            drinkerField.text = ""
            drinkerField.isHidden = false
            drinkerField.isEnabled = true
            self.configureView()
        } else{
            drinkBox.isChecked = !drinkBox.isChecked
            drinkerField.isHidden = true
            drinkerField.isEnabled = false
            self.configureView()
        }
    }
    
    func yesMeds(_ sender:UIButton){
        if !currentMedsBox.isChecked{
            currentMedsBox.isChecked = !currentMedsBox.isChecked
            medsField.text = ""
            medsField.isHidden = false
            medsField.isEnabled = true
            self.configureView()
        } else{
            currentMedsBox.isChecked = !currentMedsBox.isChecked
            medsField.isHidden = true
            medsField.isEnabled = false
            self.configureView()
        }
    }
    
    func yesConditions(_ sender:UIButton){
        if !currentConditionsBox.isChecked{
            currentConditionsBox.isChecked = !currentConditionsBox.isChecked
            conditionsField.text = ""
            conditionsField.isHidden = false
            conditionsField.isEnabled = true
            self.configureView()
        } else{
            currentConditionsBox.isChecked = !currentConditionsBox.isChecked
            conditionsField.isHidden = true
            conditionsField.isEnabled = false
            self.configureView()
        }
    }
    
    func nextClicked(_ sender: UIButton){
        let alertController = UIAlertController(title: "Form not comleted", message: "You checked a box and that you did not elaborate for.", preferredStyle: .alert)
        print("Didn't elaborate on a field on NewPatient.")
        // Initialize Actions
        let ContinueAction = UIAlertAction(title: "Continue Anyway", style: .default) { (action) -> Void in
            self.present(patientFamilyHistoryPage, animated: true, completion: nil)
            //@Mehrab: should be same as below
            print("Moving to family history anyways.")
        }
        let okayAction = UIAlertAction(title: "Okay", style: .default) { (action) -> Void in
            print("Completing NewPatientHistoryPage")
        }
        // Add Actions
        alertController.addAction(ContinueAction)
        alertController.addAction(okayAction)
        if smokerBox.isChecked && smokerField.text == ""{
            self.present(alertController, animated: true, completion: nil)
        } else if drinkBox.isChecked && drinkerField.text == "" {
            self.present(alertController, animated: true, completion: nil)
        }else if currentConditionsBox.isChecked && conditionsField.text == "" {
            self.present(alertController, animated: true, completion: nil)
        }else if currentMedsBox.isChecked && medsField.text == ""{
            self.present(alertController, animated: true, completion: nil)
        }else{
            //@Mehrab do your thing. I didn't wanna make seperate variables for everything cause that seemed sloppy, but the bool for smoker and drinker are represented by smokerbox.ischecked and drinkbox.ischecked respectively. As for the fields, to get the strings,use: smokerField.text, drinkerField.text, conditionsField.text, and medsField.text. Lemme know if you have questions
            print("TESTING TESTING TESTING")
            self.present(patientFamilyHistoryPage, animated: true, completion: nil)
            if(smokerBox.isChecked){
                patientPrototype.smokerStatus = "YES"
            } else {
                patientPrototype.smokerStatus = "NO"
            }
            
            if(drinkBox.isChecked){
                patientPrototype.drinkerStatus = "YES"
            } else {
                patientPrototype.drinkerStatus = "NO"
            }
            //TODO: Enforce comma delimited list for medsfield and conditions field.
            //NOTE: Currently we accept no-space separated, only-comma-separated lists of values
            let medsArray = medsField.text!.characters.split{$0 == ","}.map(String.init)
            let conditionsArray = conditionsField.text!.characters.split{$0 == ","}.map(String.init)
            patientPrototype.currentMedications = medsArray
            patientPrototype.prexistingContitions = conditionsArray
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
    
}
