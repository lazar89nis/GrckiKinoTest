//
//  GameDependency.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

protocol GameInjectable: Injectable {
    func gameViewModel(round: Round) -> GameViewModel
    func playViewModel(round: Round) -> PlayViewModel
    func playTableViewModel() -> PlayTableViewModel
    func resultsViewModel() -> ResultsViewModel
}

final class GameDependency: GameInjectable {
    
    private let gameRepository: GameRepository
    
    init() {
        self.gameRepository = GameWebRepository()
    }
    
    func gameViewModel(round: Round) -> GameViewModel {
        GameViewModel(selectedRound: round)
    }
    
    func playViewModel(round: Round) -> PlayViewModel {
        PlayViewModel(selectedRound: round)
    }
    
    func playTableViewModel() -> PlayTableViewModel {
        PlayTableViewModel()
    }
    
    func resultsViewModel() -> ResultsViewModel {
        ResultsViewModel(repository: gameRepository)
    }
    
    
}
