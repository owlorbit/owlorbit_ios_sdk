//
//  UserApi.swift
//  OwlorbitSDK
//
//  Created by Timmy Nguyen on 2/9/18.
//  Copyright © 2018 Tim Nuwin. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import AlamofireObjectMapper


public class UserApi {
    
    
    class func doesEmailExist(email:String, domain:String, resultObj:@escaping (DoesEmailExist) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/user/does_email_exist"
        var data:[String:String];
        
        data = ["email": email, "domain": domain, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<DoesEmailExist>) in
            
            guard response.result.error == nil else {                
                error("Failure Response!")
                return
            }
            
            if let value = response.result.value {
                if(value.successful == nil || value.successful!){
                    resultObj(value)
                }else{
                    let success:Bool = value.successful!
                    if(!success){
                        let message:String = value.message!
                        error(message)
                    }
                }
            } else {
                error("Unknown issue!")
            }
        }
    }
    
    class func addUserToDomain(email:String, password:String, firstName:String, lastName: String, phoneNumber:String, resultObj:@escaping (AddUserDomainModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/user/add_user_to_domain"
        var data:[String:String];
        
        data = ["email": email, "password": password, "first_name": firstName, "last_name":  lastName, "phone_number": phoneNumber, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<AddUserDomainModel>) in
            
            guard response.result.error == nil else {
                let json = String(data: response.data!, encoding: String.Encoding.utf8)
                error(json!)
                return
            }
            
            if let value = response.result.value {
                if(value.successful == nil || value.successful!){
                    resultObj(value)
                }else{
                    let success:Bool = value.successful!
                    if(!success){
                        let message:String = value.message!
                        error(message)
                    }
                }
            } else {
                error("Unknown issue!")
            }
        }
    }
    

    class func listAllUsers(resultObj:@escaping (ListAllUserModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/user/list_all_domain_users"
        var data:[String:String];
        
        data = ["publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllUserModel>) in
                
            guard response.result.error == nil else {
                error("Failure Response!")
                return
            }
            
            if let value = response.result.value {
                if(value.successful == nil || value.successful!){
                    resultObj(value)
                }else{
                    let success:Bool = value.successful!
                    if(!success){
                        let message:String = value.message!
                        error(message)
                    }
                }
            } else {
                error("Unknown issue!")
            }
        }
    }
    
    
}
