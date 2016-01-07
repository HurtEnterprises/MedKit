//
//  EncryptionFunctions.swift
//  Project BlackSky
//
//  Created by Tim Bryant on 1/5/16.
//  Copyright © 2016 Hurt Enterprises. All rights reserved.
//

import Foundation
import Security



var blockSize = 2
var publicKey, privateKey: SecKey?
var Tag: String?


func findKey(tag: String) -> SecKey? { //details are gritty but the function finds which keys to use for encryption based on the user
    let query: [String: AnyObject] = [
        kSecClass as String: kSecClassKey,
        kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
        kSecAttrApplicationTag as String: tag,
        kSecReturnRef as String: true
    ]
    
    var keyPtr: AnyObject?
    let result = SecItemCopyMatching(query, &keyPtr)
    
    switch result {
    case noErr:
        let key = keyPtr as! SecKey
        return key
    case errSecItemNotFound:
        return nil
    default:
        print("Error occurred: \(result)`")
        return nil
    }
}

let publicKeyParameters: [String: AnyObject] = [
    kSecAttrIsPermanent as String: true,
    kSecAttrApplicationTag as String: Tag!
]
let privateKeyParameters: [String: AnyObject] = [
    kSecAttrIsPermanent as String: true,
    kSecAttrApplicationTag as String: Tag!
]

let parameters: [String: AnyObject] = [
    kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
    kSecAttrKeySizeInBits as String: 2048,
    kSecPublicKeyAttrs as String: publicKeyParameters,
    kSecPrivateKeyAttrs as String: privateKeyParameters
]


func generateKeys() { //function that generates the keys, called during the registration process
    _ = SecKeyGeneratePair(parameters, &publicKey, &privateKey)
    blockSize = SecKeyGetBlockSize(publicKey!)
}

func Encrypt2(UserInput: String) -> String { //date is entered in as a string and goes into the db as an encrypted string
    
    var encryptedData = [UInt8](count: Int(blockSize), repeatedValue: 0)
    let plainText = UserInput
    let plainTextData = [UInt8](plainText.utf8)
    let plainTextDataLength = plainText.characters.count
    
    var encryptedDataLength = blockSize
    
    _ = SecKeyEncrypt(findKey(Tag!)!, SecPadding.PKCS1, plainTextData, plainTextDataLength, &encryptedData, &encryptedDataLength)
    
    var encryptedString = ""
    
    for var i = 0; i < 256; ++i {
        encryptedString = encryptedString + String(encryptedData[i]) + " "
    }
    return encryptedString
}

func Decrypt2(encryptedTextString: String) -> String{ //the encrypted string from the db is converted to the original string
    
    
    let encryptedTextInt = encryptedTextString.characters.split(" ").flatMap { UInt8(String($0)) }
    
    var decryptedData = [UInt8](count: Int(blockSize), repeatedValue: 0)
    var decryptedDataLength = blockSize
    
    _ = SecKeyDecrypt(findKey(Tag!)!, SecPadding.PKCS1, encryptedTextInt, decryptedDataLength, &decryptedData, &decryptedDataLength)
    
    
    let decryptedText = String(bytes: decryptedData, encoding:NSUTF8StringEncoding)
    
    return decryptedText!
}


