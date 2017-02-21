//
//  PatientInfo.swift
//  Project BlackSky
//
//  Created by Tim Bryant on 10/17/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import DropDown
import UIKit

class HistoryOfPresentIllness: UIViewController {
    let loginPage:LoginPage = LoginPage()
    let assessmentandplan:AssessmentAndPlan = AssessmentAndPlan()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    let physicalExam: PhysicalExam = PhysicalExam()
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    
    func configureView() {
        self.view.backgroundColor = UIColor.white
    }
    
    let tealColor = UIColor(hue: 0.5583, saturation: 1, brightness: 0.74, alpha: 1.0)
    
    //TODO: Pull from class info
    var doctorName = "Doctor Name"

    var underlineAttributes = [
        NSFontAttributeName : UIFont.systemFont(ofSize: 27.0),
        NSForegroundColorAttributeName : UIColor.white,
        NSUnderlineStyleAttributeName : 1] as [String : Any]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creationFunctions.setBackgroundColor("HistoryOfIllnessBackground", page: self)
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let HistoryOfPresentLabel: UILabel = UILabel()
        let IllnessLabel: UILabel = UILabel()
        // Adds logo in top right
        let imageName = "MedKitLogoWhite.png"
        creationFunctions.addImage(imageName, frame: CGRect(x: 8.5 * width/10, y: 5, width: width/8, height: height/8), center:false, alpha: 0.5, page: self)
        
        // Makes navigaiton bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 10, width: width, height: height/20)
        
        creationFunctions.makeLabel(HistoryOfPresentLabel, name: "HISTORY OF PRESENT", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 4.2 * width/20,y: 1*height/20, width: 0.75 * width, height: height/15), page: self)
        HistoryOfPresentLabel.font = UIFont(name: (HistoryOfPresentLabel.font.fontName), size: 55)
        HistoryOfPresentLabel.sizeToFit()
        HistoryOfPresentLabel.center.x = self.view.center.x
        
        creationFunctions.makeLabel(IllnessLabel, name: "ILLNESS", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 8.1 * width/20,y: 1*height/20, width: 0.75 * width, height: height/7), page: self)
        IllnessLabel.font = UIFont(name: (IllnessLabel.font.fontName), size: 55)
        
        let backArrowButton =  UIButton(type: .custom)
        backArrowButton.setImage(UIImage(named: "BackArrowTeal"), for: UIControlState())
        backArrowButton.addTarget(self, action: #selector(ForgotPasswordPage.backClicked(_:)), for: .touchUpInside)
        backArrowButton.frame = CGRect(x: 0, y: 0, width: width/25, height: height/12)
        
        let Nextbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Nextbutton.setImage(UIImage(named: "Next"), for: UIControlState.normal)
        //add function for button
        //set frame
        Nextbutton.frame = CGRect(x: width/2.3,y: 0.900 * height, width: width * 0.25, height: height/10)
        Nextbutton.addTarget(self, action: #selector(HistoryOfPresentIllness.nextClicked(_:)), for: .touchUpInside)
        self.view.addSubview(Nextbutton)
        Nextbutton.addTarget(self, action: "skipClicked:", for: UIControlEvents.touchUpInside)
        
        let Skipbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Skipbutton.setImage(UIImage(named: "SKIP"), for: UIControlState.normal)
        //add function for button
        //set frame
        Skipbutton.frame = CGRect(x: width/1.4,y: 0.900 * height, width: width * 0.25, height: height/10)
        self.view.addSubview(Skipbutton)
        Skipbutton.addTarget(self, action: "skipClicked:", for: UIControlEvents.touchUpInside)
        
        let Notesbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Notesbutton.setImage(UIImage(named: "Notes"), for: UIControlState.normal)
        //add function for button
        //set frame
        Notesbutton.frame = CGRect(x: width/2.1,y: 0.770 * height, width: width * 0.49, height: height/8)
        self.view.addSubview(Notesbutton)
        
        let CreateNewTemplatebutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        CreateNewTemplatebutton.setImage(UIImage(named: "Create New Template"), for: UIControlState.normal)
        //add function for button
        //set frame
        CreateNewTemplatebutton.frame = CGRect(x: width / 50,y: 0.900 * height, width: width * 0.4, height: height/10)
        self.view.addSubview(CreateNewTemplatebutton)
        
        
        let backWord: UIButton = UIButton()
        creationFunctions.makeButton(backWord, name: "Back", titleColor: tealColor, location: CGRect(x: width/25, y: height/35, width: width/10, height: 34), page: self)
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 30)
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
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    func backClicked(_ sender: UIBarButtonItem!){
        print("Back Clicked")
        self.navigationController?.popViewController(animated: true)
    }
    
    func nextClicked(_ sender:UIButton){
        print("Next Clicked")


    }
    
    func skipClicked(_ sender:UIButton){
        print("Skip Clicked")
        self.navigationController?.pushViewController(physicalExam, animated: true)

    }
    

}
