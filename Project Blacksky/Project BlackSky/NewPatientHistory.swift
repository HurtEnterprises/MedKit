//
//  NewPatientHistory.swift
//  Project BlackSky
//
//  Created by Deven  on 1/10/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation

class NewPatientHistory: UIViewController {
    
    let mainMenu: MainMenu = MainMenu()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        self.view.backgroundColor = UIColor.cyanColor()
    }
    
    //Smoker? Current Meds? Current illnesses? Family history of illness?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Makes Navigation Bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
        
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "New Patient: History", color: UIColor.grayColor(), forwardButton: false, backButton: true, page: self)
        
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backClicked(sender: UIBarButtonItem!){
        self.presentViewController(self.mainMenu, animated: true, completion: nil)
    }
    
}