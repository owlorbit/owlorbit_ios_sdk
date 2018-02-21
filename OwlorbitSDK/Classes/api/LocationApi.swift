
//
//  RoomApi.swift
//  Pods
//
//  Created by Timmy Nguyen on 2/17/18.
//
//

import Foundation
import SwiftyJSON
import Alamofire
import AlamofireObjectMapper

public class LocationApi {
    
    class func listAllLocations(resultObj:@escaping (ListAllLocationModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/location/get_all_user_locations"
        var data:[String:Any];
        
        data = ["publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllLocationModel>) in
            
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
    
    class func listAllLocationsByEmail(email:String, resultObj:@escaping (ListAllLocationModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/location/user_location_by_email"
        var data:[String:Any];
        
        data = ["email": email, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllLocationModel>) in
            
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
    
    class func listAllLocationsByRoom(roomId:Int, resultObj:@escaping (ListAllLocationModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/location/get_locations_by_room_id"
        var data:[String:Any];
        
        data = ["roomId": roomId, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllLocationModel>) in
            
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
    
    class func addLocationByEmail(email:String, longitude:Float, latitude:Float, altitude:Float?, metadata:JSON?, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/location/add_by_user_email"
        var data:[String:Any];
        
        data = ["email": email, "longitude" : longitude, "latitude" : latitude, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        if (altitude != nil) {
            data["altitude"] = altitude
        }
        
        if (metadata != nil) {
            data["metadata"] = metadata
        }
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<BaseApiResponseModel>) in
            
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
    
    
}
