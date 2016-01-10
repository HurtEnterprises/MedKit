//
//  MasterViewController.swift
//  Project BlackSky
//
//  Created by Mehrab  on 12/29/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation


let CognitoRegionType = AWSRegionType.USEast1
let DefaultServiceRegionType = AWSRegionType.USEast1
let CognitoIdentityPoolId = "us-east-1:b9a270f0-ab59-4cbf-ac54-e1dd45a51d96"
let AWSSampleDynamoDBTableName = "Login-Test"

let screenSize: CGRect = UIScreen.mainScreen().bounds // Gets Size of Screen


// NOTE: This is incredibly rough and we will need to consult with practicing medical professionals to figure out what to put here
class CurrentUser {
    let firstName: String
    let lastName: String
    
    let NPINumber: Int //National Provider Identifier (like a social security number for doctors)
    let Specialty: String // Can be drawn from NPI database https://npidb.org/npi-lookup/
    // Maybe for secretaries and nurses fill in the NPI Number & specialty of the doctor(s) they work under
    let MedicaidID: Int?
    let MedicareUPIN: String?
    
    let officeAddress: String
    let officeCity: String
    let officestate: String
    let officeZip: Int
    let officePhone: String
    
    let cellPhone: String
    
    let typeOfUser: String //Maybe here define doctor, nurse, secretary, for access purposes (probably needs a better syste)
}