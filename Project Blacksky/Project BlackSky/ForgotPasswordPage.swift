//
//  ForgotPassword.swift
//  Project BlackSky
//
//  Created by Deven  on 12/27/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

class ForgotPasswordPage: UIViewController {
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        self.view.backgroundColor = UIColor.whiteColor()
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let getStarted = UIButton()
        getStarted.setTitle("Forgot Password", forState: .Normal)
        getStarted.setTitleColor(UIColor.blueColor(), forState: .Normal)
        getStarted.frame = CGRectMake((screenSize.width-120)/2, screenSize.width/2, 120, 30) // X, Y, width, height
        getStarted.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(getStarted)
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pressed(sender: UIButton!) {
        
        let loginPage:LoginPage = LoginPage()
        
        self.presentViewController(loginPage, animated: true, completion: nil)
        
    }
}