//
//  RoundsViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

@Observable class RoundsViewModel {
    
    var isGameViewPresented = false
    
    init() {
    }
    
}

class MockRoundsViewModel: RoundsViewModel {
    override init() {
        super.init()
    }
}
