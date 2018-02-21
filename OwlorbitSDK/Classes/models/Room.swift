//
//  User.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class Room: Mappable {
    
    public var roomId: Int?
    public var name: String?
    public var lastMessage: String?
    public var isPublicChannel: Int?
    public var lastDisplayName: String?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        roomId <-  (map["roomId"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        name <- map["name"]
        lastMessage <- map["last_message"]
        isPublicChannel <- (map["is_public_channel"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        lastDisplayName <- map["last_display_name"]
        
    }
}
