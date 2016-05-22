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
    
    var underlineAttributes = [
        NSFontAttributeName : UIFont.boldSystemFontOfSize(50.0),
        NSForegroundColorAttributeName : UIColor.whiteColor(),
        NSUnderlineStyleAttributeName : 1]
    
    var infoMessageAttributes = [
        NSFontAttributeName : UIFont.systemFontOfSize(40.0),
        NSForegroundColorAttributeName : UIColor.whiteColor()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creationFunctions.setBackgroundColor("MainBackground", page: self)
        
        //TODO: Pull from class info
        var doctorName = "Doctor Name"
        
        //TODO: Pull from call
        var patientName = NSMutableAttributedString(string:"PATIENT NAME", attributes: underlineAttributes)
        
        // Adds navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.frame = CGRectMake(0, 10, width, height/20)
        
        let backArrowButton =  UIButton(type: .Custom)
        backArrowButton.setImage(UIImage(named: "BackArrow"), forState: .Normal)
        backArrowButton.addTarget(self, action: "backClicked:", forControlEvents: .TouchUpInside)
        backArrowButton.frame = CGRectMake(0, 0, width/25, height/12)
        
        
        let backWord: UIButton = UIButton()
        creationFunctions.makeButton(backWord, name: "Back", titleColor: UIColor.whiteColor(), location: CGRectMake(width/25, height/35, width/10, 34), page: self)
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 34)
        backWord.titleLabel?.text = "Back"
        backWord.titleLabel?.textAlignment = .Center
        backWord.titleLabel?.textColor = UIColor.whiteColor()
        backWord.backgroundColor = UIColor.clearColor()
        backWord.addTarget(self, action: "backClicked:", forControlEvents: .TouchUpInside)
        backArrowButton.addSubview(backWord)
        let barButton = UIBarButtonItem(customView: backArrowButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        let rightButton =  UIBarButtonItem(title: "\(doctorName) | My Account", style:   UIBarButtonItemStyle.Plain, target: self, action: "myAccoutClicked:")
        self.navigationItem.rightBarButtonItem = rightButton
        
        creationFunctions.makeLabel(mainMenuLabel, name: "MAIN   MENU", textColor: UIColor.whiteColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width/5, (height)/10, 200, 50), page: self)
        mainMenuLabel.font = mainMenuLabel.font.fontWithSize(110)
        mainMenuLabel.layer.shadowColor = UIColor.blackColor().CGColor
        mainMenuLabel.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        mainMenuLabel.layer.shadowRadius = 3
        mainMenuLabel.layer.shadowOpacity = 0.4
        mainMenuLabel.sizeToFit()
        
        creationFunctions.makeLabel(nextPatientLabel, name: "MY  NEXT  PATIENT  IS", textColor: UIColor.whiteColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width/4, 2.1*(height)/10 , 200, 50), page: self)
        nextPatientLabel.font = nextPatientLabel.font.fontWithSize(50)
        nextPatientLabel.sizeToFit()
        
        creationFunctions.makeClearButton(startVisitButton, name: "click for patient info", titleColor: UIColor.whiteColor(), location: CGRectMake(width/10,(height) * 0.26, width * 0.8, 1.2 * height/10), page: self)
        var clickforinfomessage = NSMutableAttributedString(string: "\nclick for patient info", attributes: infoMessageAttributes)
        patientName.appendAttributedString(clickforinfomessage)
        startVisitButton.titleLabel?.numberOfLines = 2
        startVisitButton.setAttributedTitle(patientName, forState: .Normal)
        startVisitButton.titleLabel?.font = startVisitButton.titleLabel!.font.fontWithSize(40)
        startVisitButton.layer.borderWidth = 6.0
        startVisitButton.titleLabel?.textAlignment = NSTextAlignment.Center
        startVisitButton.addTarget(self, action: "patientInfoClicked:", forControlEvents: .TouchUpInside)
        
        
        //TODO: get time from cal
        creationFunctions.makeLabel(appointmentTime, name: "At + time", textColor: UIColor.whiteColor(), alignment: NSTextAlignment.Center, frame: CGRectMake(width/2, (height)*0.4, 200, 50), page: self)
        appointmentTime.center = CGPointMake(width/2, (height)*0.4)
        appointmentTime.textAlignment = .Center
        appointmentTime.font = appointmentTime.font.fontWithSize(50.0)
        appointmentTime.sizeToFit()
        
        let scheduleText = NSMutableAttributedString(string:"TODAY'S SCHEDULE", attributes: underlineAttributes)
        creationFunctions.makeClearButton(scheduleButton, name: "My Schedule", titleColor: UIColor.whiteColor(), location: CGRectMake(width/2, (height-50)*5/8,  8 * width/10, height/8), page: self)
        scheduleButton.setAttributedTitle(scheduleText, forState: .Normal)
        scheduleButton.layer.borderWidth = 6.0
        scheduleButton.center = CGPointMake(width/2, height * 10.5/20)
        scheduleButton.addTarget(self, action: "myAppointmentsClicked:", forControlEvents: .TouchUpInside)
        
        
        let myPatientsText = NSMutableAttributedString(string:"MY PATIENTS", attributes: underlineAttributes)
        creationFunctions.makeClearButton(myPatientsButton, name: "My Patients", titleColor: UIColor.whiteColor(), location:  CGRectMake(width/2, (height-50)*5/8,  8 * width/10, height/8), page: self)
        myPatientsButton.center = CGPointMake(width/2, height * 13.25/20)
        myPatientsButton.layer.borderWidth = 6.0
        myPatientsButton.setAttributedTitle(myPatientsText, forState: .Normal)

        let chatText = NSMutableAttributedString(string:"CHAT", attributes: underlineAttributes)
        creationFunctions.makeClearButton(chatButton, name: "Chat", titleColor: UIColor.whiteColor(), location: CGRectMake(width/2, (height-50)*3/4, 8 * width/10, height/8), page: self)
        chatButton.center = CGPointMake(width/2, height * 14.5/20)
        chatButton.layer.borderWidth = 6.0
        chatButton.center = CGPointMake(width/2, 8 * height/10)
        chatButton.setAttributedTitle(chatText, forState: .Normal)
        
        creationFunctions.makeClearButton(logoutButton, name: "LOG OUT", titleColor: UIColor.whiteColor(), location: CGRectMake((2/3*width)/2,  17 * height/20, width/2, height/10), page: self)
        logoutButton.titleLabel?.font = UIFont(name: (logoutButton.titleLabel?.font?.fontName)!, size: 60)
        logoutButton.center = CGPointMake(width/2, 18.5 * height/20)
        logoutButton.layer.borderColor = UIColor.clearColor().CGColor
        logoutButton.layer.shadowColor = UIColor.blackColor().CGColor
        logoutButton.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        logoutButton.layer.shadowRadius = 3
        logoutButton.layer.shadowOpacity = 0.2
        logoutButton.addTarget(self, action: "logoutClicked:", forControlEvents: .TouchUpInside)
        // Gradient stuff for login button
        let logoutLayer : CAGradientLayer = CAGradientLayer()
        logoutLayer.frame.size = logoutButton.frame.size
        let color1 = UIColor(red: 190/256, green: 190/256, blue: 190/256, alpha: 1.0).CGColor as CGColorRef
        let color2 = UIColor(red: 255/256, green: 251/256, blue: 251/256, alpha: 0.0).CGColor as CGColorRef
        logoutLayer.colors = [color2, color1]
        logoutLayer.locations = [0.0, 0.7]
        logoutButton.layer.insertSublayer(logoutLayer, atIndex: 0)
    }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    func logoutClicked(sender: UIButton!){
//        if(self.presentedViewController == registerPage){
//            registerPage.dismissViewControllerAnimated(true, completion: nil)
//        }
//        self.dismissViewControllerAnimated(true, completion: nil)
        self.navigationController?.popToViewController(loginPage, animated: true)
        //TODO: @Mehrab add some sort of logout function or we can make it so the user is logged out whenever they hit the login page?
    }
    
    func myAccoutClicked(sender: UIBarButtonItem!){
        print("My Account")
    }
    
    func patientInfoClicked(sender: UIButton!){
        print("Patient Info CLicked")
    }
    
    func backClicked(sender: UIBarButtonItem!){
            self.navigationController?.popToViewController(loginPage, animated: true)
    }
    
    func myPatientsClicked(sender:UIButton){
        self.navigationController?.pushViewController(myPatientsPage, animated: true)
    }
    
    func myAppointmentsClicked(){
        self.navigationController?.pushViewController(myAppointmentsPage, animated: true)
    }
    
    func newPatientClicked(){
        self.navigationController?.pushViewController(NewPatientPage, animated: true)
    }
    
}
    



