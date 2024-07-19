//
//  Round+Fixture.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

extension Round {
    static func fixture() -> Round {
        Round(gameId: Config.gameId, drawId: 1107394, drawTime: 1721397900000)
    }

    static func fixtures() -> [Round] {
        [Round(gameId: Config.gameId, drawId: 1107394, drawTime: 1721409900000),
         Round(gameId: Config.gameId, drawId: 1107395, drawTime: 1721397900000),
         Round(gameId: Config.gameId, drawId: 1107396, drawTime: 1721398200000),
         Round(gameId: Config.gameId, drawId: 1107397, drawTime: 1721398500000),
         Round(gameId: Config.gameId, drawId: 1107398, drawTime: 1721398800000)]
    }
}
