//
//  RoundsViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI
import Combine

@Observable class RoundsViewModel {
    var isGameViewPresented = false
    var rounds: [Round] = []
    var navigationPath = NavigationPath()
    var fetchFailed: Bool = false
    var showFailedMessage: Bool = false
    var dataLoading = false

    private let repository: RoundsRepository
    private var timer: AnyCancellable?
    
    var activeRound: Round?
    
    init(repository: RoundsRepository) {
        self.repository = repository
        
        timer = Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                if(rounds.isEmpty) { return }
                
                let currentRounds = rounds
                let updatedRounds = rounds.filter { Date().distance(to: $0.drawTimeDate) >= 0 }

                if currentRounds.count != updatedRounds.count {
                    withAnimation {
                        self.rounds = updatedRounds
                    }
                    self.activeRound = self.rounds.first
                    self.checkDataReload()
                }
                //self.activeRound = self.rounds.randomElement()
            }
    }
    
    deinit {
        timer?.cancel()
        timer = nil
    }
    
    func checkDataReload() {
        if rounds.count < 5 {
            Task {
                do {
                    await loadRounds()
                }
            }
        }
    }
    
    func loadRounds() async  {
        if dataLoading {
            return
        }
        fetchFailed = false
        dataLoading = true
        let res = await repository.getRounds(gameId: Config.gameId)
        dataLoading = false
        switch res {
            case .success(let rounds):
                //print(rounds)
                self.rounds = rounds
            case .failure(let failure):
                print(failure.localizedDescription)
                rounds = []
                fetchFailed = true
                showFailedMessage = true
        }
    }
}

class MockRoundsViewModel: RoundsViewModel {
    init(withError: Bool = false) {
        super.init(repository: MockRoundsRepository(withError: withError))
    }
}
