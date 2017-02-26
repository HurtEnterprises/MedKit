//
//  HPETemplate.swift
//  Project BlackSky
//
//  Created by Deven  on 2/24/17.
//  Copyright © 2017 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class HPETemplate: UIViewController, UITableViewDelegate, UITableViewDataSource{
    let historyPresentIllness: HistoryOfPresentIllness = HistoryOfPresentIllness()
    
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
    let HPETemplateLabel: UILabel = UILabel()
    let nameItLabel:UILabel = UILabel()
    let matchingLabel:UILabel = UILabel()
    
    let boxEmpty = UIImage(named: "BlueBoxEmpty") as UIImage?
    let boxFilled = UIImage(named: "BlueBoxFilled") as UIImage?
    
    let personalLabel:UILabel = UILabel()
    let practiceWideLabel:UILabel = UILabel()
    
    let personalButton:UIButton = UIButton()
    let practiceButton:UIButton = UIButton()

    let yesLabel:UILabel = UILabel()
    let noLabel:UILabel = UILabel()
    
    let yesButton:UIButton = UIButton()
    let noButton:UIButton = UIButton()
    
    let symptomsButton:UIButton = UIButton()
    let planButton:UIButton = UIButton()
    
    let nameField:UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Makes navigaiton bar
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 20, width: width, height: height/20)
        
        let backArrowButton =  UIButton(type: .custom)
        backArrowButton.setImage(UIImage(named: "BackArrowTeal"), for: UIControlState())
        backArrowButton.addTarget(self, action: #selector(MainMenu.backClicked(_:)), for: .touchUpInside)
        backArrowButton.frame = CGRect(x: 0, y: 0, width: width/25, height: height/12)
        
        
        let backWord: UIButton = UIButton()
        creationFunctions.makeButton(backWord, name: "Back", titleColor: tealColor, location: CGRect(x: width/25, y: height/35, width: width/10, height: 34), page: self)
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 30)
        backWord.titleLabel?.text = "Back"
        backWord.titleLabel?.textAlignment = .center
        backWord.titleLabel?.textColor = UIColor.blue
        backWord.backgroundColor = UIColor.clear
        backWord.addTarget(self, action: #selector(AssessmentAndPlan.backClicked(_:)), for: .touchUpInside)
        backArrowButton.addSubview(backWord)
        let barButton = UIBarButtonItem(customView: backArrowButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        let rightButton =  UIBarButtonItem(title: "\(doctorName) | My Account", style:   UIBarButtonItemStyle.plain, target: self, action: #selector(MainMenu.myAccoutClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
        rightButton.tintColor = tealColor
        
        
        creationFunctions.makeLabel(HPETemplateLabel, name: "NEW HPI TEMPLATE", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 4.2 * width/20,y: 1*height/20, width: 0.75 * width, height: height/15), page: self)
        HPETemplateLabel.font = UIFont(name: (HPETemplateLabel.font.fontName), size: 55)
        
        creationFunctions.makeLabel(nameItLabel, name: "WHAT WOULD YOU LIKE TO NAME IT", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 4.2 * width/20,y: 1*height/20, width: 0.75 * width, height: height/15), page: self)
        nameItLabel.font = UIFont(name: (nameItLabel.font.fontName), size: 35)
        
        creationFunctions.makeLabel(matchingLabel, name: "WOULD YOU LIKE TO CREATE A \nMATCHING PLAN NOW", textColor: tealColor, alignment: NSTextAlignment.left, frame: CGRect(x: 4.2 * width/20,y: 1*height/20, width: 0.75 * width, height: height/15), page: self)
        matchingLabel.font = UIFont(name: (matchingLabel.font.fontName), size: 35)
        
        creationFunctions.makeTextField(nameField, backgroundColor: UIColor.lightGray, frame: CGRect(x: width/4, y: height/5.0, width: width/2, height: 30), page:self)
        nameField.font = nameField.font!.withSize(30)
        nameField.layer.backgroundColor = UIColor.clear.cgColor
        nameField.layer.borderColor = UIColor.clear.cgColor
        nameField.layer.borderWidth = 2.0
        let nameBorder = CALayer()
        nameBorder.borderColor = UIColor.white.cgColor
        nameBorder.frame = CGRect(x: 0, y: nameField.frame.size.height - nameField.layer.borderWidth, width:  nameField.frame.size.width, height: nameField.frame.size.height)
        nameBorder.borderWidth = width
        nameField.layer.addSublayer(nameBorder)
        nameField.layer.masksToBounds = true
        
    }
    


func backClicked(_ sender: UIBarButtonItem!){
    print("Back Clicked")
    self.navigationController?.popViewController(animated: true)
}

}
