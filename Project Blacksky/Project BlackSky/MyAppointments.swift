//
//  MyAppointments.swift
//  Project BlackSky
//
//  Created by Deven  on 1/9/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import UIKit
import GoogleAPIClient
import GTMOAuth2

class MyApointments: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let mainMenu: MainMenu = MainMenu()
    let creationFunctions: UICreationFunctions = UICreationFunctions()
    let scheduleTable: UITableView = UITableView()
    let cellReuseIdentifier = "cell"
    var appointments: [String] = []
    fileprivate let kKeychainItemName = "Google Calendar API"
    fileprivate let kClientID = "45994898732-dkpdmhmqh68nhrlt2sgg7u62dhv41utu.apps.googleusercontent.com"
    
    // If modifying these scopes, delete your previously saved credentials by
    // resetting the iOS simulator or uninstall the app.
    fileprivate let scopes = [kGTLAuthScopeCalendarReadonly]
    
    fileprivate let service = GTLServiceCalendar()
    
    // Creates the auth controller for authorizing access to Google Calendar API
    fileprivate func createAuthController() -> GTMOAuth2ViewControllerTouch {
        let scopeString = scopes.joined(separator: " ")
        return GTMOAuth2ViewControllerTouch(
            scope: scopeString,
            clientID: kClientID,
            clientSecret: nil,
            keychainItemName: kKeychainItemName,
            delegate: self,
            finishedSelector: #selector(self.viewController(_:finishedWithAuth:error:))
        )
    }
    
    // Handle completion of the authorization process, and update the Google Calendar API
    // with the new credentials.
    func viewController(_ vc : UIViewController,
                        finishedWithAuth authResult : GTMOAuth2Authentication, error : NSError?) {
        
        if error != nil {
            service.authorizer = nil
            print("error error")
            return
        }
        
        service.authorizer = authResult
        dismiss(animated: true, completion: nil)
    }
    
    // Construct a query and get a list of upcoming events from the user calendar
    func fetchEvents() {
        let query = GTLQueryCalendar.queryForEventsList(withCalendarId: "primary")
        query?.maxResults = 10
        query?.timeMin = GTLDateTime(date: Date(), timeZone: TimeZone.autoupdatingCurrent)
        query?.singleEvents = true
        query?.orderBy = kGTLCalendarOrderByStartTime
        service.executeQuery(
            query!,
            delegate: self,
            didFinish: #selector(self.displayResultWithTicket(_:finishedWithObject:error:))
        )
    }
    
    // Display the start dates and event summaries in the UITextView
    func displayResultWithTicket(
        _ ticket: GTLServiceTicket,
        finishedWithObject response : GTLCalendarEvents,
        error : NSError?) {
        
        if error != nil {
            print("\(error)")
            return
        }
        
        var eventString = ""
        
        if let events = response.items() , !events.isEmpty {
            for event in events as! [GTLCalendarEvent] {
                let start : GTLDateTime! = event.start.dateTime ?? event.start.date
                let startString = DateFormatter.localizedString(
                    from: start.date,
                    dateStyle: .short,
                    timeStyle: .short
                )
                eventString = "\(startString) - \(event.summary!)\n"
                self.appointments.append(eventString)
            }
        } else {
            eventString = "No upcoming events found."
        }
        
        DispatchQueue.main.async{
            self.scheduleTable.reloadData()
        }
    }
    func onceDeleted(
        _ ticket: GTLServiceTicket,
        finishedWithObject response : GTLCalendarEvents,
        error : NSError?) {
        
        if error != nil {
            print("\(error)")
            return
        }
    }
    
    
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
        //google cal auth
        if let auth = GTMOAuth2ViewControllerTouch.authForGoogleFromKeychain(
            forName: kKeychainItemName,
            clientID: kClientID,
            clientSecret: nil) {
            service.authorizer = auth
            print("hahahaha god pls")
        }
        creationFunctions.makeTable(scheduleTable, location: CGRect(x: 0, y:100, width:self.view.frame.size.width, height:self.view.frame.size.height), page: self)
        self.scheduleTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        scheduleTable.delegate = self
        scheduleTable.dataSource = self
        
        // Makes Navigation Bar
        let navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 50)) // Offset by 20 pixels vertically to take the status bar into account
        
        creationFunctions.makeNavigationBar(navigationBar, barTitle: "My Appointments", forwardButton: false, backButton: false, page: self)
        
        
        self.configureView()
    }
    
    // When the view appears, ensure that the Google Calendar API service is authorized
    // and perform API calls
    override func viewDidAppear(_ animated: Bool) {
        if let authorizer = service.authorizer,
            let canAuth = authorizer.canAuthorize , canAuth {
            fetchEvents()
        } else {
            present(
                createAuthController(),
                animated: true,
                completion: nil
            )
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int {
        return self.appointments.count
    }
    
    // something
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.scheduleTable.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        cell.textLabel?.text = self.appointments[indexPath.row]
        
        return cell
    }
    
    // on-tap
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row), which corresponds to the lovely \(self.appointments[indexPath.row]).")
    }
    
    // deletion - not really necessary.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            // remove the item from the data model
            self.appointments.remove(at: indexPath.row)
            
            //remove from gcal
            let query = GTLQueryCalendar.queryForCalendarListDelete(withCalendarId: "primary")
            query?.maxResults = 10
            query?.timeMin = GTLDateTime(date: Date(), timeZone: TimeZone.autoupdatingCurrent)
            query?.singleEvents = true
            query?.orderBy = kGTLCalendarOrderByStartTime
            service.executeQuery(
                query!,
                delegate: self,
                didFinish: #selector(self.onceDeleted(_:finishedWithObject:error:))
            )
            // delete the table view row
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Not used in our example, but if you were adding a new row, this is where you would do it.
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func backClicked(_ sender: UIBarButtonItem!){
        self.present(self.mainMenu, animated: true, completion: nil)
    }
    

}
