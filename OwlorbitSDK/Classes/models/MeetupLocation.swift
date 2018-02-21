//
//  User.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper
import SwiftyJSON

public class MeetupLocation: Mappable {
    
    public var id: Int?
    public var userId: Int?
    public var roomId: Int?
    
    public var title: String?
    public var subtitle: String?
    
    
    public var longitude: Float?
    public var latitude: Float?
    
    public var metadata: JSON?
    public var created: String?
    
    public var active: Int?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        id <-  (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        userId <-  (map["user_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        roomId <-  (map["room_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        
        
        title <- map["title"]
        subtitle <- map["subtitle"]
        
        longitude <-  (map["longitude"], TransformOf<Float, String>(fromJSON: { Float($0!) }, toJSON: { $0.map { String($0) } }))
        latitude <-  (map["latitude"], TransformOf<Float, String>(fromJSON: { Float($0!) }, toJSON: { $0.map { String($0) } }))
        
        if (map.JSON["metadata"] as? NSNull) == nil {
            metadata <- map["metadata"]
        }
        
        created <- map["created"]        
        active <-  (map["active"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
    }
}
