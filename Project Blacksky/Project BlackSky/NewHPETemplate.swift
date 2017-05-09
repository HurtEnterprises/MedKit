//
//  NewAAPTemplate.swift
//  Project BlackSky
//
//  Created by Tim Bryant on 2/8/17.
//  Copyright © 2017 Hurt Enterprises. All rights reserved.
//

import Foundation
import DropDown
import UIKit

class NewHPETemplate: UIViewController {
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
    
    let usernameField: UITextField = UITextField()
    let oneField: UITextField = UITextField()
    let twoField: UITextField = UITextField()
    let threeField: UITextField = UITextField()
    let fourField: UITextField = UITextField()
    let personalbutton: UIButton = UIButton()
    let yesbutton: UIButton = UIButton()
    let nobutton: UIButton = UIButton()
    let practicebutton: UIButton = UIButton()
    let onelabel: UILabel = UILabel()
    let twolabel: UILabel = UILabel()
    let newtemplatelabel: UILabel = UILabel()
    let personallabel: UILabel = UILabel()
    let practicelabel: UILabel = UILabel()
    let whatlabel: UILabel = UILabel()
    let yeslabel: UILabel = UILabel()
    let nolabel: UILabel = UILabel()
    let tealColor = UIColor(hue: 0.5583, saturation: 1, brightness: 0.74, alpha: 1.0)
    let onebutton: UIButton = UIButton()
    let twobutton: UIButton = UIButton()
    let threebutton: UIButton = UIButton()
    let fourbutton: UIButton = UIButton()
    
    
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
        
        //   creationFunctions.addImage("pastmedicalhistory", frame: CGRect(x: width/39,y: 0.450 * height, width: width * //9/10, height: height/7), center:true, alpha: 1.0, page: self)
        
