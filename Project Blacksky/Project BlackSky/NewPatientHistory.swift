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
    
    let yesLabel:UILabel = UILabel()
    let noLabel:UILabel = UILabel()
    let smokerStatusLabel:UILabel = UILabel()
    let smokerBox:CheckBox = CheckBox()
    let drinkLabel:UILabel = UILabel()
    let drinkBox:CheckBox = CheckBox()
    let currentMedsLabel:UILabel = UILabel()
    let currentMedsBox:CheckBox = CheckBox()
    let currentConditionsLabel:UILabel = UILabel()
    let currentConditionsBox:CheckBox = CheckBox()
    let currentMedicationsLabel:UILabel = UILabel()
    let currentMedicationsBox:CheckBox = CheckBox()
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
        
        smokerBox.frame = CGRectMake(screenSize.width/2, screenSize.height/2, 30, 30)
        smokerBox.backgroundColor = self.view.backgroundColor
        
        self.view.addSubview(smokerBox)
        

        
        self.configureView()
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