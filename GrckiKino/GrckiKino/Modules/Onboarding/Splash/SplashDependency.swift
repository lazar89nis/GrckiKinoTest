//
//  SplashDependency.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import Foundation

protocol SplashInjectable: Injectable {
    var viewModel: SplashViewModel { get }
}

final class SplashDependency: SplashInjectable {
    var viewModel: SplashViewModel {
        SplashViewModel()
    }
}
