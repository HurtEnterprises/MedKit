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

class PatientInfoPage: UIViewController {
    let loginPage:LoginPage = LoginPage()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    let historyOfPresentIllness:HistoryOfPresentIllness = HistoryOfPresentIllness()
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    
    func configureView() {
        self.view.backgroundColor = UIColor.white
    }
    
    // Initializes text fields & labels
    let emailField: UITextField = UITextField()
    let emailLabel: UILabel = UILabel()
    
    let table: UITableView = UITableView()
    
    let physicianIDField: UITextField = UITextField()
    let physicianIDLabel: UILabel = UILabel()
    let Alertbutton: UIButton = UIButton(type: UIButtonType.custom)
    
    let label: UILabel = UILabel()
    let test: UIButton = UIButton(type: UIButtonType.custom)
    let initialPatientInfoLabel: UILabel = UILabel()
    let firstAlert: UILabel = UILabel()
    let secondAlert: UILabel = UILabel()
    let nameLabel: UILabel = UILabel()
    let DOBLabel: UILabel = UILabel()
    let lastVisitLabel: UILabel = UILabel()
    let reasonForVisitLabel: UILabel = UILabel()
    let dropDown = DropDown()
    let allergiesdropDown = DropDown()
    let tealColor = UIColor(hue: 0.5583, saturation: 1, brightness: 0.74, alpha: 1.0)
    let backgroundDimmer = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    
    //TODO: Pull from class info
    var doctorName = "Doctor Name"
    
    let currentMedicationsButton: UIButton = UIButton()
    
    var underlineAttributes = [
        NSFontAttributeName : UIFont.systemFont(ofSize: 27.0),
        NSForegroundColorAttributeName : UIColor.white,
        NSUnderlineStyleAttributeName : 1] as [String : Any]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Adds logo in top right
        let imageName = "MedKitLogoWhite.png"
        creationFunctions.addImage(imageName, frame: CGRect(x: 8.5 * width/10, y: 5, width: width/8, height: height/8), center:false, alpha: 0.5, page: self)
        
        // Makes navigaiton bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 10, width: width, height: height/20)
        
        let backArrowButton =  UIButton(type: .custom)
        backArrowButton.setImage(UIImage(named: "BackArrowTeal"), for: UIControlState())
        backArrowButton.addTarget(self, action: #selector(ForgotPasswordPage.backClicked(_:)), for: .touchUpInside)
        backArrowButton.frame = CGRect(x: 0, y: 0, width: width/25, height: height/12)
        
        
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
        
        let button: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        button.setImage(UIImage(named: "CurrentMedications"), for: UIControlState.normal)
        //add function for button
        button.addTarget(self, action: "currentmedicationsbuttonClicked", for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: width/39,y: 0.350 * height, width: width * 9/10, height: height/10)
        button.center.x = self.view.center.x
        self.view.addSubview(button)
        
        let Allergiesbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Allergiesbutton.setImage(UIImage(named: "Allergies"), for: UIControlState.normal)
        //add function for button
        Allergiesbutton.addTarget(self, action: "allergiesbuttonClicked", for: UIControlEvents.touchUpInside)
        //set frame
        Allergiesbutton.frame = CGRect(x: width/38,y: 0.750 * height, width: width * 9/10, height: height/10)
        Allergiesbutton.center.x = self.view.center.x
        self.view.addSubview(Allergiesbutton)

        let Startnewvisitbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Startnewvisitbutton.setImage(UIImage(named: "StartNewVisit"), for: UIControlState.normal)
        //add function for button
        Startnewvisitbutton.addTarget(self, action: "startnewvisitbuttonClicked", for: UIControlEvents.touchUpInside)
        //set frame
        Startnewvisitbutton.frame = CGRect(x: width/10,y: 0.880 * height, width: width * 9/10, height: height/10)
        Startnewvisitbutton.center.x = self.view.center.x
        self.view.addSubview(Startnewvisitbutton)
        
        let rightButton =  UIBarButtonItem(title: "\(doctorName) | My Account", style:   UIBarButtonItemStyle.plain, target: self, action: #selector(MainMenu.myAccoutClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
        rightButton.tintColor = tealColor
        
        creationFunctions.addImage("pastmedicalhistory", frame: CGRect(x: width/39,y: 0.450 * height, width: width * 9/10, height: height/7), center:true, alpha: 1.0, page: self)
  
        creationFunctions.addImage("SocialHistory", frame: CGRect(x: width/39,y: 0.600 * height, width: width * 9/10, height: height/7), center:true, alpha: 1.0, page: self)
        
        
        creationFunctions.makeLabel(initialPatientInfoLabel, name: "INITIAL PATIENT INFO", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 4.2 * width/20,y: 1*height/20, width: 0.75 * width, height: height/10), page: self)
        initialPatientInfoLabel.font = UIFont(name: (initialPatientInfoLabel.font.fontName), size: 55)
        initialPatientInfoLabel.center.x = self.view.center.x

        creationFunctions.makeLabel(nameLabel, name: "NAME:", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/20,y: 2.5*height/20, width: 0.75 * width, height: height/10), page: self)
        nameLabel.font = UIFont(name: (nameLabel.font.fontName), size: 40)
      
