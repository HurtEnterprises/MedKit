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
        NSFontAttributeName : UIFont.boldSystemFont(ofSize: 50.0),
        NSForegroundColorAttributeName : UIColor.white,
        NSUnderlineStyleAttributeName : 1] as [String : Any]
    
    var infoMessageAttributes = [
        NSFontAttributeName : UIFont.systemFont(ofSize: 40.0),
        NSForegroundColorAttributeName : UIColor.white]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creationFunctions.setBackgroundColor("MainBackground", page: self)
        
        //TODO: Pull from class info
        var doctorName = "Doctor Name"
        
        //TODO: Pull from call
        var patientName = NSMutableAttributedString(string:"PATIENT NAME", attributes: underlineAttributes)
        
        // Adds navigation bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 10, width: width, height: height/20)
        
        let backArrowButton =  UIButton(type: .custom)
        backArrowButton.setImage(UIImage(named: "BackArrow"), for: UIControlState())
        backArrowButton.addTarget(self, action: #selector(MainMenu.backClicked(_:)), for: .touchUpInside)
        backArrowButton.frame = CGRect(x: 0, y: 0, width: width/25, height: height/12)
        
        
        let backWord: UIButton = UIButton()
        creationFunctions.makeButton(backWord, name: "Back", titleColor: UIColor.white, location: CGRect(x: width/25, y: height/35, width: width/10, height: 34), page: self)
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 34)
        backWord.titleLabel?.text = "Back"
        backWord.titleLabel?.textAlignment = .center
        backWord.titleLabel?.textColor = UIColor.white
        backWord.backgroundColor = UIColor.clear
        backWord.addTarget(self, action: #selector(MainMenu.backClicked(_:)), for: .touchUpInside)
        backArrowButton.addSubview(backWord)
        let barButton = UIBarButtonItem(customView: backArrowButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        let rightButton =  UIBarButtonItem(title: "\(doctorName) | My Account", style:   UIBarButtonItemStyle.plain, target: self, action: #selector(MainMenu.myAccoutClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
        
        creationFunctions.makeLabel(mainMenuLabel, name: "MAIN   MENU", textColor: UIColor.white, alignment: NSTextAlignment.center, frame: CGRect(x: width/5, y: (height)/10, width: 200, height: 50), page: self)
        mainMenuLabel.font = mainMenuLabel.font.withSize(110)
        mainMenuLabel.layer.shadowColor = UIColor.black.cgColor
        mainMenuLabel.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        mainMenuLabel.layer.shadowRadius = 3
        mainMenuLabel.layer.shadowOpacity = 0.4
        mainMenuLabel.sizeToFit()
        
        creationFunctions.makeLabel(nextPatientLabel, name: "MY  NEXT  PATIENT  IS", textColor: UIColor.white, alignment: NSTextAlignment.center, frame: CGRect(x: width/4, y: 2.1*(height)/10 , width: 200, height: 50), page: self)
        nextPatientLabel.font = nextPatientLabel.font.withSize(50)
        nextPatientLabel.sizeToFit()
        
        creationFunctions.makeClearButton(startVisitButton, name: "click for patient info", titleColor: UIColor.white, location: CGRect(x: width/10,y: (height) * 0.26, width: width * 0.8, height: 1.2 * height/10), page: self)
        var clickforinfomessage = NSMutableAttributedString(string: "\nclick for patient info", attributes: infoMessageAttributes)
        patientName.append(clickforinfomessage)
        startVisitButton.titleLabel?.numberOfLines = 2
        startVisitButton.setAttributedTitle(patientName, for: UIControlState())
        startVisitButton.titleLabel?.font = startVisitButton.titleLabel!.font.withSize(40)
        startVisitButton.layer.borderWidth = 6.0
        startVisitButton.titleLabel?.textAlignment = NSTextAlignment.center
        startVisitButton.addTarget(self, action: #selector(MainMenu.patientInfoClicked(_:)), for: .touchUpInside)
        
        
        //TODO: get time from cal
        creationFunctions.makeLabel(appointmentTime, name: "At + time", textColor: UIColor.white, alignment: NSTextAlignment.center, frame: CGRect(x: width/2, y: (height)*0.4, width: 200, height: 50), page: self)
        appointmentTime.center = CGPoint(x: width/2, y: (height)*0.4)
        appointmentTime.textAlignment = .center
        appointmentTime.font = appointmentTime.font.withSize(50.0)
        appointmentTime.sizeToFit()
        
        let scheduleText = NSMutableAttributedString(string:"TODAY'S SCHEDULE", attributes: underlineAttributes)
        creationFunctions.makeClearButton(scheduleButton, name: "My Schedule", titleColor: UIColor.white, location: CGRect(x: width/2, y: (height-50)*5/8,  width: 8 * width/10, height: height/8), page: self)
        scheduleButton.setAttributedTitle(scheduleText, for: UIControlState())
        scheduleButton.layer.borderWidth = 6.0
        scheduleButton.center = CGPoint(x: width/2, y: height * 10.5/20)
        scheduleButton.addTarget(self, action: "myAppointmentsClicked:", for: .touchUpInside)
        
        
        let myPatientsText = NSMutableAttributedString(string:"MY PATIENTS", attributes: underlineAttributes)
        creationFunctions.makeClearButton(myPatientsButton, name: "My Patients", titleColor: UIColor.white, location:  CGRect(x: width/2, y: (height-50)*5/8,  width: 8 * width/10, height: height/8), page: self)
        myPatientsButton.center = CGPoint(x: width/2, y: height * 13.25/20)
        myPatientsButton.layer.borderWidth = 6.0
        myPatientsButton.setAttributedTitle(myPatientsText, for: UIControlState())

        let chatText = NSMutableAttributedString(string:"CHAT", attributes: underlineAttributes)
        creationFunctions.makeClearButton(chatButton, name: "Chat", titleColor: UIColor.white, location: CGRect(x: width/2, y: (height-50)*3/4, width: 8 * width/10, height: height/8), page: self)
        chatButton.center = CGPoint(x: width/2, y: height * 14.5/20)
        chatButton.layer.borderWidth = 6.0
        chatButton.center = CGPoint(x: width/2, y: 8 * height/10)
        chatButton.setAttributedTitle(chatText, for: UIControlState())
        
        creationFunctions.makeClearButton(logoutButton, name: "LOG OUT", titleColor: UIColor.white, location: CGRect(x: (2/3*width)/2,  y: 17 * height/20, width: width/2, height: height/10), page: self)
        logoutButton.titleLabel?.font = UIFont(name: (logoutButton.titleLabel?.font?.fontName)!, size: 60)
        logoutButton.center = CGPoint(x: width/2, y: 18.5 * height/20)
        logoutButton.layer.borderColor = UIColor.clear.cgColor
        logoutButton.layer.shadowColor = UIColor.black.cgColor
        logoutButton.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        logoutButton.layer.shadowRadius = 3
        logoutButton.layer.shadowOpacity = 0.2
        logoutButton.addTarget(self, action: #selector(MainMenu.logoutClicked(_:)), for: .touchUpInside)
        // Gradient stuff for login button
        let logoutLayer : CAGradientLayer = CAGradientLayer()
        logoutLayer.frame.size = logoutButton.frame.size
        let color1 = UIColor(red: 190/256, green: 190/256, blue: 190/256, alpha: 1.0).cgColor as CGColor
        let color2 = UIColor(red: 255/256, green: 251/256, blue: 251/256, alpha: 0.0).cgColor as CGColor
        logoutLayer.colors = [color2, color1]
        logoutLayer.locations = [0.0, 0.7]
        logoutButton.layer.insertSublayer(logoutLayer, at: 0)
    }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    func logoutClicked(_ sender: UIButton!){
//        if(self.presentedViewController == registerPage){
//            registerPage.dismissViewControllerAnimated(true, completion: nil)
//        }
//        self.dismissViewControllerAnimated(true, completion: nil)
        logoutCurrentUser()
        self.navigationController?.popToViewController(loginPage, animated: true)
        //TODO: @Mehrab add some sort of logout function or we can make it so the user is logged out whenever they hit the login page?
    }
    
    func logoutCurrentUser(){
        currentUser = DDBLoginData() //set the user constant to a blank login data, essentially deleting the user.
    }
    
    func myAccoutClicked(_ sender: UIBarButtonItem!){
        print("My Account")
    }
    
    func patientInfoClicked(_ sender: UIButton!){
        print("Patient Info CLicked")
    }
    
    func backClicked(_ sender: UIBarButtonItem!){
            self.navigationController?.popToViewController(loginPage, animated: true)
    }
    
    func myPatientsClicked(_ sender:UIButton){
        self.navigationController?.pushViewController(myPatientsPage, animated: true)
    }
    
    func myAppointmentsClicked(){
        self.navigationController?.pushViewController(myAppointmentsPage, animated: true)
    }
    
    func newPatientClicked(){
        self.navigationController?.pushViewController(NewPatientPage, animated: true)
    }
    
}
    



