//
//  RoundsCoordinator.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

protocol RoundsCoordinable: Coordinable {
    var view: AnyView { get }
    func openGameView(round: Round) -> AnyView
}

final class RoundsCoordinator<Dependency>: RoundsCoordinable where Dependency: RoundsInjectable {
    private let dependency: Dependency
    
    init(dependency: Dependency) {
        self.dependency = dependency
    }
    
    lazy var view: AnyView = {
        AnyView(
            RoundsView(viewModel: dependency.viewModel,
                       coordinator: self))
    }()
    
    func openGameView(round: Round) -> AnyView {
        let gameDependency = GameDependency()
        let gameCoordinator =  GameCoordinator(dependency: gameDependency, round: round)
        return gameCoordinator.view
    }
}
