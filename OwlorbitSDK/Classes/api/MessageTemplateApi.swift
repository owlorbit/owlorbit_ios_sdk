
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

public class MessageTemplateApi {
    
    class func listMessageTemplates(resultObj:@escaping (ListAllMessageTemplateModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/message_template/view"
        var data:[String:Any];
        
        data = ["publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllMessageTemplateModel>) in
            
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
    
    class func createMessageTemplates(choices:NSMutableArray, templateName:String, groupId:Int?, resultObj:@escaping (AddMessageTemplateModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/message_template/create"
        var data:[String:Any];
        
        data = ["choices": choices, "templateName":  templateName, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        if (groupId != nil) {
            data["groupId"] = groupId
        }
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<AddMessageTemplateModel>) in
            
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
    
    class func updateMessageTemplates(messageTemplateId:Int, choices:NSMutableArray, templateName:String, groupId:Int?, resultObj:@escaping (UpdateMessageTemplateModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/message_template/update"
        var data:[String:Any];
        
        data = ["messageTemplateId":messageTemplateId, "choices": choices, "templateName":  templateName, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        if (groupId != nil) {
            data["groupId"] = groupId
        }
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<UpdateMessageTemplateModel>) in
            
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
