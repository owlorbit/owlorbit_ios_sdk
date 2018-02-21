//
//  User.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class PollResponse: Mappable {
    
    public var pollingId: Int?
    public var pollingChoiceId: Int?
    public var userId: Int?
    public var firstName: String?
    public var lastName: String?
    
    public var email: String?
    public var avatar: String?
    public var created: String?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        
        pollingId <-  (map["polling_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        pollingChoiceId <-  (map["polling_choice_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        userId <-  (map["user_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        
        email <- map["email"]
        avatar <- map["avatar"]
        
        created <- map["created"]
        
        
    }
}
