//
//  PhysicalExam.swift
//  Project BlackSky
//
//  Created by Deven  on 11/28/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit


class PhysicalExam: UIViewController {
    let loginPage:LoginPage = LoginPage()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    
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
    
    //TODO: Pull from class info
    var doctorName = "Doctor Name"
    
    let tealColor = UIColor(hue: 0.5583, saturation: 1, brightness: 0.74, alpha: 1.0)
    
    // Initializes labels and buttons
    let titleLabel: UILabel = UILabel()
    
    let chestImage = UIImage(named:"Chest") as UIImage?
    let chestButton   = UIButton(type: UIButtonType.custom)
    
    let headImage = UIImage(named: "Head") as UIImage?
    let headButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let leftArmImage = UIImage(named: "LeftArm") as UIImage?
    let leftArmButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let leftLegImage = UIImage(named: "LeftLeg") as UIImage?
    let leftLegButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let PelvisImage = UIImage(named: "Pelvis") as UIImage?
    let PelvisButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let rightArmImage = UIImage(named: "RightArm") as UIImage?
    let rightArmButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let rightLegImage = UIImage(named: "RightLeg") as UIImage?
    let rightLegButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let torsoImage = UIImage(named: "Torso") as UIImage?
    let torsoButton   = UIButton(type: UIButtonType.custom) as UIButton
    
    let internalLabel:UILabel = UILabel()
    let externalLabel:UILabel = UILabel()
    
    let internalButton:UIButton = UIButton()
    let externalButton:UIButton = UIButton()
    
