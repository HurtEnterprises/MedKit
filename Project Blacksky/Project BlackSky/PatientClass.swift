//
//  PatientClass.swift
//  
//
//  Created by Deven  on 1/19/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import AWSS3
import AWSDynamoDB
import AWSSQS
import AWSSNS
import AWSCognito

/**
 * A class to capture general patient data/info in the database.
 * Has primary key: "Username". No sorted key. <---@Mehrab change here
 */
class PatientData :AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var firstName:String? = ""
    var middleName:String? = ""
    var lastName:String? = ""
    
    var DOB:String? = "" //Date of Birth of the format "MM-dd-yyyy"
    
    var streetAddress:String? = ""
    var city:String? = ""
    var state:String? = ""
    var zip:String? = ""
    
    var Email:String? = ""
    var phoneNumber: String? = ""
    
    var insuranceProvider:String? = ""
    var policyNumber:String? = ""
    
    var smokerStatus: String? = ""
    var drinkerStatus: String? = ""
    var currentMedications = [String]()
    var prexistingContitions = [String]()
    var familyHistory = [String]()
    
    var internalName:String?
    var internalState:NSNumber?
    
    class func dynamoDBTableName() -> String! {
        return AWSDynamoDBPatientTable //@Mehrab, change the table name here? Idk
    }
    
    class func hashKeyAttribute() -> String! {
        return "Email" //@Mehrab, hash on email?
    }
    
    class func ignoreAttributes() -> [AnyObject]! {
        return ["internalName", "internalState"]
    }
    
    override func isEqual(object: AnyObject?) -> Bool {
        return super.isEqual(object)
    }
    
    override func `self`() -> Self {
        return self
    }
}