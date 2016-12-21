//
//  DetailViewController.swift
//  Project BlackSky
//
//  Created by Deven  on 11/16/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        let getStarted = UIButton()
        getStarted.setTitle("Get Started", for: UIControlState())
        getStarted.setTitleColor(UIColor.blue, for: UIControlState())
        getStarted.frame = CGRect(x: width*44/100, y: height*61/100, width: width*12/100, height: height*2/100) // X, Y, width, height
        getStarted.addTarget(self, action: #selector(DetailViewController.pressed(_:)), for: .touchUpInside)
        getStarted.titleLabel?.font = UIFont(name: (getStarted.titleLabel?.font?.fontName)!, size: 30)
        self.view.addSubview(getStarted)
        
        let companyLabel:UILabel = UILabel()
        creationFunctions.makeLabel(companyLabel, name: "Welcome to Doctor's Notes", textColor: UIColor.blue, alignment: NSTextAlignment.center, frame: CGRect(x: (screenSize.width-400)/2, y: screenSize.height/3, width: 400, height: 65), page: self)
        companyLabel.font = UIFont(name: (companyLabel.font?.fontName)!, size: 30)

        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pressed(_ sender: UIButton!) {
        
        let loginPage:LoginPage = LoginPage()
        self.present(loginPage, animated: true, completion: nil)
        
    }
}
