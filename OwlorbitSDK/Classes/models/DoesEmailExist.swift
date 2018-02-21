//
//  DoesEmailExist.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/16/18.
//
//

import Foundation
import ObjectMapper

public class DoesEmailExist: BaseApiResponseModel {
    public var emailExists: Bool?
    
    required public init?(map: Map){
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        emailExists <- map["emailExists"]
    }
}
