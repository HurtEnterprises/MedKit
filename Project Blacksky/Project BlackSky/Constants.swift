//
//  MasterViewController.swift
//  Project BlackSky
//
//  Created by Mehrab  on 12/29/15.
//  Copyright © 2015 Hurt Enterprises. All rights reserved.
//

import Foundation
import AWSS3
import AWSDynamoDB
import AWSSQS
import AWSSNS
import AWSCognito


let CognitoRegionType = AWSRegionType.usEast1
let DefaultServiceRegionType = AWSRegionType.usEast1
let CognitoIdentityPoolId = "us-east-1:b9a270f0-ab59-4cbf-ac54-e1dd45a51d96"
let AWSDynamoDBLoginTable = "LoginData"
let AWSDynamoDBPatientTable = "Patient-Data"

let screenSize: CGRect = UIScreen.main.bounds // Gets Size of Screen
let height = screenSize.height
let width = screenSize.width
let patientPrototype: PatientData = PatientData()

var currentUser = DDBLoginData()
