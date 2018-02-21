
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

public class PollApi {
    
    class func listAllRunningPolls(resultObj:@escaping (ListAllPollsModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/polling/get_all_running"
        var data:[String:Any];
        
        data = ["publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllPollsModel>) in
            
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
    
    class func listAllPollChoices(pollingId:Int, resultObj:@escaping (ListAllPollChoicesModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/polling/get_choices_by_id"
        var data:[String:Any];
        
        data = ["pollingId": pollingId, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllPollChoicesModel>) in
            
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
    
    class func listAllPollResponses(pollingChoiceId:Int, resultObj:@escaping (ListAllPollResponsesModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/polling/get_responses"
        var data:[String:Any];
        
        data = ["pollingChoiceId": pollingChoiceId, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<ListAllPollResponsesModel>) in
            
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
    
    
    class func createPoll(choices:NSMutableArray, question:String, groupId:Int?, manualLocationEnabled:Int, resultObj:@escaping (AddPollModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/polling/create"
        var data:[String:Any];
        
        data = ["choices": choices, "question":question, "manualLocationEnabled": manualLocationEnabled, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]
        
        if (groupId != nil) {
            data["groupId"] = groupId;
        }
        
        Alamofire.request(url, method: .post, parameters: data, encoding: URLEncoding.default, headers: [:]).responseObject {
            (response: DataResponse<AddPollModel>) in
            
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
    
    class func sendPollResponse(pollingId:Int, email:String, choiceId:Int, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) -> Void {
        
        let url:String = ProjectConstants.ApiBaseUrl.value + "/polling/submit_choice"
        var data:[String:Any];
        
        data = ["pollingId":pollingId, "email":email, "choiceId": choiceId, "publicKey": ApiSharedHelper.sharedInstance.publicKey, "encryptedSession" : ApiSharedHelper.sharedInstance.encryptedSession, "sessionHash" : ApiSharedHelper.sharedInstance.sessionHash]

        
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
