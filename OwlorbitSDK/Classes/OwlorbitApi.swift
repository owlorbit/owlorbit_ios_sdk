//
//  OwlorbitApi.swift
//  OwlorbitSDK
//
//  Created by Timmy Nguyen on 2/8/18.
//  Copyright © 2018 Tim Nuwin. All rights reserved.
//

import Foundation
import SwiftyJSON


public class OwlorbitApi {
    
    
    init(publicKey:String, encryptedSession:String, sessionHash:String) {
        ApiSharedHelper.sharedInstance.setValues(publicKey: publicKey, encryptedSession: encryptedSession, sessionHash: sessionHash)               
    }
    
    public func listAllUsers(resultObj:@escaping (ListAllUserModel) -> Void, error:@escaping (String)->Void) {
        UserApi.listAllUsers(resultObj:resultObj, error:error);
    }
    
    public func doesEmailExist(email:String, domain: String, resultObj:@escaping (DoesEmailExist) -> Void, error:@escaping (String)->Void) {
        UserApi.doesEmailExist(email: email, domain: domain, resultObj: resultObj, error: error);
    }
    
    public func addUserToDomain(email:String, password:String, firstName:String, lastName:String, phoneNumber:String, resultObj:@escaping (AddUserDomainModel) -> Void, error:@escaping (String)->Void) {
        UserApi.addUserToDomain(email: email, password: password, firstName: firstName, lastName: lastName, phoneNumber: phoneNumber, resultObj: resultObj, error: error);
    }
    
    //Room API CALLS
    public func listAllRooms(resultObj:@escaping (ListAllRoomsModel) -> Void, error:@escaping (String)->Void) {
        RoomApi.listAllRooms(resultObj:resultObj, error:error);
    }
    
    public func getRoomsByEmail(email:String, resultObj:@escaping (ListAllRoomsModel) -> Void, error:@escaping (String)->Void) {
        RoomApi.getRoomsByEmail(email: email, resultObj:resultObj, error:error);
    }
    
    public func joinRoomByEmail(roomId:Int, email:String, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) {
        RoomApi.joinRoom(roomId: roomId, email: email, resultObj:resultObj, error:error);
    }
    
    public func createRoom(userIds:NSMutableArray, email:String, name:String, isFriendsOnly:Int, isPublic:Int, messageTemplateId:Int, resultObj:@escaping (AddRoomModel) -> Void, error:@escaping (String)->Void) {
        RoomApi.createRoom(userIds: userIds, email: email, name: name, isFriendsOnly: isFriendsOnly, isPublic: isPublic, messageTemplateId: messageTemplateId, resultObj:resultObj, error:error);
    }
    
    public func createRoom(userIds:NSMutableArray, email:String, name:String, isFriendsOnly:Int, isPublic:Int, resultObj:@escaping (AddRoomModel) -> Void, error:@escaping (String)->Void) {
        RoomApi.createRoom(userIds: userIds, email: email, name: name, isFriendsOnly: isFriendsOnly, isPublic: isPublic, resultObj:resultObj, error:error);
    }
    
    //Locations
    
    public func listAllLocations(resultObj:@escaping (ListAllLocationModel) -> Void, error:@escaping (String)->Void) {
        LocationApi.listAllLocations(resultObj:resultObj, error:error);
    }
    
    public func listAllLocations(email:String, resultObj:@escaping (ListAllLocationModel) -> Void, error:@escaping (String)->Void) {
        LocationApi.listAllLocationsByEmail(email: email, resultObj:resultObj, error:error);
    }
    
    public func listAllLocations(roomId:Int, resultObj:@escaping (ListAllLocationModel) -> Void, error:@escaping (String)->Void) {
        LocationApi.listAllLocationsByRoom(roomId: roomId, resultObj:resultObj, error:error);
    }
    
    public func addLocationByEmail(email:String, longitude:Float, latitude:Float, altitude:Float?, metadata:JSON?, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) {
        LocationApi.addLocationByEmail(email: email, longitude: longitude, latitude: latitude, altitude: altitude, metadata: metadata, resultObj:resultObj, error:error);
    }
        
    public func listAllGroups(resultObj:@escaping (ListAllGroupsModel) -> Void, error:@escaping (String)->Void) {
        GroupApi.listAllGroups(resultObj:resultObj, error:error);
    }
    
    public func createGroup(groupName:String, usersAdded:NSMutableArray, resultObj:@escaping (AddGroupDomainModel) -> Void, error:@escaping (String)->Void) {
        GroupApi.createGroup(groupName: groupName, usersAdded: usersAdded, resultObj:resultObj, error:error);
    }
    
    public func updateGroup(groupId:Int, usersAdded:NSMutableArray, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) {
        GroupApi.updateGroup(groupId: groupId, usersAdded: usersAdded, resultObj:resultObj, error:error);
    }
    
    //meetup
    public func listAllMeetupsInRoom(roomId:Int, resultObj:@escaping (ListAllMeetupsModel) -> Void, error:@escaping (String)->Void) {
        MeetupApi.listAllMeetups(roomId: roomId, resultObj:resultObj, error:error);
    }
    
