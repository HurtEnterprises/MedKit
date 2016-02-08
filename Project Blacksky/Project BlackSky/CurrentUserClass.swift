//
//  CurrentUser.swift
//  Project BlackSky
//
//  Created by Deven  on 1/19/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation

/**
 * A class to capture the current user data/info in the database.
 * Has primary key: "Username". No sorted key. <---@Mehrab change here
 */
class User :AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var firstName: String = ""
    var lastName: String = ""
    
    var NPINumber: Int = 0 //National Provider Identifier (like a social security number for doctors)
    var Specialty: String = "" // Can be drawn from NPI database https://npidb.org/npi-lookup/
    // Maybe for secretaries and nurses fill in the NPI Number & specialty of the doctor(s) they work under
    var MedicaidID: Int?
    var MedicareUPIN: String?
    
    var officeAddress: String = ""
    var officeCity: String = ""
    var officestate: String = ""
    var officeZip: Int = 0
    var officePhone: String = ""
    
    var cellPhone: String = ""
    var email:String? = ""
    
    var typeOfUser: String = "" //Maybe here define doctor, nurse, secretary, for permissions purposes (probably needs a better system)
    
    var internalName:String?
    var internalState:NSNumber?
    
    class func dynamoDBTableName() -> String! {
        return AWSDynamoDBLoginTable //I think this should be a whole different table in the database. Idk how you set that though
    }
    
    class func hashKeyAttribute() -> String! {
        return "Username" //@Mehrab maybe hash based on email? Idk what you wanna do
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