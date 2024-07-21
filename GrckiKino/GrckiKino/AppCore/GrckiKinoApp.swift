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
        appearance.selectedSegmentTintColor = UIColor(named: R.color.segmentedYellow.name)!
        appearance.backgroundColor = UIColor(named: R.color.rowBackground.name)!
        appearance.setTitleTextAttributes([.foregroundColor: UIColor(named: R.color.textDark.name)!,
            .font: R.font.neuePlakBold.callAsFunction(size: 14)!], for: .selected)
        appearance.setTitleTextAttributes([.foregroundColor: UIColor(named: R.color.textGrey.name)!,
            .font: R.font.neuePlakRegular.callAsFunction(size: 14)!], for: .normal)

        UIRefreshControl.appearance().tintColor = UIColor(named: R.color.textWhite.name)
    }
    
    var body: some Scene {
        WindowGroup {
            coordinator.view
                .preferredColorScheme(.light)
        }
    }
}
