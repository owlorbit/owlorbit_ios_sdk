//
//  ListAllUserModel.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class ListAllPollsModel: BaseApiResponseModel {
    public var polls: [Poll]?
    
    required public init?(map: Map){
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        polls <- map["polls"]
    }
}
