//
//  GameViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

@Observable class GameViewModel {
    
    var selectedRound: Round
    var selectedSegment = 0
    
    init(selectedRound: Round) {
        self.selectedRound = selectedRound
    }
}

class MockGameViewModel: GameViewModel {
    init() {
        super.init(selectedRound: Round.fixture())
    }
}
