//
//  MyAppointments.swift
//  Project BlackSky
//
//  Created by Deven  on 1/9/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class MyApointments: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Makes Navigation Bar
        let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account
        
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "My Appointments", forwardButton: false, backButton: true, page: self)
        
        
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