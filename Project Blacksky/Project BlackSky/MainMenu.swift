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
let registerPage: AccountRegisterPage = AccountRegisterPage()
let loginPage:LoginPage = LoginPage()
let myPatientsPage: MyPatients = MyPatients()
let myAppointmentsPage: MyApointments = MyApointments()
let NewPatientPage: NewPatient = NewPatient()


class MainMenu: UIViewController,UITableViewDelegate, UITableViewDataSource {


        var tableView: UITableView  =   UITableView()
        
        var items: [String] = ["My Appointments", "My Patients", "New Patient", "Logout"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = UIColor.whiteColor()
            
            tableView.layoutMargins = UIEdgeInsetsZero
            tableView.separatorInset = UIEdgeInsetsZero
            
            // Makes Navigation Bar
            let navigationBar = UINavigationBar(frame: CGRectMake(0, 20, self.view.frame.size.width, 50)) // Offset by 20 pixels vertically to take the status bar into account

            creationFunctions.makeNavigationBar(navigationBar, barTitle: "Main Menu", color: UIColor.grayColor(), forwardButton: false, backButton: false, page: self)
            
            // Makes Table
            
            tableView.frame         =   CGRectMake(0, 71, screenSize.width, screenSize.height);
            tableView.delegate      =   self
            tableView.dataSource    =   self
            
            tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
            tableView.rowHeight = UITableViewAutomaticDimension
            self.tableView.estimatedRowHeight = 200
            
            tableView.alwaysBounceVertical = false;
            self.tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
            self.tableView.separatorColor = UIColor.whiteColor()
                        
            self.view.addSubview(tableView)
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.items.count
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
            
            cell.textLabel?.text = self.items[indexPath.row]
            
            cell.backgroundColor = UIColor.lightGrayColor()
            
            cell.layoutMargins = UIEdgeInsetsZero
            
            return cell
            
        }
    
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            if indexPath.row == 3 {
                return height*24/100 //Whatever fits your need for that cell
            } else {
                return height*24/100 // other cell height
            }
    }
        
        func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            if (indexPath.row == 0){
                myAppointmentsClicked()
            } else if (indexPath.row == 1){
                myPatientsClicked()
            } else if (indexPath.row == 2){
                newPatientClicked()
            } else if (indexPath.row == 3){
                logoutClicked()
            }else{
                print("Invalid selection.")
            }
            print("You selected cell #\(indexPath.row)!")
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
    
    func logoutClicked(){
        if(self.presentedViewController == registerPage){
            registerPage.dismissViewControllerAnimated(true, completion: nil)
        }
        self.dismissViewControllerAnimated(true, completion: nil)
        //TODO: @Mehrab add some sort of logout function or we can make it so the user is logged out whenever they hit the login page?
    }
    
    func myPatientsClicked(){
        self.presentViewController(myPatientsPage, animated: true, completion: nil)
    }
    
    func myAppointmentsClicked(){
        self.presentViewController(myAppointmentsPage, animated: true, completion: nil)
    }
    
    func newPatientClicked(){
        self.presentViewController(NewPatientPage, animated: true, completion: nil)
    }
    
}
    



