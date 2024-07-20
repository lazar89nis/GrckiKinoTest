//
//  PlayTableViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import SwiftUI

@Observable
class PlayTableViewModel {
    
    var selectedNumbers: Set<Int> = []
    var showAllSelectedToast = false
    
    func toggleSelection(for number: Int) {
        if selectedNumbers.contains(number) {
            selectedNumbers.remove(number)
        } else if selectedNumbers.count < Config.maxNumbersToPlay {
            selectedNumbers.insert(number)
        } else {
            showAllSelectedToast = true
        }
    }
}

class MockPlayTableViewModel: PlayTableViewModel {
    override init() {
        super.init()
        selectedNumbers = [1,7,35,80]
    }
}
