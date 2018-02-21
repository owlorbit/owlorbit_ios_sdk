//
//  ListAllUserModel.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper

public class ListAllPollResponsesModel: BaseApiResponseModel {
    public var pollResponses: [PollResponse]?
    
    required public init?(map: Map){
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        pollResponses <- map["responses"]
    }
}
