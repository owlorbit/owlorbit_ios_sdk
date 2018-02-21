//
//  ListAllUserModel.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class ListAllLocationModel: BaseApiResponseModel {
    public var locations: [Location]?
    
    required public init?(map: Map){
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        locations <- map["locations"]
    }
}
