//
//  User.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class Template: Mappable {
    
    public var messageTemplateId: Int?
    public var groupId: Int?
    public var name: String?
    public var choice: String?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        messageTemplateId <-  (map["message_template_id"], TransformOf<Int, String>(fromJSON: { Int($0!) }, toJSON: { $0.map { String($0) } }))
        groupId <- map["group_id"]
        name <- map["name"]
        choice <- map["choice"]
    }
}
