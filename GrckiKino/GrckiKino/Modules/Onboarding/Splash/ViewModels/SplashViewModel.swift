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
    init(state: AppState) {
        super.init()
        self.state = state
    }
    
    override func splashFinished() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            super.splashFinished()
        }
    }
}
