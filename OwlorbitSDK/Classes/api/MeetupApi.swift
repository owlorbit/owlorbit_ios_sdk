
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

public class MeetupApi {
    
    class func listAllMeetups(roomId:Int, resultObj:@escaping (ListAllMeetupsModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/meetup/get_all"
        var data:[String:Any];
        
        data = ["roomId": roomId, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllMeetupsModel>) in
            
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
    
    class func listAllMeetups(email:String, resultObj:@escaping (ListAllMeetupsModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/meetup/get_all_by_email"
        var data:[String:Any];
        
        data = ["email": email, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllMeetupsModel>) in
            
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
 
    
    class func addMeetupPoint(email:String, title:String, subtitle:String, roomId:Int, longitude:Float, latitude:Float,
                              metadata:JSON?, isGlobal:Int, resultObj:@escaping (AddMeetupModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/meetup/add_by_email"
        var data:[String:Any];
        
        data = ["email": email, "title": title, "subtitle": subtitle, "roomId": roomId, "longitude": longitude, "latitude": latitude, "isGlobal": "\(isGlobal)" , "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        if (metadata != nil) {
            data["metadata"] = metadata
        }
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<AddMeetupModel>) in
            
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
    
    
    class func updateMeetupPoint(meetupId:Int, longitude:Float, latitude:Float,
                              metadata:JSON?, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/meetup/update_by_id"
        var data:[String:Any];
        
        data = ["meetupId": meetupId, "longitude": longitude, "latitude": latitude, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
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
    
    class func disableMeetupPoint(meetupId:Int, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/meetup/disable"
        var data:[String:Any];
        
        data = ["meetupId": meetupId, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
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
