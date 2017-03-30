//
//  VisitClass.swift
//  Project BlackSky
//
//  Created by Deven  on 3/29/17.
//  Copyright © 2017 Hurt Enterprises. All rights reserved.
//

import Foundation
import AWSS3
import AWSDynamoDB
import AWSSQS
import AWSSNS
import AWSCognito

/**
 * A class to capture the visit data/info in the database.
 * Has primary key: "Username". No sorted key. <---@Mehrab change here
 */
class VisitClass :AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var patient:String? = ""
    var date:String? = ""
    
    var body = (String(),[String]())
    
    var diagnosis = (String(),[String]())
    
    var gender:String? = ""
    
    var history: String? = ""
    
    var illness = (String(),[String]())
    
    var prescription = (String(),[String]())
    
    var request: Bool? = nil
    
    var internalName:String?
    var internalState:NSNumber?
    
    class func dynamoDBTableName() -> String! {
        return AWSDynamoDBPatientTable //@Mehrab, change the table name here? Idk
    }
    
    class func hashKeyAttribute() -> String! {
        return "Email" //@Mehrab, hash on email?
    }
    
    class func ignoreAttributes() -> [AnyObject]! {
        return ["internalName" as AnyObject, "internalState" as AnyObject]
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        return super.isEqual(object)
    }
    
    override func `self`() -> Self {
        return self
    }
}
