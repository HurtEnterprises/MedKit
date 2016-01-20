//
//  PatientClass.swift
//  
//
//  Created by Deven  on 1/19/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation

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
    var zip:Int? = 0
    
    var email:String? = ""
    var phoneNumber: String? = ""
    
    var insuranceProvider:String? = ""
    var policyNumber:Int? = 0
    
    var smokerStatus: Bool = false
    var currentMedications = []
    var prexistingContitions = []
    var familyHistory = []
    
    var internalName:String?
    var internalState:NSNumber?
    
    class func dynamoDBTableName() -> String! {
        return AWSSampleDynamoDBTableName //@Mehrab, change the table name here? Idk
    }
    
    class func hashKeyAttribute() -> String! {
        return "Username" //@Mehrab, hash on email?
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