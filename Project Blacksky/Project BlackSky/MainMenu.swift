//
//  MainMenu.swift
//  Project BlackSky
//
//  Created by Deven  on 1/6/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit

let creationFunctions: UICreationFunctions = UICreationFunctions()
let loginPage:LoginPage = LoginPage()


class MainMenu: UIViewController,UITableViewDelegate, UITableViewDataSource {


        var tableView: UITableView  =   UITableView()
        
        var items: [String] = ["Viper", "X", "Games"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = UIColor.whiteColor()

            
            // Makes Navigation Bar
            let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account

            creationFunctions.makeNavigationBar(navigationBar, barTitle: "Main Menu", color: UIColor.grayColor(), forwardButton: false, backButton: true, page: self)
            // Do any additional setup after loading the view, typically from a nib.
            
            tableView.frame         =   CGRectMake(0, 70, 320, 200);
            tableView.delegate      =   self
            tableView.dataSource    =   self
            
            tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            
            self.view.addSubview(tableView)
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.items.count
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
            
            cell.textLabel?.text = self.items[indexPath.row]
            
            return cell
            
        }
        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            print("You selected cell #\(indexPath.row)!")
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    func backClicked(sender: UIBarButtonItem!){
        self.presentViewController(loginPage, animated: true, completion: nil)
    }
    
}


