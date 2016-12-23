//
//  LoginData.swift
//  Project BlackSky
//
//  Created by May on 1/3/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import AWSS3
import AWSDynamoDB
import AWSSQS
import AWSSNS
import AWSCognito

/**
 * A class to capture Login data/info in the database.
 * Has primary key: "Username". No sorted key.
 */
class DDBLoginData :AWSDynamoDBObjectModel, AWSDynamoDBModeling {
    var PhysicianID:String?
    var Password:String?
    
    var Email:String? = ""
    
    var internalName:String?
    var internalState:NSNumber?
    var VerifiedEmail = false
    
    class func dynamoDBTableName() -> String! {
        return AWSDynamoDBLoginTable
    }
    
    class func hashKeyAttribute() -> String! {
        return "PhysicianID"
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
