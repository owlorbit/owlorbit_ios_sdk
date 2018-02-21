//
//  BaseApiResponseModel.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class BaseApiResponseModel: Mappable {
    
    public var message: String?
    public var errorCode: Int?
    public var successful: Bool?
    
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        message <- map["message"]
        errorCode <- map["error_code"]
        successful <- map["successful"]
    }
}
