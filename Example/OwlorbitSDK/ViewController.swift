//
//  ViewController.swift
//  OwlorbitSDK
//
//  Created by civilordergone on 02/12/2018.
//  Copyright (c) 2018 civilordergone. All rights reserved.
//

import UIKit
import SwiftyJSON
import OwlorbitSDK
import ObjectMapper


class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var owlorbit : OwlorbitSDK?;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        owlorbit = OwlorbitSDK(publicKey:"", encryptedSession:"", sessionHash:"")
        createButtons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func createButtons() {
        
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        var px = 0
        var py = 0
        
        
        let titleUsers = UILabel()
        titleUsers.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        titleUsers.text = "User Actions"
        scrollView.addSubview(titleUsers)
        py = py + 45 + 20
        
        
        let Button = UIButton()
        Button.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        Button.backgroundColor = UIColor.blue
        Button.setTitle("List All Users ", for: .normal)
        Button.addTarget(self, action: #selector(listAllUsers), for: .touchUpInside)
        scrollView.addSubview(Button)
        py = py + 45 + 20
        
        
        let doesEmailExistBtn = UIButton()
        doesEmailExistBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        doesEmailExistBtn.backgroundColor = UIColor.blue
        doesEmailExistBtn.setTitle("Does Email Exist ", for: .normal)
        doesEmailExistBtn.addTarget(self, action: #selector(doesEmailExist), for: .touchUpInside)
        scrollView.addSubview(doesEmailExistBtn	)
        py = py + 45 + 20
        
        let addUserBtn = UIButton()
        addUserBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        addUserBtn.backgroundColor = UIColor.blue
        addUserBtn.setTitle("Add User to Domain ", for: .normal)
        addUserBtn.addTarget(self, action: #selector(addUserToDomain), for: .touchUpInside)
        scrollView.addSubview(addUserBtn)
        py = py + 45 + 20
        
        
        let titleRooms = UILabel()
        titleRooms.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        titleRooms.text = "Room Actions"
        scrollView.addSubview(titleRooms)
        py = py + 45 + 20
        
        
        let listRoomsBtn = UIButton()
        listRoomsBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        listRoomsBtn.backgroundColor = UIColor.blue
        listRoomsBtn.setTitle("List All Rooms ", for: .normal)
        listRoomsBtn.addTarget(self, action: #selector(listAllRooms), for: .touchUpInside)
        scrollView.addSubview(listRoomsBtn)
        py = py + 45 + 20
        
        let listRoomsByEmailBtn = UIButton()
        listRoomsByEmailBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        listRoomsByEmailBtn.backgroundColor = UIColor.blue
        listRoomsByEmailBtn.setTitle("List All Rooms by Email ", for: .normal)
        listRoomsByEmailBtn.addTarget(self, action: #selector(getRoomsByEmail), for: .touchUpInside)
        scrollView.addSubview(listRoomsByEmailBtn)
        py = py + 45 + 20
        
        let joinRoomByEmailBtn = UIButton()
        joinRoomByEmailBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        joinRoomByEmailBtn.backgroundColor = UIColor.blue
        joinRoomByEmailBtn.setTitle("Join room by email ", for: .normal)
        joinRoomByEmailBtn.addTarget(self, action: #selector(joinRoomByEmail), for: .touchUpInside)
        scrollView.addSubview(joinRoomByEmailBtn)
        py = py + 45 + 20
        
        
        let createRoomBtn = UIButton()
        createRoomBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        createRoomBtn.backgroundColor = UIColor.blue
        createRoomBtn.setTitle("Create Room ", for: .normal)
        createRoomBtn.addTarget(self, action: #selector(createRoom), for: .touchUpInside)
        scrollView.addSubview(createRoomBtn)
        py = py + 45 + 20
        
        let createRoomWithTemplateBtn = UIButton()
        createRoomWithTemplateBtn.frame = CGRect(x: px+10, y: py+10, width: 250, height: 45)
        createRoomWithTemplateBtn.backgroundColor = UIColor.blue
        createRoomWithTemplateBtn.setTitle("Create Room with Template ", for: .normal)
        createRoomWithTemplateBtn.addTarget(self, action: #selector(createRoomWithTemplate), for: .touchUpInside)
        scrollView.addSubview(createRoomWithTemplateBtn)
        py = py + 45 + 20
        
        let titleLocation = UILabel()
        titleLocation.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        titleLocation.text = "Location Actions"
        scrollView.addSubview(titleLocation)
        py = py + 45 + 20
        
        let locationBtn = UIButton()
        locationBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        locationBtn.backgroundColor = UIColor.blue
        locationBtn.setTitle("List Locations ", for: .normal)
        locationBtn.addTarget(self, action: #selector(listLocations), for: .touchUpInside)
        scrollView.addSubview(locationBtn)
        py = py + 45 + 20
        
        let locationEmailBtn = UIButton()
        locationEmailBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        locationEmailBtn.backgroundColor = UIColor.blue
        locationEmailBtn.setTitle("List Location of Email ", for: .normal)
        locationEmailBtn.addTarget(self, action: #selector(listLocationsOfEmail), for: .touchUpInside)
        scrollView.addSubview(locationEmailBtn)
        py = py + 45 + 20
        
        let locationRoomIdBtn = UIButton()
        locationRoomIdBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        locationRoomIdBtn.backgroundColor = UIColor.blue
        locationRoomIdBtn.setTitle("List Location of Room ", for: .normal)
        locationRoomIdBtn.addTarget(self, action: #selector(listLocationsByRoom), for: .touchUpInside)
        scrollView.addSubview(locationRoomIdBtn)
        py = py + 45 + 20
        
        let addLocationBtn = UIButton()
        addLocationBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        addLocationBtn.backgroundColor = UIColor.blue
        addLocationBtn.setTitle("Add Location ", for: .normal)
        addLocationBtn.addTarget(self, action: #selector(addLocation), for: .touchUpInside)
        scrollView.addSubview(addLocationBtn)
        py = py + 45 + 20
        
        
        let titleGroup = UILabel()
        titleGroup.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        titleGroup.text = "Group Actions"
        scrollView.addSubview(titleGroup)
        py = py + 45 + 20
        
        
        let listGroupBtn = UIButton()
        listGroupBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        listGroupBtn.backgroundColor = UIColor.blue
        listGroupBtn.setTitle("List All Groups ", for: .normal)
        listGroupBtn.addTarget(self, action: #selector(listAllGroups), for: .touchUpInside)
        scrollView.addSubview(listGroupBtn)
        py = py + 45 + 20
        
        let addGroupBtn = UIButton()
        addGroupBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        addGroupBtn.backgroundColor = UIColor.blue
        addGroupBtn.setTitle("Add Group ", for: .normal)
        addGroupBtn.addTarget(self, action: #selector(addGroup), for: .touchUpInside)
        scrollView.addSubview(addGroupBtn)
        py = py + 45 + 20
        
        let updateGroupBtn = UIButton()
        updateGroupBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        updateGroupBtn.backgroundColor = UIColor.blue
        updateGroupBtn.setTitle("Update Group ", for: .normal)
        updateGroupBtn.addTarget(self, action: #selector(updateGroup), for: .touchUpInside)
        scrollView.addSubview(updateGroupBtn)
        py = py + 45 + 20
        
        
        let titleMeetups = UILabel()
        titleMeetups.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        titleMeetups.text = "Meetup Actions"
        scrollView.addSubview(titleMeetups)
        py = py + 45 + 20
        
        let meetupsInRoomBtn = UIButton()
        meetupsInRoomBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        meetupsInRoomBtn.backgroundColor = UIColor.blue
        meetupsInRoomBtn.setTitle("List Meetups in Room ", for: .normal)
        meetupsInRoomBtn.addTarget(self, action: #selector(listMeetupsInRoom), for: .touchUpInside)
        scrollView.addSubview(meetupsInRoomBtn)
        py = py + 45 + 20
        
        let meetupsByEmailBtn = UIButton()
        meetupsByEmailBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        meetupsByEmailBtn.backgroundColor = UIColor.blue
        meetupsByEmailBtn.setTitle("List Meetups by Email ", for: .normal)
        meetupsByEmailBtn.addTarget(self, action: #selector(listMeetsupByEmail), for: .touchUpInside)
        scrollView.addSubview(meetupsByEmailBtn)
        py = py + 45 + 20

        let addMeetupBtn = UIButton()
        addMeetupBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        addMeetupBtn.backgroundColor = UIColor.blue
        addMeetupBtn.setTitle("Add Meetup ", for: .normal)
        addMeetupBtn.addTarget(self, action: #selector(addMeetup), for: .touchUpInside)
        scrollView.addSubview(addMeetupBtn)
        py = py + 45 + 20
        
        let updateMeetupBtn = UIButton()
        updateMeetupBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        updateMeetupBtn.backgroundColor = UIColor.blue
        updateMeetupBtn.setTitle("Update Meetup ", for: .normal)
        updateMeetupBtn.addTarget(self, action: #selector(updateMeetup), for: .touchUpInside)
        scrollView.addSubview(updateMeetupBtn)
        py = py + 45 + 20
        
        let disableMeetupBtn = UIButton()
        disableMeetupBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        disableMeetupBtn.backgroundColor = UIColor.blue
        disableMeetupBtn.setTitle("Disable Meetup ", for: .normal)
        disableMeetupBtn.addTarget(self, action: #selector(disableMeetup), for: .touchUpInside)
        scrollView.addSubview(disableMeetupBtn)
        py = py + 45 + 20
        
        let titleMessage = UILabel()
        titleMessage.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        titleMessage.text = "Messages Actions"
        scrollView.addSubview(titleMessage)
        py = py + 45 + 20
        
        let listMessagesBtn = UIButton()
        listMessagesBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        listMessagesBtn.backgroundColor = UIColor.blue
        listMessagesBtn.setTitle("List Messages ", for: .normal)
        listMessagesBtn.addTarget(self, action: #selector(listMessagesInRoom), for: .touchUpInside)
        scrollView.addSubview(listMessagesBtn)
        py = py + 45 + 20
        
        let sendMessagesBtn = UIButton()
        sendMessagesBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        sendMessagesBtn.backgroundColor = UIColor.blue
        sendMessagesBtn.setTitle("Send Message ", for: .normal)
        sendMessagesBtn.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        scrollView.addSubview(sendMessagesBtn)
        py = py + 45 + 20
        
        let sendMessageEmailBtn = UIButton()
        sendMessageEmailBtn.frame = CGRect(x: px+10, y: py+10, width: 250, height: 45)
        sendMessageEmailBtn.backgroundColor = UIColor.blue
        sendMessageEmailBtn.setTitle("Send Message by Email ", for: .normal)
        sendMessageEmailBtn.addTarget(self, action: #selector(sendMessageByEmail), for: .touchUpInside)
        scrollView.addSubview(sendMessageEmailBtn)
        py = py + 45 + 20
        
        let titleMessageTemplate = UILabel()
        titleMessageTemplate.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        titleMessageTemplate.text = "Message Templates"
        scrollView.addSubview(titleMessageTemplate)
        py = py + 45 + 20
        
        
        let listMessageTemplatesBtn = UIButton()
        listMessageTemplatesBtn.frame = CGRect(x: px+10, y: py+10, width: 250, height: 45)
        listMessageTemplatesBtn.backgroundColor = UIColor.blue
        listMessageTemplatesBtn.setTitle("List Message Templates ", for: .normal)
        listMessageTemplatesBtn.addTarget(self, action: #selector(listMessageTemplates), for: .touchUpInside)
        scrollView.addSubview(listMessageTemplatesBtn)
        py = py + 45 + 20
        
        let createMessageTemplateBtn = UIButton()
        createMessageTemplateBtn.frame = CGRect(x: px+10, y: py+10, width: 250, height: 45)
        createMessageTemplateBtn.backgroundColor = UIColor.blue
        createMessageTemplateBtn.setTitle("Create Message Template ", for: .normal)
        createMessageTemplateBtn.addTarget(self, action: #selector(createMessageTemplate), for: .touchUpInside)
        scrollView.addSubview(createMessageTemplateBtn)
        py = py + 45 + 20
        
        let updateMessageTemplateBtn = UIButton()
        updateMessageTemplateBtn.frame = CGRect(x: px+10, y: py+10, width: 250, height: 45)
        updateMessageTemplateBtn.backgroundColor = UIColor.blue
        updateMessageTemplateBtn.setTitle("Update Message Template ", for: .normal)
        updateMessageTemplateBtn.addTarget(self, action: #selector(updateMessageTemplate), for: .touchUpInside)
        scrollView.addSubview(updateMessageTemplateBtn)
        py = py + 45 + 20
        
        
        let titlePolls = UILabel()
        titlePolls.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        titlePolls.text = "Polls"
        scrollView.addSubview(titlePolls)
        py = py + 45 + 20
        
        let listAllPollsBtn = UIButton()
        listAllPollsBtn.frame = CGRect(x: px+10, y: py+10, width: 250, height: 45)
        listAllPollsBtn.backgroundColor = UIColor.blue
        listAllPollsBtn.setTitle("List Running Polls ", for: .normal)
        listAllPollsBtn.addTarget(self, action: #selector(listAllRunningPolls), for: .touchUpInside)
        scrollView.addSubview(listAllPollsBtn)
        py = py + 45 + 20
        
        
        let listAllPollChoicesBtn = UIButton()
        listAllPollChoicesBtn.frame = CGRect(x: px+10, y: py+10, width: 250, height: 45)
        listAllPollChoicesBtn.backgroundColor = UIColor.blue
        listAllPollChoicesBtn.setTitle("List Poll Choices ", for: .normal)
        listAllPollChoicesBtn.addTarget(self, action: #selector(listAllPollChoices), for: .touchUpInside)
        scrollView.addSubview(listAllPollChoicesBtn)
        py = py + 45 + 20
        
        let listAllPollResponseBtn = UIButton()
        listAllPollResponseBtn.frame = CGRect(x: px+10, y: py+10, width: 250, height: 45)
        listAllPollResponseBtn.backgroundColor = UIColor.blue
        listAllPollResponseBtn.setTitle("List Poll Responses ", for: .normal)
        listAllPollResponseBtn.addTarget(self, action: #selector(listAllPollResponses), for: .touchUpInside)
        scrollView.addSubview(listAllPollResponseBtn)
        py = py + 45 + 20

        let sendPollBtn = UIButton()
        sendPollBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        sendPollBtn.backgroundColor = UIColor.blue
        sendPollBtn.setTitle("Create Poll ", for: .normal)
        sendPollBtn.addTarget(self, action: #selector(createPoll), for: .touchUpInside)
        scrollView.addSubview(sendPollBtn)
        py = py + 45 + 20
        
        
        let sendFuturePollBtn = UIButton()
        sendFuturePollBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        sendFuturePollBtn.backgroundColor = UIColor.blue
        sendFuturePollBtn.setTitle("Create Future Poll ", for: .normal)
        sendFuturePollBtn.addTarget(self, action: #selector(createFuturePoll), for: .touchUpInside)
        scrollView.addSubview(sendFuturePollBtn)
        py = py + 45 + 20
        
        let cancelPollBtn = UIButton()
        cancelPollBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        cancelPollBtn.backgroundColor = UIColor.blue
        cancelPollBtn.setTitle("Cancel Poll ", for: .normal)
        cancelPollBtn.addTarget(self, action: #selector(cancelPoll), for: .touchUpInside)
        scrollView.addSubview(cancelPollBtn)
        py = py + 45 + 20
        
        let sendPollResponseBtn = UIButton()
        sendPollResponseBtn.frame = CGRect(x: px+10, y: py+10, width: 200, height: 45)
        sendPollResponseBtn.backgroundColor = UIColor.blue
        sendPollResponseBtn.setTitle("Send Poll Response", for: .normal)
        sendPollResponseBtn.addTarget(self, action: #selector(sendPollResponse), for: .touchUpInside)
        scrollView.addSubview(sendPollResponseBtn)
        py = py + 45 + 20
        
        scrollView.contentSize = CGSize(width: px, height: py)
    }

    func listAllUsers() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllUsers(resultObj: {
            (listAllUserModel) in
            
            let arrayJSON:String = Mapper().toJSONString(listAllUserModel, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func doesEmailExist() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.doesEmailExist(email: "test@test.com", domain: "t5", resultObj:{
            (doesEmailExist) in
            
            let arrayJSON:String = Mapper().toJSONString(doesEmailExist, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func addUserToDomain() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.addUserToDomain(email: "test@test.com", password: "test", firstName: "Bob", lastName: "Burger", phoneNumber: "555-123-1234", resultObj: {
            (addUserToDomain) in
            
            let arrayJSON:String = Mapper().toJSONString(addUserToDomain, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func listAllRooms() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllRooms(resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func getRoomsByEmail() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.getRoomsByEmail(email: "test@test.com",resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func joinRoomByEmail() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.joinRoomByEmail(roomId: 224, email: "test@test.com",resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func createRoom() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.createRoom(userIds: [], email: "test@test.com", name: "Test Room from API", isFriendsOnly: 0, isPublic: 0,resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func createRoomWithTemplate() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.createRoom(userIds: [], email: "test@test.com", name: "Test Room from API with Template", isFriendsOnly: 0, isPublic: 0, messageTemplateId: 32,resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func listLocations() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllLocations(resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func listLocationsOfEmail() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllLocations(email: "test@test.com", resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func listLocationsByRoom() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllLocations(roomId: 203, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func addLocation() {
        
        let json:JSON =  JSON(["key":"pair"])
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.addLocationByEmail(email: "tim.nguyen@owlorbit.com", longitude: -71.01, latitude: 42.35, altitude: 1.5, metadata: json, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func listAllGroups() {
                
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllGroups(resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func addGroup(){
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.createGroup(groupName: "Group via API", usersAdded: [682, 685], resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func updateGroup(){
        self.webview.loadHTMLString("Loading...", baseURL: nil)

        owlorbit?.owlorbitApi.updateGroup(groupId: 1, usersAdded: [682], resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }

    func listMeetupsInRoom() {
        
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllMeetupsInRoom(roomId: 201, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func listMeetsupByEmail() {
        
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllMeetupsByEmail(email: "test@test.com", resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func addMeetup() {
        
        let json:JSON =  JSON(["key":"pair"])
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.addMeetup(email: "test@test.com", title: "Meetup Created by API", subtitle: "This is Subtitle", roomId: 222, longitude: 123.2, latitude: 24.0, metadata: json, isGlobal: 0, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }    
    
    func updateMeetup() {

        let json:JSON =  JSON(["key":"pair"])
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.updateMeetup(meetupId: 209, longitude: 131.2, latitude: 24.0, metadata: json, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func disableMeetup() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.disableMeetup(meetupId: 209, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func listMessagesInRoom() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listMessagesInRoom(roomId: 201, pageIndex: 0, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }    
    
    func sendMessage() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.sendMessage(roomId: 201, message: "Message sent by API", resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func sendMessageByEmail() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.sendMessage(roomId: 201, message: "Message send by API with Email", email: "tim.nguyen@owlorbit.com", resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func listMessageTemplates() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listMessageTemplates(resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func createMessageTemplate() {

        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.createMessageTemplates(choices: ["Help", "I'm okay."], templateName: "Template generated by API test", groupId:13, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func updateMessageTemplate() {
        
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.updateMessageTemplates(messageTemplateId: 38, choices: ["Help", "I'm okay."], templateName: "Template generated by API test", groupId:nil, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }


    func listAllRunningPolls() {
        
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllRunningPolls(resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func listAllPollChoices() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllPollChoices(pollingId: 25, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func listAllPollResponses() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.listAllPollResponses(pollingChoiceId: 55, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func createFuturePoll() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.createPoll(choices: ["Yes", "No"], question: "Test Poll from API", sendUtc: "2521402136000", groupId: 13, manualLocationEnabled: 0, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func createPoll() {
        
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.createPoll(choices: ["Yes", "No"], question: "Test Poll from API", sendUtc: nil, groupId: 13, manualLocationEnabled: 0, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func cancelPoll() {
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.cancelPoll(pollingId: 44, resultObj: {
            (obj) in

            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    func sendPollResponse() {
        
        self.webview.loadHTMLString("Loading...", baseURL: nil)
        owlorbit?.owlorbitApi.sendPollResponse(pollingId: 25, email: "test@test.com", choiceId: 55, resultObj: {
            (obj) in
            
            let arrayJSON:String = Mapper().toJSONString(obj, prettyPrint: true)!
            self.webview.loadHTMLString(arrayJSON, baseURL: nil)
            
        }, error: {
            (err) in
            self.webview.loadHTMLString(err, baseURL: nil)
        })
    }
    
    //sendPollResponse
    
    
}

