//
//  SocketService.swift
//  Smack
//
//  Created by Admin on 24.09.2018.
//  Copyright © 2018 vocabularity. All rights reserved.
//

import UIKit
import SocketIO

class SocketService: NSObject {
    
    static let instance = SocketService()
    
    override init() {
        super.init()
    }
    
    
//    var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
//
//    let socketManager = SocketManager(socketURL: URL(string: BASE_URL)!)
    
    let manager = SocketManager(socketURL: URL(string: BASE_URL)!)
    
    
    
    func establishConnection() {
        let socket = manager.defaultSocket
        socket.connect()
    }
    
    func closeConnection() {
        let socket = manager.defaultSocket
        socket.disconnect()
    }
    
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler) {
        let socket = manager.defaultSocket
        socket.emit("newChannel", channelName, channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler) {
        let socket = manager.defaultSocket
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDesc = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            
            let newChannel = Channel(channelTitle: channelName, channelDescription: channelDesc, id: channelId)
            MessageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
}
