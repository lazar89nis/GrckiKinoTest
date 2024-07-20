//
//  PlayViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import SwiftUI

@Observable class PlayViewModel {
    
    private var timer: Timer?
    private let dateFormatter = DateFormatter()
    
    var selectedRound: Round
    
    var drawTime: String
    var roundId: String
    
    var timeLeft: String
    
    var timeLeftProgress = 0.0
    
    var odds: [Odd] = Odd.fixtures()
    
    init(selectedRound: Round) {
        self.selectedRound = selectedRound
        
        dateFormatter.dateFormat = "MM-dd HH:mm"
        drawTime = dateFormatter.string(from: selectedRound.drawTimeDate)
        timeLeft = ""
        
        roundId = String(selectedRound.drawId)
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            withAnimation {
                self?.timeLeft = self?.calculateTimeLeft() ?? ""
            }
        }
        
        timer?.fire()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func calculateTimeLeft() -> String {
        let currentDate = Date()
        
        let difference = selectedRound.drawTimeDate.timeIntervalSince(currentDate)
        
        timeLeftProgress = max(0,min(difference,300)/300.0)
        
        if difference < 0 {
            return "00:00:00"
        }
        
        return Utility.formatTimeInterval(difference)
    }
}
