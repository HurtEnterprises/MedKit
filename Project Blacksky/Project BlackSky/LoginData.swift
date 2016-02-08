//
//  LoginData.swift
//  Project BlackSky
//
//  Created by May on 1/3/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation

/**
 * A class to capture Login data/info in the database.
 * Has primary key: "Username". No sorted key.
 */
class DDBLoginData :AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var Username:String?
    var Password:String?
    
    var email:String? = ""
    
    var internalName:String?
    var internalState:NSNumber?
    var verifiedEmail = false
    
    class func dynamoDBTableName() -> String! {
        return AWSDynamoDBLoginTable
    }
    
    class func hashKeyAttribute() -> String! {
        return "Username"
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