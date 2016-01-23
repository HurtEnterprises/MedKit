//
//  NewPatientHistory.swift
//  Project BlackSky
//
//  Created by Deven  on 1/10/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit 

class NewPatientHistory: UIViewController {
    
    let mainMenu: MainMenu = MainMenu()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    
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
        
        
        creationFunctions.makeLabel(drinkLabel, name: "Do they regularly consume alcohol?", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(0.5 * screenSize.width/10, 3.5 * screenSize.height/10, 500, 35), page: self)
        drinkLabel.font = UIFont(name: (drinkLabel.font?.fontName)!, size:30)
        drinkLabel.sizeToFit()
        creationFunctions.makeCheckBox(drinkBox, frame: CGRectMake(8 * screenSize.width/10 , screenSize.height*3.5/10, 50, 50), page: self)
        creationFunctions.makeButton(drinkButton, name: "", titleColor: UIColor.clearColor(), location: drinkBox.frame, page: self)
        drinkButton.addTarget(self, action: "doesDrink:", forControlEvents: .TouchUpInside)

        creationFunctions.makeLabel(currentMedsLabel, name: "Do they regularly take any medications?", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(screenSize.width/20, 5 * screenSize.height/10, 500, 35), page: self)
        currentMedsLabel.font = UIFont(name: (currentMedsLabel.font?.fontName)!, size:30)
        creationFunctions.makeCheckBox(currentMedsBox, frame: CGRectMake(8 * screenSize.width/10 , screenSize.height*5/10, 50, 50), page: self)
        currentMedsLabel.sizeToFit()
        creationFunctions.makeButton(currentMedsButton, name: "", titleColor: UIColor.clearColor(), location: currentMedsBox.frame, page: self)
        
        creationFunctions.makeLabel(currentConditionsLabel, name: "Do they have any persisting medical conditions?", textColor: UIColor.blackColor(), alignment: NSTextAlignment.Left, frame: CGRectMake(screenSize.width/20, 6.5 * screenSize.height/10, 500, 35), page: self)
        currentConditionsLabel.font = UIFont(name: (currentConditionsLabel.font?.fontName)!, size:30)
        currentConditionsLabel.sizeToFit()
        creationFunctions.makeCheckBox(currentConditionsBox, frame: CGRectMake(8 * screenSize.width/10 , screenSize.height*6.5/10, 50, 50), page: self)
        creationFunctions.makeButton(currentConditionsButton, name: "", titleColor: UIColor.clearColor(), location: currentConditionsBox.frame, page: self)
        self.configureView()
    }
    
    func doesSmoke(sender: UIButton){
        if smokerBox.isChecked{
            smokerBox.isChecked = !smokerBox.isChecked
            creationFunctions.makeTextField(smokerField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake(8 * screenSize.width/10 , screenSize.height * 2.5/10, 50, 50), page: self)
            smokerField.placeholder = "How much/how often?"
        } else{
            smokerBox.isChecked = !smokerBox.isChecked
            smokerField.hidden = true
            smokerField.enabled = false
        }
    }
    
    func doesDrink(Sender: UIButton){
        
    }
    
    func nextClicked(sender: UIButton){
        
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