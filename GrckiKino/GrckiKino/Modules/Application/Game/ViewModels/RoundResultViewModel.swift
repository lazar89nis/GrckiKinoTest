//
//  RoundResultViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

@Observable class RoundResultViewModel {
    
    private var result: Round
    private let dateFormatter = DateFormatter()
    
    var drawTime: String
    var roundId: String
    
    let winningNumbers: [Int]
    
    init(result: Round) {
        self.result = result
        
        dateFormatter.dateFormat = "MM-dd HH:mm"
        drawTime = dateFormatter.string(from: result.drawTimeDate)
        
        roundId = String(result.drawId)
        winningNumbers = result.winningNumbers
    }
}

class MockRoundResultViewModel: RoundResultViewModel {
    init() {
        super.init(result: Round.activeFixture())
    }
}
