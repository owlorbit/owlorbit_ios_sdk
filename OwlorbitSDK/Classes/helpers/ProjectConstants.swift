//
//  ProjectConstants.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/13/18.
//
//

import Foundation


//
//  ProjectConstants.swift
//  Sift
//
//  Created by Timmy Nguyen on 11/18/15.
//  Copyright © 2015 Tim Nuwin. All rights reserved.
//

struct ProjectConstants {
    
    struct ApiBaseUrl {
        //static let value = "http://192.168.99.100:8080"
        static let value = "https://api.owlorbit.com/v1"
        //static let value = "http://10.0.0.247"
    }
    
    struct ProfileImgBaseUrl{
        static let value = "https://s3-us-west-2.amazonaws.com/owlorbit-profile-imgs/"
    }
    
    struct Settings {
        static let MESH_NETWORK_ON = false
    }
    
    struct WebBaseUrl {
        //static let value = "http://192.168.99.100:9090"
        static let value = "http://app.owlorbit.com"
    }
    
    struct CoreData{
        static let version = "7"
    }
    
    struct AppColors{
        static let ORANGE = UIColor(red:255.0/255.0, green:193.0/255.0, blue:73.0/255.0, alpha:1.0)
        static let PRIMARY = UIColor(red:131.0/255.0, green:134.0/255.0, blue:169.0/255.0, alpha:1.0)
        static let PRIMARY_SHADE = UIColor(red:147.0/255.0, green:131.0/255.0, blue:169.0/255.0, alpha:1.0)
    }
}
