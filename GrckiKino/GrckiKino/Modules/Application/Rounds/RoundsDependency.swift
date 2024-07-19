//
//  RoundsDependency.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

protocol RoundsInjectable: Injectable {
    var viewModel: RoundsViewModel { get }
}

final class RoundsDependency: RoundsInjectable {
    
    var viewModel: RoundsViewModel {
        RoundsViewModel()
    }
}