    let internalImage = UIImage(named: "BlueBoxEmpty") as UIImage?
    let externalImage = UIImage(named: "BlueBoxFilled") as UIImage?


    
    var underlineAttributes = [
        NSFontAttributeName : UIFont.systemFont(ofSize: 27.0),
        NSForegroundColorAttributeName : UIColor.white,
        NSUnderlineStyleAttributeName : 1] as [String : Any]

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
        backWord.titleLabel?.font = UIFont(name: "Arial-BoldMT", size: 34)
        backWord.titleLabel?.text = "Back"
        backWord.titleLabel?.textAlignment = .center
        backWord.titleLabel?.textColor = UIColor.blue
        backWord.backgroundColor = UIColor.clear
        backWord.addTarget(self, action: #selector(MainMenu.backClicked(_:)), for: .touchUpInside)
        backArrowButton.addSubview(backWord)
        let barButton = UIBarButtonItem(customView: backArrowButton)
        self.navigationItem.leftBarButtonItem = barButton
        
        let rightButton =  UIBarButtonItem(title: "\(doctorName) | My Account", style:   UIBarButtonItemStyle.plain, target: self, action: #selector(MainMenu.myAccoutClicked(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
        rightButton.tintColor = tealColor
        
        // Makes top title text
        
        let bigBlueAttributes = [NSForegroundColorAttributeName: tealColor, NSFontAttributeName: UIFont.systemFont(ofSize: 60)]
        
        let smallBlueAttributes = [NSForegroundColorAttributeName: tealColor, NSFontAttributeName: UIFont.systemFont(ofSize: 40)]
        
        let smallGreyAttributes = [NSForegroundColorAttributeName: UIColor.lightGray, NSFontAttributeName: UIFont.systemFont(ofSize: 25)]
        
        let bigBlueText = NSMutableAttributedString(string: "PHYSICAL EXAMINATION\n", attributes: bigBlueAttributes)
        let smallBlueText = NSMutableAttributedString(string: "PLEASE FILL IN THE REGIONS ACCORDING\nTO EACH STEP OF YOUR PHYSICAL EXAM\n", attributes: smallBlueAttributes)
        let smallGreyText = NSMutableAttributedString(string: "to mark normal (blue): single tap the region\nto mark abnormal (red): double tap the region\nto add notes: single tap & hold the region", attributes: smallGreyAttributes)
        
        let fullTitleString = NSMutableAttributedString()
        
        fullTitleString.append(bigBlueText)
        fullTitleString.append(smallBlueText)
        fullTitleString.append(smallGreyText)
        
        print(fullTitleString)
        
        titleLabel.frame = CGRect(x: 0, y: height/20 + 25, width: width, height: height/20)
        titleLabel.textColor = tealColor
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = fullTitleString
        titleLabel.sizeToFit()
        titleLabel.textAlignment = NSTextAlignment.center
        titleLabel.center.x = self.view.center.x
        self.view.addSubview(titleLabel)
        
//        chestButton.setBackgroundImage(chestImage, for: .normal)
//        chestButton.frame = CGRect(x:self.view.center.x,y:self.view.center.y,width:200,height:200)
//        chestButton.imageView?.contentMode = .scaleAspectFill
//        chestButton.layer.borderWidth = 1.0
//        chestButton.center.x = self.view.center.x
//        chestButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
//        self.view.addSubview(chestButton)
//        
//        headButton.setBackgroundImage(UIImage(named: "Head"), for: UIControlState.normal)
//        headButton.frame = CGRect(x:self.view.center.x,y:self.view.center.y - 200,width: width * 0.5,height: height * 0.3)
//        headButton.center.x = self.view.center.x
//        headButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
//        self.view.addSubview(headButton)
//        
//        leftArmButton.frame = CGRect(x:self.view.center.x,y:self.view.center.y,width:200,height:200)
//        leftArmButton.setBackgroundImage(leftArmImage, for: .normal)
//        leftArmButton.imageView?.frame = leftArmButton.frame
//        leftArmButton.layer.borderWidth = 1.0
//        leftArmButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
//        self.view.addSubview(leftArmButton)
        
        let Nextbutton: UIButton = UIButton(type: UIButtonType.custom)
        //set image for button
        Nextbutton.setImage(UIImage(named: "Next"), for: UIControlState.normal)
        //add function for button
        //set frame
        Nextbutton.frame = CGRect(x: width/2.3,y: 0.880 * height, width: width * 0.25, height: height/10)
        self.view.addSubview(Nextbutton)
        Nextbutton.addTarget(self, action: Selector("skipClicked:"), for: UIControlEvents.touchUpInside)
        
        creationFunctions.makeLabel(internalLabel, name: "INTERNAL", textColor: tealColor, alignment: NSTextAlignment.center, frame: CGRect(x:self.view.center.x/4,y:self.view.center.y/3-50,width:500,height:500), page: self)
        
        creationFunctions.makeLabel(externalLabel, name: "SKIN", textColor: tealColor, alignment: NSTextAlignment.center, frame: CGRect(x:self.view.center.x/4,y:self.view.center.y/3,width:500,height:500), page: self)
        
        let imageView = UIImageView(image: leftArmImage!)
        imageView.frame = CGRect(x:self.view.center.x,y:self.view.center.y,width:300,height:300)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
//        internalButton.frame = CGRect(x:self.view.center.x + 200,y:self.view.center.y,width:500,height:500)
//        internalButton.setImage(internalImage, for: .normal)
//        internalButton.imageView?.frame = leftArmButton.frame
//        internalButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
//        internalButton.tintColor = UIColor.blue
//        internalButton.imageView?.tintColor = UIColor.blue
//        self.view.addSubview(internalButton)
//        
//        externalButton.frame = CGRect(x:self.view.center.x + 200,y:self.view.center.y,width:500,height:500)
//        externalButton.setImage(externalImage, for: .normal)
//        externalButton.imageView?.frame = leftArmButton.frame
//        externalButton.addTarget(self, action: #selector(PhysicalExam.bodyPartSingleTapped(_:)), for:.touchUpInside)
//        externalButton.tintColor = UIColor.blue
//        externalButton.imageView?.tintColor = UIColor.blue
//        self.view.addSubview(externalButton)

        self.configureView()
    }
    
    func backClicked(_ sender: UIBarButtonItem!){
        print("Back Clicked")
        self.navigationController?.popViewController(animated: true)
    }
    
    func bodyPartSingleTapped(_ sender: UIButton){
        print(sender)
        if let image = sender.imageView?.image?.withRenderingMode(.alwaysTemplate) {
            sender.setImage(image, for: .normal)
            sender.tintColor = UIColor.red
        }
    }
    
    func switchInternalExternal(_ sender: UIButton){
        print(sender)
    }

}
