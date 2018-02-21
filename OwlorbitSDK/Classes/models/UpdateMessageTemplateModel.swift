//
//  AddUserDomainModel.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/16/18.
//
//

import Foundation
import ObjectMapper

public class UpdateMessageTemplateModel: BaseApiResponseModel {
    public var messageTemplateId: Int?
    
    required public init?(map: Map){
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        messageTemplateId <- map["message_template_id"]
    }
}
