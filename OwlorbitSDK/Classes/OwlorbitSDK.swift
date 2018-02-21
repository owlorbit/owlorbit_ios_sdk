//
//  Owlorbit.swift
//  OwlorbitSDK
//
//  Created by Timmy Nguyen on 2/8/18.
//  Copyright © 2018 Tim Nuwin. All rights reserved.
//

import Foundation

public class OwlorbitSDK {
    
    public var owlorbitApi:OwlorbitApi;
    
    public init(publicKey:String, encryptedSession:String, sessionHash:String) {
        owlorbitApi = OwlorbitApi(publicKey: publicKey, encryptedSession: encryptedSession, sessionHash: sessionHash)
    }        
}
