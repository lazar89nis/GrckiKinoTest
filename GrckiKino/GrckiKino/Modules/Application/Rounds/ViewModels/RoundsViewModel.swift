//
//  RoundsViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

@Observable class RoundsViewModel {
    var isGameViewPresented = false
    var rounds: [Round] = []
    var navigationPath = NavigationPath()

    private let repository: RoundsRepository
    private var dataLoading = false
    private var timer: Timer?

    init(repository: RoundsRepository) {
        self.repository = repository
        
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { [weak self] _ in
            withAnimation {
                self?.rounds.removeAll(where: {Date().distance(to: $0.drawTimeDate) < -10 })
            }
            self?.checkDataReload()
        }
    }
    
    deinit {
        timer?.invalidate()
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
        }
    }
}

class MockRoundsViewModel: RoundsViewModel {
    init() {
        super.init(repository: MockRoundsRepository())
    }
}
