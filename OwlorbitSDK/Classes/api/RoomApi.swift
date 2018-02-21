
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

public class RoomApi {
    
    
    class func listAllRooms(resultObj:@escaping (ListAllRoomsModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/room/get_rooms_in_domain"
        var data:[String:String];
        
        data = ["publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllRoomsModel>) in
            
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
    
    
    class func getRoomsByEmail(email:String, resultObj:@escaping (ListAllRoomsModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/room/get_rooms_by_email"
        var data:[String:Any];
        
        data = ["email": email, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllRoomsModel>) in
            
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
    
    class func joinRoom(roomId:Int, email:String, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/room/join_room_by_email"
        var data:[String:Any];
        
        data = ["roomId" : "\(roomId)", "email": email, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<BaseApiResponseModel>) in
            
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

    class func createRoom(userIds:NSMutableArray, email:String, name:String, isFriendsOnly:Int, isPublic:Int, messageTemplateId:Int, resultObj:@escaping (AddRoomModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/room/create"
        var data:[String:Any];
                
        data = ["userIds" : userIds, "email": email,  "name":name, "isFriendsOnly": isFriendsOnly, "isPublic":isPublic, "messageTemplateId" : messageTemplateId, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
    
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<AddRoomModel>) in
            
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
    
    
    class func createRoom(userIds:NSMutableArray, email:String, name:String, isFriendsOnly:Int, isPublic:Int, resultObj:@escaping (AddRoomModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/room/create"
        var data:[String:Any];
        
        data = ["userIds" : userIds, "email": email, "name":name, "isFriendsOnly": isFriendsOnly, "isPublic":isPublic, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
    
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<AddRoomModel>) in
            
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
