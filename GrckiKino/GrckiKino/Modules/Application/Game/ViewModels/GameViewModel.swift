//
//  GameViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

@Observable class GameViewModel {
    var selectedRound: Round
    var selectedSegment = 0
    var newRoundStartedToast = false
    
    init(selectedRound: Round) {
        self.selectedRound = selectedRound
    }
    
    func activeRoundChanged(newRound: Round?) {
        guard let newRound = newRound else { return }
        if selectedRound.drawId != newRound.drawId && selectedRound.drawId < newRound.drawId {
            selectedRound = newRound
            newRoundStartedToast = true
        }
        
    }
}

class MockGameViewModel: GameViewModel {
    init() {
        super.init(selectedRound: Round.activeFixture())
    }
}
