//
//  Round+Fixture.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

extension Round {
    static func fixture() -> Round {
        Round(gameId: Config.gameId, drawId: 1107394, drawTime: 1721478900000, winningNumbers: [70, 40, 20, 56, 34, 3, 46, 12, 47, 17, 62, 79, 69, 5, 55, 75, 67, 72, 23, 60])
    }

    static func fixtures() -> [Round] {
        [Round(gameId: Config.gameId, drawId: 1107394, drawTime: 1721409900000, winningNumbers: [70, 40, 20, 56, 34, 3, 46, 12, 47, 17, 62, 79, 69, 5, 55, 75, 67, 72, 23, 60]),
         Round(gameId: Config.gameId, drawId: 1107395, drawTime: 1721397900000, winningNumbers: [70, 40, 20, 56, 34, 3, 46, 12, 47, 17, 62, 79, 69, 5, 55, 75, 67, 72, 23, 60]),
         Round(gameId: Config.gameId, drawId: 1107396, drawTime: 1721398200000, winningNumbers: [70, 40, 20, 56, 34, 3, 46, 12, 47, 17, 62, 79, 69, 5, 55, 75, 67, 72, 23, 60]),
         Round(gameId: Config.gameId, drawId: 1107397, drawTime: 1721398500000, winningNumbers: [70, 40, 20, 56, 34, 3, 46, 12, 47, 17, 62, 79, 69, 5, 55, 75, 67, 72, 23, 60]),
         Round(gameId: Config.gameId, drawId: 1107398, drawTime: 1721398800000, winningNumbers: [70, 40, 20, 56, 34, 3, 46, 12, 47, 17, 62, 79, 69, 5, 55, 75, 67, 72, 23, 60])]
    }
}
