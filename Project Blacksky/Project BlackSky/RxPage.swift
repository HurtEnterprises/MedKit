//
//  RxPage.swift
//  Project BlackSky
//
//  Created by Deven  on 1/29/17.
//  Copyright © 2017 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class RxPage: UIViewController {
    let lastpage: LastPage = LastPage()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    
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
    
    let titleLabel: UILabel = UILabel()
    let instructionsLabel: UILabel = UILabel()
    let scriptNameLabel: UILabel = UILabel()
    let scriptNameBox: UITextField = UITextField()
    let dosageLabel: UILabel = UILabel()
    let dosageBox:UITextField = UITextField()
    let refillsLabel:UILabel = UILabel()
    let refillsBox: UITextField = UITextField()
    let notesLabel: UILabel = UILabel()
    let notesBox:UITextField = UITextField()
    let sendWarning: UILabel = UILabel()
    
    // Might need to add which pharmacy?
    
    let progressLabel: UILabel = UILabel()
    let progressBar: UIProgressView = UIProgressView()
    var progressBarTimer:Timer!
    // To make custom bar use https://www.raywenderlich.com/97941/paintcode-swift-tutorial-part-2-custom-progress-bar
    
    let sendButton: UIButton = UIButton()
    let finishButton:UIButton = UIButton()
    let Skipbutton: UIButton = UIButton(type: UIButtonType.custom)
    
    
    
    //TODO: Pull from class info
    var doctorName = "Doctor Name"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let underlineAttributes = [
            NSFontAttributeName : UIFont.systemFont(ofSize: 27.0),
            NSForegroundColorAttributeName : tealColor,
            NSUnderlineStyleAttributeName : 1] as [String : Any]
        
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
        
        creationFunctions.makeLabel(titleLabel, name: "Rx", textColor: tealColor, alignment: .center, frame: CGRect(x: width * 0.5, y: 0.1 * height, width: 0.1 * width, height: 0.05 * height), page: self)
        titleLabel.font = UIFont(name: "Arial-BoldMT", size: 28)
        titleLabel.center.x = view.center.x
        
        creationFunctions.makeLabel(instructionsLabel, name: "PLEASE ENTER THE PERSCRIPTION \n INFORMAITON IN THE FIELDS BELOW", textColor: tealColor, alignment: .left, frame: CGRect(x: width * 0.5, y: 0.2 * height, width: 0.8 * width, height: 0.1 * height), page: self)
        instructionsLabel.font = UIFont(name: "Arial-BoldMT", size: 28)
        instructionsLabel.numberOfLines = 0
        
        scriptNameLabel.numberOfLines = 0
        creationFunctions.makeLabel(scriptNameLabel, name: "NAME OF \n SCRIP", textColor: tealColor, alignment: .left, frame: CGRect(x: width * 0.05,y: 0.2 * height, width: width * 0.25, height: 0.1 * height), page: self)
        scriptNameLabel.font = UIFont(name: "Arial-BoldMT", size: 28)

        
        creationFunctions.makeLabel(dosageLabel, name: "DOSAGE", textColor: tealColor, alignment: .left, frame: CGRect(x: width * 0.05,y: 0.3 * height, width: width * 0.25, height: 0.1 * height), page: self)
        dosageLabel.font = UIFont(name: "Arial-BoldMT", size: 28)

        
        creationFunctions.makeLabel(refillsLabel, name: "REFILLS", textColor: tealColor, alignment: .left, frame: CGRect(x: width * 0.05,y: 0.4 * height, width: width * 0.25, height: 0.1 * height), page: self)
        refillsLabel.font = UIFont(name: "Arial-BoldMT", size: 28)

        
        creationFunctions.makeLabel(notesLabel, name: "NOTES", textColor: tealColor, alignment: .left, frame: CGRect(x: width * 0.05,y: 0.5 * height, width: width * 0.25, height: 0.1 * height), page: self)
        notesLabel.font = UIFont(name: "Arial-BoldMT", size: 28)

        
        creationFunctions.makeLabel(progressLabel, name: "send progress...", textColor: UIColor.lightGray, alignment: .left, frame: CGRect(x: width * 0.05,y: 0.4 * height, width: width * 0.25, height: 0.1 * height), page: self)
        progressLabel.font = UIFont(name: "Arial-BoldMT", size: 18)

        creationFunctions.makeLabel(sendWarning, name: "DO NOT PRESS FINISH UNTIL THE SCRIP \n HAS FINISHED SENDING", textColor: UIColor.lightGray, alignment: .center, frame: CGRect(x: width * 0.5, y: 0.8 * height, width: 0.1 * width, height: 0.05 * height), page: self)
        sendWarning.font = UIFont(name: "Arial-BoldMT", size: 20)
        sendWarning.numberOfLines = 0
        
        // Adds progress Bar
        progressBar.frame  = CGRect(x: width * 0.33,y: 0.4 * height, width: width * 0.5, height: 0.05 * height)
        view.addSubview(progressBar)
        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(RxPage.updateProgressBar), userInfo: nil, repeats: true)
        
        let sendText = NSMutableAttributedString(string:"SEND", attributes: underlineAttributes)
        creationFunctions.makeClearButton(sendButton, name: "SEND", titleColor: tealColor, location: CGRect(x: width/2.3,y: 0.7 * height, width: width * 0.25, height: height/10), page: self)
        sendButton.titleLabel?.font =  UIFont(name: "Arial-BoldMT", size: 28)
        sendButton.layer.borderWidth = 5.0
        sendButton.center.x = view.center.x
        sendButton.layer.borderColor = tealColor.cgColor
        sendButton.setAttributedTitle(sendText, for: UIControlState())
        sendButton.addTarget(self, action: #selector(RxPage.sendClicked(_:)), for: .touchUpInside)
        
        finishButton.setImage(UIImage(named: "Finish"), for: UIControlState.normal)
        //add function for button
        //set frame
        finishButton.frame = CGRect(x: width/2.3,y: 0.88 * height, width: width * 0.25, height: height/10)
        finishButton.center.x = self.view.center.x
        self.view.addSubview(finishButton)
        finishButton.addTarget(self, action: #selector(RxPage.skipClicked(_:)), for: UIControlEvents.touchUpInside)

        //set image for button
        Skipbutton.setImage(UIImage(named: "SKIP"), for: UIControlState.normal)
        Skipbutton.frame = CGRect(x: width/1.4,y: 0.88 * height, width: width * 0.25, height: height/10)
        self.view.addSubview(Skipbutton)
        Skipbutton.addTarget(self, action: #selector(RxPage.skipClicked(_:)), for: UIControlEvents.touchUpInside)



    }
    
    func sendClicked(_ sender: UIButton){
        self.progressBarTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(RxPage.updateProgressBar), userInfo: nil, repeats: true)
    }
    
    func skipClicked(_ sender: UIBarButtonItem!){
        self.navigationController?.pushViewController(lastpage, animated: true)
    }
    
    func backClicked(_ sender: UIBarButtonItem!){
        print("Back Clicked")
        self.navigationController?.popViewController(animated: true)
    }
    
    func updateProgressBar(){
        self.progressBar.progress += 0.1
        if(self.progressBar.progress == 1.0)
        {
            self.progressBar.removeFromSuperview()
        }
        
    }
    
}
