//
//  SplashCoordinator.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

protocol SplashCoordinable: Coordinable {
    var view: AnyView { get }
    var roundsCoordinator: RoundsCoordinable { get }
}

final class SplashCoordinator<Dependency>: SplashCoordinable where Dependency: SplashInjectable {
    private let dependency: Dependency
    
    init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    lazy var view: AnyView = {
        AnyView(
            SplashView(
                viewModel: dependency.viewModel,
                roundsCoordinator: self.roundsCoordinator
            )
        )
    }()
    
    var roundsCoordinator: RoundsCoordinable {
        let dependency = RoundsDependency()
        return RoundsCoordinator(dependency: dependency)
    }
}
