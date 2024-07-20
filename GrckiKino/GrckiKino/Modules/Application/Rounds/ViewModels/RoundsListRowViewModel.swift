//
//  RoundsListRowViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

@Observable class RoundsListRowViewModel {
    
    private var round: Round
    private var timer: Timer?
    private let dateFormatter = DateFormatter()

    var startsAt: String
    var timeLeft: String
    var isLowTime: Bool
    var isFinished: Bool
    
    init(round: Round) {
        self.round = round
        dateFormatter.dateFormat = "HH:mm"
        startsAt = dateFormatter.string(from: round.drawTimeDate)
        timeLeft = ""
        isFinished = false
        isLowTime = false
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.timeLeft = self?.calculateTimeLeft() ?? ""
        }
        
        timer?.fire()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func calculateTimeLeft() -> String {
        let currentDate = Date()
        
        let difference = round.drawTimeDate.timeIntervalSince(currentDate)
        
        isLowTime = difference < 60
        
        isFinished = difference <= 0
        
        if difference < 0 {
            return "00:00:00"
        }
        
        return Utility.formatTimeInterval(difference)
    }
}

class MockRoundsListRowViewModel: RoundsListRowViewModel {
    init() {
        super.init(round: Round.fixture())
    }
}
