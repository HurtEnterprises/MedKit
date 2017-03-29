//
//  MyPatients.swift
//  Project BlackSky
//
//  Created by Deven  on 1/9/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class MyPatients: UIViewController {
    
    let tealColor = UIColor(hue: 0.5583, saturation: 1, brightness: 0.74, alpha: 1.0)
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    var doctorName = "Doctor Name"
    let MyPatientsInfoLabel: UILabel = UILabel()
    let maleLabel: UILabel = UILabel()
    let femaleLabel: UILabel = UILabel()
    let ageLabel: UILabel = UILabel()
    let childLabel: UILabel = UILabel()
    let adultLabel: UILabel = UILabel()
    let seniorLabel: UILabel = UILabel()
    let genderLabel: UILabel = UILabel()
    let otherLabel: UILabel = UILabel()
    let lastvisitLabel: UILabel = UILabel()
    let lessthanLabel: UILabel = UILabel()
    let inbetweenLabel: UILabel = UILabel()
    let greaterthanLabel: UILabel = UILabel()
    let mainmenu:MainMenu = MainMenu()
    let searchField: UITextField = UITextField()
    let filterLabel: UILabel = UILabel()
    let maleButton: UIButton = UIButton(type: UIButtonType.custom)
    let femaleButton: UIButton = UIButton(type: UIButtonType.custom)
    let otherButton: UIButton = UIButton(type: UIButtonType.custom)
    let childButton: UIButton = UIButton(type: UIButtonType.custom)
    let seniorButton: UIButton = UIButton(type: UIButtonType.custom)
    let adultButton: UIButton = UIButton(type: UIButtonType.custom)
    let lessthanButton: UIButton = UIButton(type: UIButtonType.custom)
    let inbetweenButton: UIButton = UIButton(type: UIButtonType.custom)
    let greaterthanButton: UIButton = UIButton(type: UIButtonType.custom)
    
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        self.configureView()
    
    
        let backArrowButton =  UIButton(type: .custom)
        backArrowButton.setImage(UIImage(named: "BackArrowTeal"), for: UIControlState())
        backArrowButton.frame = CGRect(x: 0, y: 0, width: width/25, height: height/12)
        
        let backWord: UIButton = UIButton()
        creationFunctions.makeButton(backWord, name: "Back", titleColor: tealColor, location: CGRect(x: width/25, y: height/35, width: width/10, height: 34), page: self)
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 30)
        backWord.titleLabel?.text = "Back"
        backWord.titleLabel?.textAlignment = .center
        backWord.titleLabel?.textColor = UIColor.blue
        backWord.backgroundColor = UIColor.clear
        backArrowButton.addSubview(backWord)
        let barButton = UIBarButtonItem(customView: backArrowButton)
        self.navigationItem.leftBarButtonItem = barButton
    
        let rightButton =  UIBarButtonItem(title: "\(doctorName) | My Account", style:   UIBarButtonItemStyle.plain, target: self, action: #selector(MainMenu.myAccoutClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
        rightButton.tintColor = tealColor
        
        creationFunctions.makeLabel(MyPatientsInfoLabel, name: "MY PATIENTS", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/8 + 200, y: (height)/10, width: 500, height: 50), page: self)
        MyPatientsInfoLabel.font = UIFont(name: (MyPatientsInfoLabel.font.fontName), size: 55)
        
        let infoBox = UIView(frame: CGRect(x: width/10, y: height/4, width: width * 8/10, height: height/1.5))
        infoBox.backgroundColor = UIColor.clear
        infoBox.layer.borderWidth = 5
        infoBox.layer.borderColor = tealColor.cgColor
        infoBox.layer.cornerRadius = 8.0
        infoBox.clipsToBounds = true
        view.addSubview(infoBox)
        
        creationFunctions.makeTextField(searchField,backgroundColor: UIColor.lightGray, frame: CGRect(x: width/4, y: height/3.7, width: width/2, height: 30), page:self)
        searchField.font = searchField.font!.withSize(30)
        searchField.text = "Testing123!"
        searchField.isSecureTextEntry = true
        creationFunctions.disableAutocorrect(searchField)
        searchField.layer.backgroundColor = UIColor.clear.cgColor
        searchField.layer.borderColor = UIColor.clear.cgColor
        searchField.layer.borderWidth = 2.0
        let searchBorder = CALayer()
        searchBorder.borderColor = tealColor.cgColor
        searchBorder.frame = CGRect(x: 0, y: searchField.frame.size.height - searchField.layer.borderWidth, width:  searchField.frame.size.width, height: searchField.frame.size.height)
        searchBorder.borderWidth = width
        searchField.layer.addSublayer(searchBorder)
        searchField.layer.masksToBounds = true
        
        creationFunctions.makeLabel(filterLabel, name: "FILTERS", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/6, y: height/3.8, width: 0.75 * width, height: height/10), page: self)
        filterLabel.font = UIFont(name: (filterLabel.font.fontName), size: 25)
        
        creationFunctions.makeLabel(genderLabel, name: "GENDER", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/5.5, y: height/3.4, width: 0.75 * width, height: height/10), page: self)
        genderLabel.font = UIFont(name: (genderLabel.font.fontName), size: 30)
        
        
        creationFunctions.makeLabel(maleLabel, name: "MALE", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/6 + 40, y: height/3.0 + 12, width: 75, height: 75), page: self)
        maleLabel.font = UIFont(name: (maleLabel.font.fontName), size: 20)
        
        maleButton.isSelected = false
        maleButton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        maleButton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        maleButton.addTarget(self, action: #selector(MyPatients.maleButtonClicked), for: UIControlEvents.touchUpInside)
        maleButton.frame = CGRect(x: width/6, y: height/3.0 + 24, width: 40, height: 50)
        self.view.addSubview(maleButton)
        
        creationFunctions.makeLabel(femaleLabel, name: "FEMALE", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/6 + 40, y: height/2.8 + 15, width: 100, height: 75), page: self)
        femaleLabel.font = UIFont(name: (femaleLabel.font.fontName), size: 20)
        
        femaleButton.isSelected = false
        femaleButton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        femaleButton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        femaleButton.addTarget(self, action: "femaleButtonClicked", for: UIControlEvents.touchUpInside)
        femaleButton.frame = CGRect(x: width/6, y: height/2.8 + 27, width: 40, height: 50)
        self.view.addSubview(femaleButton)
        
        creationFunctions.makeLabel(otherLabel, name: "OTHER", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/6 + 40, y: height/2.6 + 12, width: 100, height: 75), page: self)
        otherLabel.font = UIFont(name: (otherLabel.font.fontName), size: 20)
        
        otherButton.isSelected = false
        otherButton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        otherButton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        otherButton.addTarget(self, action: "otherButtonClicked", for: UIControlEvents.touchUpInside)
        otherButton.frame = CGRect(x: width/6, y: height/2.6 + 24, width: 40, height: 50)
        self.view.addSubview(otherButton)
        
        creationFunctions.makeLabel(ageLabel, name: "AGE", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/5.5 + 245, y: height/3.4, width: 0.75 * width, height: height/10), page: self)
        ageLabel.font = UIFont(name: (ageLabel.font.fontName), size: 30)
        
        creationFunctions.makeLabel(childLabel, name: "CHILD", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/2.5 + 40, y: height/3.0 + 12, width: 75, height: 75), page: self)
        childLabel.font = UIFont(name: (childLabel.font.fontName), size: 20)
        
        childButton.isSelected = false
        childButton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        childButton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        childButton.addTarget(self, action: "childButtonClicked", for: UIControlEvents.touchUpInside)
        childButton.frame = CGRect(x: width/2.5 - 2, y: height/3.0 + 23, width: 40, height: 50)
        self.view.addSubview(childButton)
        
        creationFunctions.makeLabel(adultLabel, name: "ADULT", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/2.5 + 40, y: height/2.8 + 15, width: 100, height: 75), page: self)
        adultLabel.font = UIFont(name: (adultLabel.font.fontName), size: 20)
        
        adultButton.isSelected = false
        adultButton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        adultButton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        adultButton.addTarget(self, action: "adultButtonClicked", for: UIControlEvents.touchUpInside)
        adultButton.frame = CGRect(x: width/2.5 - 2, y: height/2.8 + 26, width: 40, height: 50)
        self.view.addSubview(adultButton)
        
        creationFunctions.makeLabel(seniorLabel, name: "SENIOR", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/2.5 + 42, y: height/2.6 + 15, width: 100, height: 75), page: self)
        seniorLabel.font = UIFont(name: (seniorLabel.font.fontName), size: 20)
        
        seniorButton.isSelected = false
        seniorButton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        seniorButton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        seniorButton.addTarget(self, action: "seniorButtonClicked", for: UIControlEvents.touchUpInside)
        seniorButton.frame = CGRect(x: width/2.5 - 2, y: height/2.6 + 25, width: 40, height: 50)
        self.view.addSubview(seniorButton)
 
        creationFunctions.makeLabel(lastvisitLabel, name: "LAST VISIT", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/2.7 + 245, y: height/3.4, width: 0.75 * width, height: height/10), page: self)
        lastvisitLabel.font = UIFont(name: (lastvisitLabel.font.fontName), size: 30)
        
        creationFunctions.makeLabel(lessthanLabel, name: "<1 MONTH", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/1.7 + 40, y: height/3.0 + 12, width: 200, height: 75), page: self)
        lessthanLabel.font = UIFont(name: (lessthanLabel.font.fontName), size: 20)
        
        lessthanButton.isSelected = false
        lessthanButton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        lessthanButton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        lessthanButton.addTarget(self, action: "lessthanButtonClicked", for: UIControlEvents.touchUpInside)
        lessthanButton.frame = CGRect(x: width/1.7 - 10 + 9, y: height/3.0 + 24, width: 40, height: 50)
        self.view.addSubview(lessthanButton)
        
        creationFunctions.makeLabel(inbetweenLabel, name: "1 MONTH - 6 MONTHS", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/1.7 + 42, y: height/2.8 + 15, width: 250, height: 75), page: self)
        inbetweenLabel.font = UIFont(name: (inbetweenLabel.font.fontName), size: 20)
        
        inbetweenButton.isSelected = false
        inbetweenButton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        inbetweenButton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        inbetweenButton.addTarget(self, action: "inbetweenButtonClicked", for: UIControlEvents.touchUpInside)
        inbetweenButton.frame = CGRect(x: width/1.7 - 1, y: height/2.8 + 27, width: 40, height: 50)
        self.view.addSubview(inbetweenButton)
        
        creationFunctions.makeLabel(greaterthanLabel, name: "> 6 MONTHS", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: width/1.7 + 40, y: height/2.6 + 15, width: 200, height: 75), page: self)
        greaterthanLabel.font = UIFont(name: (greaterthanLabel.font.fontName), size: 20)
        
        greaterthanButton.isSelected = false
        greaterthanButton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        greaterthanButton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        greaterthanButton.addTarget(self, action: "greaterthanButtonClicked", for: UIControlEvents.touchUpInside)
        greaterthanButton.frame = CGRect(x: width/1.7 - 1, y: height/2.6 + 26, width: 40, height: 50)
        self.view.addSubview(greaterthanButton)
        
        

        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func maleButtonClicked(){
        print("male")
        maleButton.isSelected = !maleButton.isSelected
        
    }
    
    // Called when the user click on the view (outside the UITextField). Resigns first responder (closes keyboard)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func backClicked(){
        print("Back")
        self.navigationController?.pushViewController(mainmenu, animated: true)
        
    }
        
    func femaleButtonClicked(){
        femaleButton.isSelected = !femaleButton.isSelected
        
    }
    
    func otherButtonClicked(){
        otherButton.isSelected = !otherButton.isSelected
        
    }
    func childButtonClicked(){
        childButton.isSelected = !childButton.isSelected
        
    }
    
    func adultButtonClicked(){
        adultButton.isSelected = !adultButton.isSelected
        
    }
    
    func seniorButtonClicked(){
       seniorButton.isSelected = !seniorButton.isSelected
        
    }
    func lessthanButtonClicked(){
        lessthanButton.isSelected = !lessthanButton.isSelected
        
    }
    func inbetweenButtonClicked(){
        inbetweenButton.isSelected = !inbetweenButton.isSelected
        
    }
    func greaterthanButtonClicked(){
        greaterthanButton.isSelected = !greaterthanButton.isSelected
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

