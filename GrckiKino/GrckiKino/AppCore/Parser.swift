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
        let json:JSON = {
            do {
                if let jsonData = JSONData
                {
                    return try JSON(data: jsonData)
                }
                return JSON()
            }
            catch let error
            {
                print(error.localizedDescription)
                return JSON()
            }
        }()
        return json
    }
    
    static func printResponse(JSONData: Data?) {
        let json:JSON = getJSONFromData(JSONData)
        print(json)
    }
    
    static func parseGetRounds(JSONData: Data?) -> [Round] {
        var rounds: [Round] = []
        
        let json:JSON = getJSONFromData(JSONData)
        
        for (_,subJson):(String, JSON) in json {
            let gameId = subJson["gameId"].intValue
            let drawId = subJson["drawId"].intValue
            let drawTime = subJson["drawTime"].intValue
            rounds.append(Round(gameId: gameId, drawId: drawId, drawTime: drawTime))
        }
        
        return rounds
    }
}
