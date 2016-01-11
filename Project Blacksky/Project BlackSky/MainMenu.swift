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
let myPatientsPage: MyPatients = MyPatients()
let myAppointmentsPage: MyApointments = MyApointments()
let newPatientPage: NewPatient = NewPatient()


class MainMenu: UIViewController,UITableViewDelegate, UITableViewDataSource {


        var tableView: UITableView  =   UITableView()
        
        var items: [String] = ["My Appointments", "My Patients", "New Patient", "Logout"]
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            self.view.backgroundColor = UIColor.whiteColor()

            
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
                        
            self.view.addSubview(tableView)
        }
        
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.items.count
        }
        
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
            
            cell.textLabel?.text = self.items[indexPath.row]
            
            cell.backgroundColor = UIColor.lightGrayColor()
            
            return cell
            
        }
    
    func tableView(tableView: UITableView,
        heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            if indexPath.row == 3 {
                return (screenSize.height - 70)/4 //Whatever fits your need for that cell
            } else {
                return (screenSize.height - 70)/4 // other cell height
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
        self.presentViewController(loginPage, animated: true, completion: nil)
        //TODO: @Mehrab add some sort of logout function
    }
    
    func myPatientsClicked(){
        self.presentViewController(myPatientsPage, animated: true, completion: nil)
    }
    
    func myAppointmentsClicked(){
        self.presentViewController(myAppointmentsPage, animated: true, completion: nil)
    }
    
    func newPatientClicked(){
        self.presentViewController(newPatientPage, animated: true, completion: nil)
    }
    
}
    