        creationFunctions.makeLabel(DOBLabel, name: "DATE OF BIRTH:", textColor:  tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/20,y: 3.5*height/20, width: 0.75 * width, height: height/10), page: self)
        DOBLabel.font = UIFont(name: (DOBLabel.font.fontName), size: 40)    
        
        creationFunctions.makeLabel(lastVisitLabel, name: "DATE OF LAST VISIT:", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/20,y: 4.5*height/20, width: 0.75 * width, height: height/10), page: self)
        lastVisitLabel.font = UIFont(name: (lastVisitLabel.font.fontName), size: 40)
        
        creationFunctions.makeLabel(reasonForVisitLabel, name: "REASON FOR VISIT:", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/20,y: 5.5*height/20, width: 0.75 * width, height: height/10), page: self)
        reasonForVisitLabel.font = UIFont(name: (reasonForVisitLabel.font.fontName), size: 40)
        
         DropDown.startListeningToKeyboard()
        
     //    The view to which the drop down will appear on
         dropDown.anchorView = button // UIView or UIBarButtonItem
         allergiesdropDown.anchorView = Allergiesbutton
//         The list of items to display. Can be changed dynamically
         dropDown.dataSource = ["Car", "Motorcycle", "Truck"]
         allergiesdropDown.dataSource = ["Car", "Motorcycle", "Truck"]
         dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
         allergiesdropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        
       // creationFunctions.addImage("Alert", frame: CGRect(x: width/2, y: height/6, width: 2*width/3, height: height/4), center:true, alpha: 1.0, page: self)
        
        
        
        func makeLabel(_ label: UILabel, name: String, textColor:UIColor, alignment: NSTextAlignment, frame: CGRect, page: UIViewController){
            label.frame = frame
            label.textColor = textColor
            label.textAlignment = alignment
            label.text = name
            page.view.addSubview(label)
        }
        
        backgroundDimmer .backgroundColor = UIColor.white
        backgroundDimmer .alpha = 0.5
        view.addSubview(backgroundDimmer)
        
        //set image for button
        Alertbutton.setImage(UIImage(named: "Alert"), for: UIControlState.normal)
        //add function for button
        Alertbutton.addTarget(self, action: "alertbuttonClicked", for: UIControlEvents.touchUpInside)
        //set frame
        Alertbutton.frame = CGRect(x: width/6, y: height/6, width: 2*width/3, height: height/4)
        self.view.addSubview(Alertbutton)
        
        creationFunctions.makeLabel(firstAlert, name: "-Mother just died", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 2*width/10,y: 7.5*height/30, width: 2*width/3, height: height/4), page: self)
        firstAlert.font = UIFont(name: (firstAlert.font.fontName), size: 40)
        
        creationFunctions.makeLabel(secondAlert, name: "-Thinks Tanjim Azad is attractive", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 2*width/10,y: 5*height/30, width: 2*width/3, height: height/4), page: self)
        secondAlert.font = UIFont(name: (secondAlert.font.fontName), size: 40)

   //     creationFunctions.makeClearButton(currentMedicationsButton, name: "Current Medications", titleColor: UIColor.blue, //location: CGRect(x: width/2, y: (height-50)*5/8,  width: 8*width/10, height: height/8), page: self)
        //scheduleButton.setAttributedTitle("mkl", for: UIControlState())
    //    currentMedicationsButton.layer.borderWidth = 6.0
      //  currentMedicationsButton.center = CGPoint(x: width/2, y: height * 10.5/20)
 //       currentMedicationsButton.addTarget(self, action: #selector(currentmedicationsbuttonClicked(_:)), for: .touchUpInside)
        
        self.configureView()
        
        //        func makeLabelWithBox(name: String, labelname: String, content: String, location: CGRect, page:UIViewController, color: UIColor) {
        
      //  creationFunctions.makeLabelWithBox(name: test, labelname: label, content: "thasdsfdsis", location: CGRect(x: (2/3*width)/2,  y: 17 * height/20, width: width/2, height: height/10), page: self, color: tealColor)

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
    
    func alertbuttonClicked(){
        Alertbutton.isHidden = true
        firstAlert.isHidden = true
        secondAlert.isHidden = true
        print("hide")
        backgroundDimmer.isHidden = true
    }

    func startnewvisitbuttonClicked(){
        print("New Visit Started")
        self.navigationController?.pushViewController(historyOfPresentIllness, animated: true)

    }
    
    func currentmedicationsbuttonClicked(){
        dropDown.show()
        print("Back Clicked")
    }
    

    
    func allergiesbuttonClicked(){
        allergiesdropDown.show()
        print("Back Clicked")
    }
}
