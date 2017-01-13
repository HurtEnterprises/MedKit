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
        self.view.backgroundColor = UIColor.cyan
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        // Makes Navigation Bar
//        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 50)) // Offset by 20 pixels vertically to take the status bar into account
//        
//        creationFunctions.makeNavigationBar(navigationBar, barTitle: "My Appointments", forwardButton: false, backButton: true, page: self)
        
        
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backClicked(_ sender: UIBarButtonItem!){
        self.present(self.mainMenu, animated: true, completion: nil)
    }
    

}
