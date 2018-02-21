//
//  ApiSharedHelper.swift
//  OwlorbitSDK
//
//  Created by Timmy Nguyen on 2/9/18.
//  Copyright © 2018 Tim Nuwin. All rights reserved.
//

import Foundation


class ApiSharedHelper {
    
    var publicKey:String
    var encryptedSession:String
    var sessionHash:String
    
    static let sharedInstance : ApiSharedHelper = {
        let instance = ApiSharedHelper()
        return instance
    }()
    
    init(){
        publicKey = "";
        encryptedSession = "";
        sessionHash = ""
    }
    
    public func setValues(publicKey:String, encryptedSession:String, sessionHash:String) {
        self.publicKey = publicKey
        self.encryptedSession = encryptedSession
        self.sessionHash = sessionHash
    }

    
}
