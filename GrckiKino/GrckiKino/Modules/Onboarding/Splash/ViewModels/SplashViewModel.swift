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
        //Just to show values for testing
        print(EnvironmentValues.appName)
        print(EnvironmentValues.serverURL)
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
