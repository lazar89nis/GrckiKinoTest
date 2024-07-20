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
    
    init() {
        let appearance = UISegmentedControl.appearance()
        appearance.selectedSegmentTintColor = UIColor(red: 254/255, green: 192/255, blue: 26/255, alpha: 1)
        appearance.backgroundColor = UIColor(red: 24/255, green: 27/255, blue: 58/255, alpha: 1)
        appearance.setTitleTextAttributes([.foregroundColor: UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1), .font: UIFont(name: "NeuePlak-Bold", size: 16)!], for: .selected)
        appearance.setTitleTextAttributes([.foregroundColor: UIColor(red: 207/255, green: 207/255, blue: 207/255, alpha: 1), .font: UIFont(name: "NeuePlak-Regular", size: 16)!], for: .normal)
    }
    
    var body: some Scene {
        WindowGroup {
            coordinator.view
                .preferredColorScheme(.light)
        }
    }
}
