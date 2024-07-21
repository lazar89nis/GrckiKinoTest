//
//  GameCoordinator.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

protocol GameCoordinable: Coordinable {
    var view: AnyView { get }
}

final class GameCoordinator<Dependency>: GameCoordinable where Dependency: GameInjectable {
    private let dependency: Dependency
    private let round: Round
    
    init(dependency: Dependency, round: Round) {
        self.dependency = dependency
        self.round = round
    }
    
    lazy var view: AnyView = {
        AnyView(
            GameView(viewModel: dependency.gameViewModel(round: round),
                     dependency: dependency)
        )
    }()
}
