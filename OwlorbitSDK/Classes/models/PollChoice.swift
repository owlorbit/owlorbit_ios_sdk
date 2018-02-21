//
//  User.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class PollChoice: Mappable {
    
    public var id: Int?
    public var pollingId: Int?
    public var choice: String?
    
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        id <-  (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        pollingId <-  (map["polling_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        choice <- map["choice"]        
        
    }
}
