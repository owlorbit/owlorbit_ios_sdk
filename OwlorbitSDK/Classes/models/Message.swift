//
//  User.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class Message: Mappable {
    
    public var id: Int?
    public var firstName: String?
    public var lastName: String?
    public var userId: Int?
    public var created: String?
    public var message: String?
    public var avatar: String?
    public var roomId: Int?
    
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        id <-  (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        userId <-  (map["user_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        created <- map["date_in_utc"]
        message <- map["message"]
        avatar <- map["avatar"]
        
        roomId <-  (map["room_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
    }
}
