//
//  User.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation
import ObjectMapper
import SwiftyJSON

public class Location: Mappable {
    
    public var longitude: Float?
    public var latitude: Float?
    public var altitude: Float?
    
    public var metadata: JSON?
    public var email: String?
    public var phoneNumber: String?
    public var firstName: String?
    public var lastName: String?
    public var avatar: String?
    
        
    required public init?(map: Map){
    }
    
    public func mapping(map: Map) {
        longitude <-  (map["longitude"], TransformOf<Float, String>(fromJSON: { Float($0!) }, toJSON: { $0.map { String($0) } }))
        latitude <-  (map["latitude"], TransformOf<Float, String>(fromJSON: { Float($0!) }, toJSON: { $0.map { String($0) } }))
        
        if (map.JSON["altitude"] as? NSNull) == nil {
            altitude <-  (map["altitude"], TransformOf<Float, String>(fromJSON: { Float($0!) }, toJSON: { $0.map { String($0) } }))
        }
        
        if (map.JSON["metadata"] as? NSNull) == nil {
            metadata <- map["metadata"]
        }
        
        email <- map["email"]
        phoneNumber <- map["phone_number"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        avatar <- map["avatar"]
    }
}
