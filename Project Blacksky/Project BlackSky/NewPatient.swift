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
    
    let middleNameLabel:UILabel = UILabel()
    let DOBLabel:UILabel = UILabel() //DOB = Date of Birth
    let insuranceProviderLabel:UILabel = UILabel()
    let policyNumberLabel:UILabel = UILabel()
    let addressLabel:UILabel = UILabel()
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
    
    //TODO: Consult with practicing doctors to see what other info is required
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Makes Navigation Bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
        
        // Makes cooresponding labels and text fields
        
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "New Patient: General Information", color: UIColor.grayColor(), forwardButton: false, backButton: true, page: self)
        
        creationFunctions.makeTextField(firstNameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 - 350, screenSize.height/10, 300, 35), page: self)
        firstNameField.placeholder = "First Name"
        
        creationFunctions.makeTextField(middleNameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2, screenSize.height/10 , 300, 35), page: self)
        middleNameField.placeholder = "Middle Name"
        
        creationFunctions.makeTextField(lastNameField, backgroundColor: UIColor.lightGrayColor(), frame: CGRectMake((screenSize.width-300)/2 + 350, screenSize.height/10, 300, 35), page: self)
        lastNameField.placeholder = "Last Name"
        
  //      creationFunctions.makeLabel(<#T##label: UILabel##UILabel#>, name: <#T##String#>, textColor: <#T##UIColor#>, alignment: <#T##NSTextAlignment#>, frame: //<#T##CGRect#>, page: <#T##UIViewController#>)
        
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backClicked(sender: UIBarButtonItem!){
        self.presentViewController(self.mainMenu, animated: true, completion: nil)
    }

}