//
//  RoundsCoordinator.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

protocol RoundsCoordinable: Coordinable {
    var view: AnyView { get }
}

final class RoundsCoordinator<Dependency>: RoundsCoordinable where Dependency: RoundsInjectable {
    
    private let dependency: Dependency
    
    lazy var view: AnyView = {
        AnyView(
            RoundsView(
                viewModel: dependency.viewModel
            )
        )
    }()
    
    init(dependency: Dependency) {
        self.dependency = dependency
    }
}
