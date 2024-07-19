//
//  Round.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

class Round: CustomStringConvertible {
    var gameId: Int
    var drawId: Int
    var drawTime: Int
    var drawTimeDate: Date
    
    
    init(gameId: Int, drawId: Int, drawTime: Int) {
        self.gameId = gameId
        self.drawId = drawId
        self.drawTime = drawTime
        self.drawTimeDate =  Date(timeIntervalSince1970: TimeInterval(drawTime/1000))
    }
    
    var description: String {
        return "Round --> gameId:\(gameId), drawId:\(drawId), drawTime:\(drawTime), drawTimeDate:\(drawTimeDate)"
    }
}