        //  creationFunctions.addImage("SocialHistory", frame: CGRect(x: width/39,y: 0.600 * height, width: width * 9/10, height: height/7), center:true, alpha: 1.0, page: self)
        var underlineAttributes = [
            NSFontAttributeName : UIFont.systemFont(ofSize: 27.0),
            NSForegroundColorAttributeName : tealColor,
            NSUnderlineStyleAttributeName : 1] as [String : Any]
        
        
        creationFunctions.makeLabel(newtemplatelabel, name: "NEW HPE TEMPLATE", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 100,y: 2*height/20, width: 600, height: 50), page: self)
        newtemplatelabel.font = UIFont(name: (newtemplatelabel.font.fontName), size: 55)
        newtemplatelabel.center.x = self.view.center.x
        
        creationFunctions.makeLabel(whatlabel, name: "WHAT WOULD YOU LIKE TO NAME IT?", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 100,y: 3*height/20, width: 600, height: 50), page: self)
        whatlabel.font = UIFont(name: (whatlabel.font.fontName), size: 30)
        whatlabel.center.x = self.view.center.x
        
        // Makes Text Fields
        creationFunctions.makeTextField(usernameField, backgroundColor: UIColor.lightGray, frame: CGRect(x: 200,y: 4*height/20, width: 600, height: 50), page: self)
        usernameField.font = usernameField.font!.withSize(30)
        usernameField.text = "fdsf"
        usernameField.layer.backgroundColor = UIColor.clear.cgColor
        usernameField.layer.borderColor = UIColor.clear.cgColor
        usernameField.layer.borderWidth = 2.0
        let usernameBorder = CALayer()
        usernameBorder.borderColor = tealColor.cgColor
        usernameBorder.frame = CGRect(x: 0, y: usernameField.frame.size.height - usernameField.layer.borderWidth, width:  usernameField.frame.size.width, height: usernameField.frame.size.height)
        usernameBorder.borderWidth = width
        usernameField.layer.addSublayer(usernameBorder)
        usernameField.layer.masksToBounds = true
        
        creationFunctions.makeLabel(personallabel, name: "PERSONAL", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 300,y: 5*height/20 - 45, width: 0.75 * width, height: height/10), page: self)
        personallabel.font = UIFont(name: (personallabel.font.fontName), size: 20)
        
        personalbutton.isSelected = false
        personalbutton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        personalbutton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        personalbutton.addTarget(self, action: #selector(NewHPETemplate.personalButtonClicked), for: UIControlEvents.touchUpInside)
        personalbutton.frame = CGRect(x: 260,y: 5*height/20, width: 40, height: 50)
        self.view.addSubview(personalbutton)
        
        creationFunctions.makeLabel(practicelabel, name: "PRACTICE", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 550 + 50,y: 5*height/20 - 45, width: 0.75 * width, height: height/10), page: self)
        practicelabel.font = UIFont(name: (practicelabel.font.fontName), size: 20)
        
        practicebutton.isSelected = false
        practicebutton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        practicebutton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        practicebutton.addTarget(self, action: "practiceButtonClicked", for: UIControlEvents.touchUpInside)
        practicebutton.frame = CGRect(x: 550 + 10,y: 5*height/20, width: 40, height: 50)
        self.view.addSubview(practicebutton)
        
        /*
        creationFunctions.makeLabelWithBox(name: personalbutton, labelname: personallabel, content: "PERSONAL", location: CGRect(x: -100,y: 5*height/20, width: 0.75 * width, height: height/10), page: self, color: tealColor)
        
        creationFunctions.makeLabelWithBox(name: practicebutton, labelname: practicelabel, content: "PRACTICE WIDE", location: CGRect(x: 250,y: 5*height/20, width: 0.75 * width, height: height/10), page: self, color: tealColor)
        */
        
        let symptomsbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        symptomsbutton.setImage(UIImage(named: "symptoms"), for: UIControlState.normal)
        //add function for button
        symptomsbutton.addTarget(self, action: "symptomsbuttonClicked", for: UIControlEvents.touchUpInside)
        //set frame
        symptomsbutton.frame = CGRect(x: 100,y: 6.5*height/20, width: 600, height: 50)
        symptomsbutton.center.x = self.view.center.x
        self.view.addSubview(symptomsbutton)
        
        let planbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        planbutton.setImage(UIImage(named: "plan2"), for: UIControlState.normal)
        //add function for button
        planbutton.addTarget(self, action: "planbuttonClicked", for: UIControlEvents.touchUpInside)
        //set frame
        planbutton.frame = CGRect(x: 100,y: 11*height/20 + 170, width: 600, height: 50)
        planbutton.center.x = self.view.center.x
        self.view.addSubview(planbutton)
        
        creationFunctions.makeTextField(oneField, backgroundColor: UIColor.lightGray, frame: CGRect(x: 400,y: 8*height/20 - 50, width: 400, height: 50), page: self)
        oneField.font = usernameField.font!.withSize(30)
        oneField.text = ""
        oneField.layer.backgroundColor = UIColor.clear.cgColor
        oneField.layer.borderColor = UIColor.clear.cgColor
        oneField.layer.borderWidth = 2.0
        let oneBorder = CALayer()
        oneBorder.borderColor = tealColor.cgColor
        oneBorder.frame = CGRect(x: 0, y: usernameField.frame.size.height - usernameField.layer.borderWidth, width:  oneField.frame.size.width, height: usernameField.frame.size.height)
        oneBorder.borderWidth = width
        oneField.layer.addSublayer(oneBorder)
        oneField.layer.masksToBounds = true
        
        creationFunctions.makeTextField(twoField, backgroundColor: UIColor.lightGray, frame: CGRect(x: 400,y: 9.5*height/20 - 80, width: 400, height: 50), page: self)
        twoField.font = twoField.font!.withSize(30)
        twoField.text = ""
        twoField.layer.backgroundColor = UIColor.clear.cgColor
        twoField.layer.borderColor = UIColor.clear.cgColor
        twoField.layer.borderWidth = 2.0
        let twoBorder = CALayer()
        twoBorder.borderColor = tealColor.cgColor
        twoBorder.frame = CGRect(x: 0, y: usernameField.frame.size.height - usernameField.layer.borderWidth, width:  twoField.frame.size.width, height: usernameField.frame.size.height)
        twoBorder.borderWidth = width
        twoField.layer.addSublayer(twoBorder)
        twoField.layer.masksToBounds = true

        
        let anotherbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        anotherbutton.setImage(UIImage(named: "clicktoaddanother"), for: UIControlState.normal)
        //add function for button
        anotherbutton.addTarget(self, action: "anotherClicked", for: UIControlEvents.touchUpInside)
        //set frame
        anotherbutton.frame = CGRect(x: 100,y: 11*height/20, width: 600, height: 50)
        anotherbutton.center.x = self.view.center.x
        self.view.addSubview(anotherbutton)
        
        creationFunctions.makeLabel(onelabel, name: "WOULD YOU LIKE TO CREATE A", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 280,y: 11*height/20 + 55, width: 600, height: 50), page: self)
        onelabel.font = UIFont(name: (onelabel.font.fontName), size: 30)
       
        
        creationFunctions.makeLabel(twolabel, name: "MATCHING PLAN NOW?", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 350,y: 11*height/20 + 85, width: 600, height: 50), page: self)
        twolabel.font = UIFont(name: (twolabel.font.fontName), size: 30)
        
        creationFunctions.makeLabel(yeslabel, name: "YES", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 395,y: 11*height/20 + 78, width: 0.75 * width, height: height/10), page: self)
        yeslabel.font = UIFont(name: (yeslabel.font.fontName), size: 20)
        
        yesbutton.isSelected = false
        yesbutton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        yesbutton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        yesbutton.addTarget(self, action: #selector(NewHPETemplate.yesButtonClicked), for: UIControlEvents.touchUpInside)
        yesbutton.frame = CGRect(x: 360,y: 11*height/20 + 120, width: 40, height: 50)
        self.view.addSubview(yesbutton)
        
        creationFunctions.makeLabel(nolabel, name: "NO", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 605,y: 11*height/20 + 78, width: 0.75 * width, height: height/10), page: self)
        nolabel.font = UIFont(name: (nolabel.font.fontName), size: 20)
        
        nobutton.isSelected = false
        nobutton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        nobutton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        nobutton.addTarget(self, action: #selector(NewHPETemplate.noButtonClicked), for: UIControlEvents.touchUpInside)
        nobutton.frame = CGRect(x: 570,y: 11*height/20 + 120, width: 40, height: 50)
        self.view.addSubview(nobutton)
        
        
         creationFunctions.makeTextField(threeField, backgroundColor: UIColor.lightGray, frame: CGRect(x: 400,y: 11*height/20 + 240, width: 400, height: 50), page: self)
         threeField.font = twoField.font!.withSize(30)
         threeField.text = ""
         threeField.layer.backgroundColor = UIColor.clear.cgColor
         threeField.layer.borderColor = UIColor.clear.cgColor
         threeField.layer.borderWidth = 2.0
         let threeBorder = CALayer()
         threeBorder.borderColor = tealColor.cgColor
         threeBorder.frame = CGRect(x: 0, y: usernameField.frame.size.height - usernameField.layer.borderWidth, width:  threeField.frame.size.width, height: usernameField.frame.size.height)
         threeBorder.borderWidth = width
         threeField.layer.addSublayer(threeBorder)
         threeField.layer.masksToBounds = true
         
         creationFunctions.makeTextField(fourField, backgroundColor: UIColor.lightGray, frame: CGRect(x: 400,y: 12.5*height/20 + 220, width: 400, height: 50), page: self)
         fourField.font = twoField.font!.withSize(30)
         fourField.text = ""
         fourField.layer.backgroundColor = UIColor.clear.cgColor
         fourField.layer.borderColor = UIColor.clear.cgColor
         fourField.layer.borderWidth = 2.0
         let fourBorder = CALayer()
         fourBorder.borderColor = tealColor.cgColor
         fourBorder.frame = CGRect(x: 0, y: usernameField.frame.size.height - usernameField.layer.borderWidth, width:  fourField.frame.size.width, height: usernameField.frame.size.height)
         fourBorder.borderWidth = width
         fourField.layer.addSublayer(fourBorder)
         fourField.layer.masksToBounds = true
        
        let another2button: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        another2button.setImage(UIImage(named: "clicktoaddanother"), for: UIControlState.normal)
        //add function for button
        another2button.addTarget(self, action: "another2buttonClicked", for: UIControlEvents.touchUpInside)
        //set frame
        another2button.frame = CGRect(x: 100,y: 12.5*height/20 + 390, width: 600, height: 50)
        another2button.center.x = self.view.center.x
        self.view.addSubview(another2button)
        
        onebutton.isSelected = false
        onebutton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        onebutton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        onebutton.addTarget(self, action: #selector(NewHPETemplate.oneButtonClicked), for: UIControlEvents.touchUpInside)
        onebutton.frame = CGRect(x: 360,y: 8*height/20 - 50, width: 40, height: 50)
        self.view.addSubview(onebutton)
        
        twobutton.isSelected = false
        twobutton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        twobutton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        twobutton.addTarget(self, action: #selector(NewHPETemplate.twoButtonClicked), for: UIControlEvents.touchUpInside)
        twobutton.frame = CGRect(x: 360,y: 9.5*height/20 - 80, width: 40, height: 50)
        self.view.addSubview(twobutton)
        
        threebutton.isSelected = false
        threebutton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        threebutton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        threebutton.addTarget(self, action: #selector(NewHPETemplate.threeButtonClicked), for: UIControlEvents.touchUpInside)
        threebutton.frame = CGRect(x: 360, y: 11*height/20 + 240, width: 40, height: 50)
        self.view.addSubview(threebutton)
        
        fourbutton.isSelected = false
        fourbutton.setImage(UIImage(named: "BlueBoxFilled"), for: .selected)
        fourbutton.setImage(UIImage(named: "BlueBoxEmpty"), for: .normal)
        fourbutton.addTarget(self, action: #selector(NewHPETemplate.fourButtonClicked), for: UIControlEvents.touchUpInside)
        fourbutton.frame = CGRect(x: 360, y: 12.5*height/20 + 220, width: 40, height: 50)
        self.view.addSubview(fourbutton)
 
 
        
        func makeLabel(_ label: UILabel, name: String, textColor:UIColor, alignment: NSTextAlignment, frame: CGRect, page: UIViewController){
            label.frame = frame
            label.textColor = textColor
            label.textAlignment = alignment
            label.text = name
            page.view.addSubview(label)
        }
        
        
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
    
    //   func personalbuttonuncheckedClicked(_ sender: UIBarButtonItem!){
    //     print("personalbuttonunchecked clicked")
    //   personalbuttonunchecked.hide()
    //   personalbuttonchecked.show()
    //    self.navigationController?.popViewController(animated: true)
    // }
    
    //  func personalbuttoncheckedClicked(_ sender: UIBarButtonItem!){
    //    print("personalbuttonchecked clicked")
    //  personalbuttonchecked.hide()
    //personalbuttonuncheckedchecked.show()
    //self.navigationController?.popViewController(animated: true)
    // }
    
    func practiceButtonClicked(){
        practicebutton.isSelected = !practicebutton.isSelected
        
    }
    
    func personalButtonClicked(){
        personalbutton.isSelected = !personalbutton.isSelected
        
    }
    
    func startnewvisitbuttonClicked(){
        print("New Visit Started")
        self.navigationController?.pushViewController(historyOfPresentIllness, animated: true)
        
    }
    func planbuttonClicked(){
        print("New Visit Started")
        self.navigationController?.pushViewController(historyOfPresentIllness, animated: true)
        
    }
    func anotherbuttonClicked(){
        print("New Visit Started")
        self.navigationController?.pushViewController(historyOfPresentIllness, animated: true)
        
    }

    func another2buttonClicked(){
        print("Another2clicked")
 
        
    }
    
    func yesButtonClicked(){
        print("New Visit Started")
        yesbutton.isSelected = !yesbutton.isSelected
        
    }
    
    func noButtonClicked(){
        print("New Visit Started")
        nobutton.isSelected = !nobutton.isSelected
        
    }
    
    func oneButtonClicked(){
        print("New Visit Started")
        onebutton.isSelected = !onebutton.isSelected
        
    }
    
    func twoButtonClicked(){
        print("New Visit Started")
        twobutton.isSelected = !twobutton.isSelected
        
    }
    
    func threeButtonClicked(){
        print("New Visit Started")
        threebutton.isSelected = !threebutton.isSelected
        
    }
    
    func fourButtonClicked(){
        print("New Visit Started")
        fourbutton.isSelected = !fourbutton.isSelected
        
    }
    
    func symptomsbuttonClicked(){
        print("symptoms button clicked")
        
    }
    
}
