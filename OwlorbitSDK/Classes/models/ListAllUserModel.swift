//
//  ListAllUserModel.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class ListAllUserModel: BaseApiResponseModel {
    public var users: [User]?

    required public init?(map: Map){
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)

        users <- map["users"]
    }
}
