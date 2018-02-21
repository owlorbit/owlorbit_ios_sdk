//
//  ListAllUserModel.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class ListAllMessageTemplateModel: BaseApiResponseModel {
    public var templates: [Template]?
    
    required public init?(map: Map){
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        templates <- map["templates"]
    }
}
