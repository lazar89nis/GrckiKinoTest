//
//  RoundResultViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

@Observable class RoundResultViewModel {
    var drawTime: String
    var roundId: String
    let winningNumbers: [Int]
    
    private let result: Round
    private let dateFormatter = DateFormatter.formatter(withStyle: .monthDayHourMinute)
    
    init(result: Round) {
        self.result = result
    
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
