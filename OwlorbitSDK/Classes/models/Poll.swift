//
//  User.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class Poll: Mappable {
    
    public var id: Int?
    public var userId: Int?
    public var groupId: Int?
    public var question: String?
    public var manualLocationRequestEnabled: Int?
    
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        id <-  (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        userId <-  (map["user_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
                
        if (map.JSON["group_id"] as? NSNull) == nil {
            groupId <-  (map["group_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        }
        
        question <- map["question"]
        manualLocationRequestEnabled <-  (map["manual_location_request_enabled"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        
    }
}
