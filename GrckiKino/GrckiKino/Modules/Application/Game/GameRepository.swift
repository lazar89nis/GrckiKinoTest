//
//  GameRepository.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

protocol GameRepository {
    func getResults(gameId: Int, fromDate: String, toDate: String) async -> Result<[Round], NetworkError>
}

struct GameWebRepository: GameRepository {
    func getResults(gameId: Int, fromDate: String, toDate: String) async -> Result<[Round], NetworkError> {
        let result = await HTTPManager.shared.getResults(gameId: gameId, fromDate: fromDate, toDate: toDate)
        switch result {
            case .success(let data):
                let rounds = Parser.parseGetResults(JSONData: data)
                return .success(rounds)
            case .failure(let error):
                return .failure(error)
        }
    }
}

class MockGameRepository: GameRepository {
    func getResults(gameId: Int, fromDate: String, toDate: String) async -> Result<[Round], NetworkError> {
        return .success(Round.fixtures())
    }
}
