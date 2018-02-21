//
//  ListAllRoomsModel.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/17/18.
//
//

import Foundation
import ObjectMapper

public class ListAllMeetupsModel: BaseApiResponseModel {
    public var meetupLocations: [MeetupLocation]?
    
    required public init?(map: Map){
        super.init(map: map)
    }
    
    override public func mapping(map: Map) {
        super.mapping(map: map)
        
        meetupLocations <- map["meetup_locations"]
    }
}
