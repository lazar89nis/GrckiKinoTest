//
//  SplashViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

enum AppState {
    case starting
    case main
}

@Observable class SplashViewModel {
    var state: AppState = .starting
    
    init() {
    }
    
    func splashFinished() {
        self.state = .main
    }
}

class MockSplashViewModel: SplashViewModel {
    override init() {
        super.init()
    }
    
    init(state: AppState) {
        super.init()
        self.state = state
    }
}
