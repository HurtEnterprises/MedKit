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
        self.view.backgroundColor = UIColor.cyanColor()
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
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
        
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "New Patient: Personal History", color: UIColor.grayColor(), forwardButton: false, backButton: true, page: self)
        
        creationFunctions.makeButton(nextButton, name: "Next", titleColor: UIColor.blackColor(), location: CGRectMake((screenSize.width-150)/2, 8*screenSize.height/10, 150, 40), page: self)
        nextButton.titleLabel?.font = UIFont(name: (nextButton.titleLabel?.font?.fontName)!, size: 30)
        nextButton.addTarget(self, action: "nextClicked:", forControlEvents: .TouchUpInside)
        
        creationFunctions.makeLabel(greetingLabel, name: "Please answer the following questions by touching the checkbox:", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(screenSize.width/10, screenSize.height/15, 800, 40), page: self)
        greetingLabel.font = UIFont(name: (greetingLabel.font?.fontName)!, size: 25)
        greetingLabel.sizeToFit()
        
        creationFunctions.makeLabel(smokerStatusLabel, name: "Do they regularly smoke?", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(screenSize.width/20, 2 * screenSize.height/10, 500, 30), page: self)
        smokerStatusLabel.font = UIFont(name: (smokerStatusLabel.font?.fontName)!, size:30)
        smokerStatusLabel.sizeToFit()
        creationFunctions.makeCheckBox(smokerBox, frame: CGRectMake(8 * screenSize.width/10 , screenSize.height*2/10, 50, 50), page: self)
        creationFunctions.makeButton(smokerButton, name: "", titleColor: UIColor.clearColor(), location: smokerBox.frame, page: self)
        smokerButton.addTarget(self, action: "doesSmoke:", forControlEvents: .TouchUpInside)
        creationFunctions.makeTextField(smokerField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(screenSize.width/20 , screenSize.height * 2.5/10, 600, 50), page: self)
        smokerField.placeholder = "How much/how often?"
        smokerField.hidden = true
        
        creationFunctions.makeLabel(drinkLabel, name: "Do they regularly consume alcohol?", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(0.5 * screenSize.width/10, 3.5 * screenSize.height/10, 500, 35), page: self)
        drinkLabel.font = UIFont(name: (drinkLabel.font?.fontName)!, size:30)
        drinkLabel.sizeToFit()
        creationFunctions.makeCheckBox(drinkBox, frame: CGRectMake(8 * screenSize.width/10 , screenSize.height*3.5/10, 50, 50), page: self)
        creationFunctions.makeButton(drinkButton, name: "", titleColor: UIColor.clearColor(), location: drinkBox.frame, page: self)
        drinkButton.addTarget(self, action: "doesDrink:", forControlEvents: .TouchUpInside)
        creationFunctions.makeTextField(drinkerField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(screenSize.width/20 , screenSize.height * 4/10, 600, 50), page: self)
        drinkerField.placeholder = "How much/how often?"
        drinkerField.hidden = true

        creationFunctions.makeLabel(currentMedsLabel, name: "Do they regularly take any medications?", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(screenSize.width/20, 5 * screenSize.height/10, 500, 35), page: self)
        currentMedsLabel.font = UIFont(name: (currentMedsLabel.font?.fontName)!, size:30)
        creationFunctions.makeCheckBox(currentMedsBox, frame: CGRectMake(8 * screenSize.width/10 , screenSize.height*5/10, 50, 50), page: self)
        currentMedsLabel.sizeToFit()
        creationFunctions.makeButton(currentMedsButton, name: "", titleColor: UIColor.clearColor(), location: currentMedsBox.frame, page: self)
        currentMedsButton.addTarget(self, action: "yesMeds:", forControlEvents: .TouchUpInside)
        creationFunctions.makeTextField(medsField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(screenSize.width/20 , screenSize.height * 5.5/10, 600, 50), page: self)
        medsField.placeholder = "Which ones/how often?"
        medsField.hidden = true
        
        creationFunctions.makeLabel(currentConditionsLabel, name: "Do they have any persisting medical conditions?", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(screenSize.width/20, 6.5 * screenSize.height/10, 500, 35), page: self)
        currentConditionsLabel.font = UIFont(name: (currentConditionsLabel.font?.fontName)!, size:30)
        currentConditionsLabel.sizeToFit()
        creationFunctions.makeCheckBox(currentConditionsBox, frame: CGRectMake(8 * screenSize.width/10 , screenSize.height*6.5/10, 50, 50), page: self)
        creationFunctions.makeButton(currentConditionsButton, name: "", titleColor: UIColor.clearColor(), location: currentConditionsBox.frame, page: self)
        currentConditionsButton.addTarget(self, action: "yesConditions:", forControlEvents: .TouchUpInside)
        creationFunctions.makeTextField(conditionsField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(screenSize.width/20 , screenSize.height * 7/10, 600, 50), page: self)
        conditionsField.placeholder = "Please elaborate"
        conditionsField.hidden = true
        
        self.configureView()
    }
    
    func doesSmoke(sender: UIButton){
        if !smokerBox.isChecked{
            smokerBox.isChecked = !smokerBox.isChecked
            smokerField.text = ""
            smokerField.hidden = false
            smokerField.enabled = true
            self.configureView()
        } else{
            smokerBox.isChecked = !smokerBox.isChecked
            smokerField.hidden = true
            smokerField.enabled = false
            self.configureView()
        }
    }
    
    func doesDrink(Sender: UIButton){
        if !drinkBox.isChecked{
            drinkBox.isChecked = !drinkBox.isChecked
            drinkerField.text = ""
            drinkerField.hidden = false
            drinkerField.enabled = true
            self.configureView()
        } else{
            drinkBox.isChecked = !drinkBox.isChecked
            drinkerField.hidden = true
            drinkerField.enabled = false
            self.configureView()
        }
    }
    
    func yesMeds(sender:UIButton){
        if !currentMedsBox.isChecked{
            currentMedsBox.isChecked = !currentMedsBox.isChecked
            medsField.text = ""
            medsField.hidden = false
            medsField.enabled = true
            self.configureView()
        } else{
            currentMedsBox.isChecked = !currentMedsBox.isChecked
            medsField.hidden = true
            medsField.enabled = false
            self.configureView()
        }
    }
    
    func yesConditions(sender:UIButton){
        if !currentConditionsBox.isChecked{
            currentConditionsBox.isChecked = !currentConditionsBox.isChecked
            conditionsField.text = ""
            conditionsField.hidden = false
            conditionsField.enabled = true
            self.configureView()
        } else{
            currentConditionsBox.isChecked = !currentConditionsBox.isChecked
            conditionsField.hidden = true
            conditionsField.enabled = false
            self.configureView()
        }
    }
    
    func nextClicked(sender: UIButton){
        let alertController = UIAlertController(title: "Form not comleted", message: "You checked a box and that you did not elaborate for.", preferredStyle: .Alert)
        print("Didn't elaborate on a field on NewPatient.")
        // Initialize Actions
        let ContinueAction = UIAlertAction(title: "Continue Anyway", style: .Default) { (action) -> Void in
            self.presentViewController(patientFamilyHistoryPage, animated: true, completion: nil)
            //@Mehrab: should be same as below
            print("Moving to family history anyways.")
        }
        let okayAction = UIAlertAction(title: "Okay", style: .Default) { (action) -> Void in
            print("Completing NewPatientHistoryPage")
        }
        // Add Actions
        alertController.addAction(ContinueAction)
        alertController.addAction(okayAction)
        if smokerBox.isChecked && smokerField.text == ""{
            self.presentViewController(alertController, animated: true, completion: nil)
        } else if drinkBox.isChecked && drinkerField.text == "" {
            self.presentViewController(alertController, animated: true, completion: nil)
        }else if currentConditionsBox.isChecked && conditionsField.text == "" {
            self.presentViewController(alertController, animated: true, completion: nil)
        }else if currentMedsBox.isChecked && medsField.text == ""{
            self.presentViewController(alertController, animated: true, completion: nil)
        }else{
            //@Mehrab do your thing. I didn't wanna make seperate variables for everything cause that seemed sloppy, but the bool for smoker and drinker are represented by smokerbox.ischecked and drinkbox.ischecked respectively. As for the fields, to get the strings,use: smokerField.text, drinkerField.text, conditionsField.text, and medsField.text. Lemme know if you have questions
            print("TESTING TESTING TESTING")
            self.presentViewController(patientFamilyHistoryPage, animated: true, completion: nil)
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
    
}