//
//  RoundsRepository.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

protocol RoundsRepository {
    func getRounds(gameId: Int) async -> Result<[Round], NetworkError>
}

struct RoundsWebRepository: RoundsRepository {
    func getRounds(gameId: Int) async -> Result<[Round], NetworkError> {
        let result = await HTTPManager.shared.getRounds(gameId: gameId)
        switch result {
            case .success(let data):
                let rounds = Parser.parseGetRounds(JSONData: data)
                return .success(rounds)
            case .failure(let error):
                return .failure(error)
        }
    }
}

class MockRoundsRepository: RoundsRepository {
    func getRounds(gameId: Int) async -> Result<[Round], NetworkError> {
        return .success(Round.activeFixtures(count: 20))
    }
}
