//
//  RoundsViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

@Observable class RoundsViewModel {
        
    var isGameViewPresented = false
    var selectedRound: Round?
    
    var rounds: [Round] = []
    private var repository: RoundsRepository
    
    init(repository: RoundsRepository) {
        self.repository = repository
    }
    
    func loadRounds() async  {
        let res = await repository.getRounds(gameId: Config.gameId)
        switch res {
            case .success(let rounds):
                //print(rounds)
                self.rounds = rounds
            case .failure(let failure):
                print(failure.localizedDescription)
                rounds = []
        }
    }
}

class MockRoundsViewModel: RoundsViewModel {
    init() {
        super.init(repository: MockRoundsRepository())
    }
}
