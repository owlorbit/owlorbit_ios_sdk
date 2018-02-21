//
//  User.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class User: Mappable {
    
    public var userId: Int?
    public var email: String?
    public var phoneNumber: String?
    public var firstName: String?
    public var lastName: String?
    public var avatar: String?

    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        userId <-  (map["user_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        email <- map["email"]
        phoneNumber <- map["phone_number"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        avatar <- map["avatar"]
    }
}
