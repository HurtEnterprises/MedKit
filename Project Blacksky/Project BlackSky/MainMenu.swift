//
//  MainMenu.swift
//  Project BlackSky
//
//  Created by Deven  on 1/6/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

let creationFunctions: UICreationFunctions = UICreationFunctions()
let registerPage: AccountRegisterPage = AccountRegisterPage()
let loginPage:LoginPage = LoginPage()
let myPatientsPage: MyPatients = MyPatients()
let myAppointmentsPage: MyApointments = MyApointments()
let NewPatientPage: NewPatient = NewPatient()


class MainMenu: UIViewController {

    func configureView() {
        // Update the user interface for the detail item.
        self.view.backgroundColor = UIColor.cyanColor()
    }
    // Initializes labels and buttons
    let mainMenuLabel:UILabel = UILabel()
    let nextPatientLabel:UILabel = UILabel()
    let appointmentTime:UILabel = UILabel()
    
    let startVisitButton:UIButton = UIButton()
    let scheduleButton:UIButton = UIButton()
    let myPatientsButton:UIButton = UIButton()
    let chatButton:UIButton = UIButton()
    let logoutButton:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creationFunctions.setBackgroundColor("MainBackground", page: self)

            // Makes Navigation Bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
        navigationBar.backgroundColor = UIColor.grayColor()
        // Create a navigation item with a title
        let navigationItem = UINavigationItem()
        navigationItem.title = ""
                   // Create two buttons for the navigation item
        let rightButton =  UIBarButtonItem(title: "Get Dr's Name | My Account", style:   UIBarButtonItemStyle.Plain, target: self, action: "nextClickedClicked:")
            // Create two buttons for the navigation item
            navigationItem.rightBarButtonItem = rightButton
        
        // Assign the navigation item to the navigation bar
        navigationBar.items = [navigationItem]
        //Adds the bar to the view
        self.view.addSubview(navigationBar)
        
        creationFunctions.makeLabel(mainMenuLabel, name: "Main Menu", textColor: UIColor.whiteColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width/2, (height-50)/8, 200, 50), page: self)
        mainMenuLabel.sizeToFit()
        
        creationFunctions.makeLabel(nextPatientLabel, name: "My Next Patient Is:", textColor: UIColor.whiteColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width/2, (height-50)/4 , 200, 50), page: self)
        
        creationFunctions.makeLabel(appointmentTime, name: "At + time", textColor: UIColor.whiteColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width/2, (height-50)*3/8, 200, 50), page: self)
        
        creationFunctions.makeButton(startVisitButton, name: "*Patient Name*", titleColor: UIColor.whiteColor(), location: CGRectMake(width/2,(height-50)/2 , 200, 50), page: self)
        
        creationFunctions.makeButton(scheduleButton, name: "My Schedule", titleColor: UIColor.whiteColor(), location: CGRectMake(width/2, (height-50)*5/8, 200, 50), page: self)
        
        creationFunctions.makeButton(chatButton, name: "Chat", titleColor: UIColor.whiteColor(), location: CGRectMake(width/2, (height-50)*3/4, 200, 50), page: self)
        
        creationFunctions.makeButton(logoutButton, name: "Logout", titleColor: UIColor.whiteColor(), location: CGRectMake(width/2, (height-50)*7/8, 200, 50), page: self)
    }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    func logoutClicked(){
        if(self.presentedViewController == registerPage){
            registerPage.dismissViewControllerAnimated(true, completion: nil)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        //TODO: @Mehrab add some sort of logout function or we can make it so the user is logged out whenever they hit the login page?
    }
    
    func backClicked(sender: UIBarButtonItem!){
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
    func myPatientsClicked(){
        self.presentViewController(myPatientsPage, animated: true, completion: nil)
    }
    
    func myAppointmentsClicked(){
        self.presentViewController(myAppointmentsPage, animated: true, completion: nil)
    }
    
    func newPatientClicked(){
        self.presentViewController(NewPatientPage, animated: true, completion: nil)
    }
    
}
    



