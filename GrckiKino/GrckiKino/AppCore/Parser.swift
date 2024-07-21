//
//  Parser.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation
import SwiftyJSON

class Parser {
    static func getJSONFromData(_ JSONData: Data?) -> JSON {
        guard let jsonData = JSONData else {
            return JSON()
        }
        do {
            return try JSON(data: jsonData)
        } catch {
            print("Error parsing JSON: \(error.localizedDescription)")
            return JSON()
        }
    }
    
    static func printResponse(JSONData: Data?) {
        let json:JSON = getJSONFromData(JSONData)
        print(json)
    }
    
    static func parseGetRounds(JSONData: Data?) -> [Round] {
        let json = getJSONFromData(JSONData)
        return json.arrayValue.map { subJson in
            let gameId = subJson["gameId"].intValue
            let drawId = subJson["drawId"].intValue
            let drawTime = subJson["drawTime"].intValue
            return Round(gameId: gameId, drawId: drawId, drawTime: drawTime)
        }
    }
    
    static func parseGetResults(JSONData: Data?) -> [Round] {
        let json = getJSONFromData(JSONData)
        return json["content"].arrayValue.map { subJson in
            let gameId = subJson["gameId"].intValue
            let drawId = subJson["drawId"].intValue
            let drawTime = subJson["drawTime"].intValue
            let winningNumbers = subJson["winningNumbers"]["list"].arrayValue.map { $0.intValue }
            return Round(gameId: gameId, drawId: drawId, drawTime: drawTime, winningNumbers: winningNumbers)
        }
    }
}
