//
//  GrckiKinoApp.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

@main
struct GrckiKinoApp: App {
    
    let coordinator = SplashCoordinator(dependency: SplashDependency())
    
    var body: some Scene {
        WindowGroup {
            coordinator.view
        }
    }
}
