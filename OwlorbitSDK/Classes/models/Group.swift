//
//  User.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class Group: Mappable {
    
    public var id: Int?
    public var name: String?
    public var domainId: Int?
    public var created: String?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        id <-  (map["id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        name <- map["name"]
        domainId <-  (map["domain_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        created <- map["created"]
    }
}
