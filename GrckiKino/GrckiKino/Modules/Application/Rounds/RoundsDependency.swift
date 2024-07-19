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
    
    private let roundsRepository: RoundsRepository
    
    init() {
        self.roundsRepository = RoundsWebRepository()
    }
    
    var viewModel: RoundsViewModel {
        RoundsViewModel(repository: roundsRepository)
    }
}