    public func listAllMeetupsByEmail(email:String, resultObj:@escaping (ListAllMeetupsModel) -> Void, error:@escaping (String)->Void) {
        MeetupApi.listAllMeetups(email: email, resultObj:resultObj, error:error);
    }
    
    public func addMeetup(email:String, title:String, subtitle:String, roomId:Int, longitude:Float, latitude:Float,
                          metadata:JSON?, isGlobal:Int, resultObj:@escaping (AddMeetupModel) -> Void, error:@escaping (String)->Void) {
        MeetupApi.addMeetupPoint(email: email, title: title, subtitle: subtitle, roomId: roomId, longitude: longitude, latitude: latitude, metadata: metadata, isGlobal: isGlobal, resultObj:resultObj, error:error);
    }
    
    public func updateMeetup(meetupId:Int, longitude:Float, latitude:Float, metadata:JSON?, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) {
        MeetupApi.updateMeetupPoint(meetupId: meetupId, longitude: longitude, latitude: latitude, metadata: metadata, resultObj:resultObj, error:error);
    }
    
    public func disableMeetup(meetupId:Int, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) {
        MeetupApi.disableMeetupPoint(meetupId: meetupId, resultObj:resultObj, error:error);
    }
    
    //messages
    public func listMessagesInRoom(roomId:Int, pageIndex:Int, resultObj:@escaping (ListMessageModel) -> Void, error:@escaping (String)->Void) {
        MessageApi.listMessages(roomId: roomId, pageIndex: pageIndex, resultObj:resultObj, error:error);
    }
    
    public func sendMessage(roomId:Int, message:String, resultObj:@escaping (AddMessageModel) -> Void, error:@escaping (String)->Void) {
        MessageApi.sendMessage(roomId: roomId, message:message, resultObj:resultObj, error:error);
    }
    
    public func sendMessage(roomId:Int, message:String, email:String, resultObj:@escaping (AddMessageModel) -> Void, error:@escaping (String)->Void) {
        MessageApi.sendMessage(roomId: roomId, message:message, email:email, resultObj:resultObj, error:error);
    }
    
    //message templates
    public func listMessageTemplates(resultObj:@escaping (ListAllMessageTemplateModel) -> Void, error:@escaping (String)->Void) {
        MessageTemplateApi.listMessageTemplates(resultObj:resultObj, error:error);
    }
    
    public func createMessageTemplates(choices:NSMutableArray, templateName:String, groupId:Int?, resultObj:@escaping (AddMessageTemplateModel) -> Void, error:@escaping (String)->Void) {
        MessageTemplateApi.createMessageTemplates(choices: choices, templateName: templateName, groupId: groupId, resultObj:resultObj, error:error);
    }
    
    public func updateMessageTemplates(messageTemplateId:Int, choices:NSMutableArray, templateName:String, groupId:Int?, resultObj:@escaping (UpdateMessageTemplateModel) -> Void, error:@escaping (String)->Void) {
        MessageTemplateApi.updateMessageTemplates(messageTemplateId:messageTemplateId, choices: choices, templateName: templateName, groupId: groupId, resultObj:resultObj, error:error);
    }
    
    //Polls
    
    public func listAllRunningPolls(resultObj:@escaping (ListAllPollsModel) -> Void, error:@escaping (String)->Void) {
        PollApi.listAllRunningPolls(resultObj:resultObj, error:error);
    }
    
    public func listAllPollChoices(pollingId:Int, resultObj:@escaping (ListAllPollChoicesModel) -> Void, error:@escaping (String)->Void) {
        PollApi.listAllPollChoices(pollingId: pollingId, resultObj:resultObj, error:error);
    }
    
    public func listAllPollResponses(pollingChoiceId:Int, resultObj:@escaping (ListAllPollResponsesModel) -> Void, error:@escaping (String)->Void) {
        PollApi.listAllPollResponses(pollingChoiceId: pollingChoiceId, resultObj:resultObj, error:error);
    }
    
    public func createPoll(choices:NSMutableArray, question:String, sendUtc:String?, groupId:Int?, manualLocationEnabled:Int, resultObj:@escaping (AddPollModel) -> Void, error:@escaping (String)->Void) {
        PollApi.createPoll(choices: choices, question: question, sendUtc: sendUtc, groupId: groupId, manualLocationEnabled: manualLocationEnabled, resultObj:resultObj, error:error);
    }
    
    public func cancelPoll(pollingId:Int, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) {
        PollApi.cancel(pollingId: pollingId, resultObj:resultObj, error:error);
    }
    
    public func sendPollResponse(pollingId:Int, email:String, choiceId:Int, resultObj:@escaping (BaseApiResponseModel) -> Void, error:@escaping (String)->Void) {
        PollApi.sendPollResponse(pollingId: pollingId, email:email, choiceId: choiceId, resultObj:resultObj, error:error);
    }
}
