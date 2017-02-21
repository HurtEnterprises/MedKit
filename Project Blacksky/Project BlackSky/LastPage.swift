//
//  LastPage.swift
//  Project BlackSky
//
//  Created by Tim Bryant on 1/24/17.
//  Copyright © 2017 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit
import DropDown


class LastPage: UIViewController {
    
    let PlandropDown = DropDown()
    let RxdropDown = DropDown()
    let NotesSummarydropDown = DropDown()
    let mainMenu: MainMenu = MainMenu()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white

        let tealColor = UIColor(hue: 0.5583, saturation: 1, brightness: 0.74, alpha: 1.0)
        let grayColor = UIColor(hue: 0.8083, saturation: 0, brightness: 0.96, alpha: 1.0)
        var doctorName = "Doctor Name"
        
        let Historybutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Historybutton.setImage(UIImage(named: "HistoryOfIllness"), for: UIControlState.normal)
        //add function for button
        Historybutton.addTarget(self, action: "HistorybuttonClicked", for: UIControlEvents.touchUpInside)
        //set frame
        Historybutton.frame = CGRect(x: width/20,y: 0.22 * height, width: width * 9/10, height: height/7)
        self.view.addSubview(Historybutton)
        
        let Assessmentbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Assessmentbutton.setImage(UIImage(named: "Assessment"), for: UIControlState.normal)
        //add function for button
        Assessmentbutton.addTarget(self, action: "AssessmentbuttonClicked:", for: UIControlEvents.touchUpInside)
        //set frame
        Assessmentbutton.frame = CGRect(x: width/20,y: 0.4 * height, width: width * 9/10, height: height/7)
        self.view.addSubview(Assessmentbutton)
        
        let Planbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Planbutton.setImage(UIImage(named: "Plan"), for: UIControlState.normal)
        //add function for button
        Planbutton.addTarget(self, action: "PlanbuttonClicked:", for: UIControlEvents.touchUpInside)
        //set frame
        Planbutton.frame = CGRect(x: width/20, y: 0.56 * height, width: width * 9/10, height: height/10)
        self.view.addSubview(Planbutton)
        
        let Rxbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Rxbutton.setImage(UIImage(named: "Rx"), for: UIControlState.normal)
        //add function for button
        Rxbutton.addTarget(self, action: "RxbuttonClicked:", for: UIControlEvents.touchUpInside)
        //set frame
        Rxbutton.frame = CGRect(x: width/20, y: 0.63 * height, width: width * 9/10, height: height/10)
        self.view.addSubview(Rxbutton)

        let Notessummarybutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Notessummarybutton.setImage(UIImage(named: "NotesSummary"), for: UIControlState.normal)
        //add function for button
        Notessummarybutton.addTarget(self, action: "NotesSummarybuttonClicked:", for: UIControlEvents.touchUpInside)
        //set frame
        Notessummarybutton.frame = CGRect(x: width/20,y: 0.7 * height, width: width * 9/10, height: height/10)
        self.view.addSubview(Notessummarybutton)
        
        let Concludebutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Concludebutton.setImage(UIImage(named: "ConcludeVisit"), for: UIControlState.normal)
        //add function for button
        Concludebutton.addTarget(self, action: "ConcludebuttonClicked", for: UIControlEvents.touchUpInside)
        //set frame
        Concludebutton.frame = CGRect(x: width/20,y: 0.85 * height, width: width * 9/10, height: height/10)
        self.view.addSubview(Concludebutton)
        
        let backArrowButton =  UIButton(type: .custom)
        backArrowButton.setImage(UIImage(named: "BackArrowTeal"), for: UIControlState())
        backArrowButton.addTarget(self, action: #selector(LastPage.backClicked(_:)), for: .touchUpInside)
        backArrowButton.frame = CGRect(x: 0, y: 0, width: width/25, height: height/12)
        
        let backWord: UIButton = UIButton()
        creationFunctions.makeButton(backWord, name: "Back", titleColor: tealColor, location: CGRect(x: width/25, y: height/35, width: width/10, height: 30), page: self)
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 34)
        backWord.titleLabel?.text = "Back"
        backWord.titleLabel?.textAlignment = .center
        backWord.titleLabel?.textColor = UIColor.blue
        backWord.backgroundColor = UIColor.clear
        backWord.addTarget(self, action: #selector(ForgotPasswordPage.backClicked(_:)), for: .touchUpInside)
        backArrowButton.addSubview(backWord)
        let barButton = UIBarButtonItem(customView: backArrowButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        
        let rightButton =  UIBarButtonItem(title: "\(doctorName) | My Account", style:   UIBarButtonItemStyle.plain, target: self, action: #selector(MainMenu.myAccoutClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
        rightButton.tintColor = tealColor
        
        DropDown.appearance().textColor = tealColor
        DropDown.appearance().backgroundColor = grayColor
        
        //    The view to which the drop down will appear on
        PlandropDown.anchorView = Planbutton // UIView or UIBarButtonItem
        RxdropDown.anchorView = Rxbutton
        NotesSummarydropDown.anchorView = Notessummarybutton
        //         The list of items to display. Can be changed dynamically
        PlandropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        RxdropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        NotesSummarydropDown.dataSource = ["Car", "Motorcycle", "Truck"]
        
        PlandropDown.bottomOffset = CGPoint(x: 0, y:(PlandropDown.anchorView?.plainView.bounds.height)!)
        RxdropDown.bottomOffset = CGPoint(x: 0, y:(RxdropDown.anchorView?.plainView.bounds.height)!)
        NotesSummarydropDown.bottomOffset = CGPoint(x: 0, y:(NotesSummarydropDown.anchorView?.plainView.bounds.height)!)
     
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Called when the user click on the view (outside the UITextField). Resigns first responder (closes keyboard)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func backClicked(_ sender: UIButton!){
        self.navigationController?.popViewController(animated: true)
    }

    
    func myAccoutClicked(_ sender: UIBarButtonItem!){
        print("My Account")
    }
    
    func PlanbuttonClicked(_ sender:UIButton!){
        PlandropDown.show()
        print("Plans Clicked")
    }
    
    func RxbuttonClicked(_ sender:UIButton!){
        RxdropDown.show()
        print("Rx Clicked")
    }
    
    func NotesSummarybuttonClicked(_ sender:UIButton!){
        NotesSummarydropDown.show()
        print("Notes Clicked")
    }

    func ConcludebuttonClicked(_ sender:UIButton!){
        print("Conclude Clicked")
        self.navigationController?.popToViewController(loginPage, animated: true)
    }
    
}
