//
//  ResultsViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

@Observable class ResultsViewModel {
    var results: [Round] = []
    
    private let repository: GameRepository
    
    init(repository: GameRepository) {
        self.repository = repository
    }
    
    func loadResults() async  {
        let dateFormatter = DateFormatter.formatter(withStyle: .jsonSimplified)
        let nowStr = dateFormatter.string(from: Date())
        
        let res = await repository.getResults(gameId: Config.gameId, fromDate: nowStr, toDate: nowStr)
        switch res {
            case .success(let results):
                //print(results)
                self.results = results
            case .failure(let failure):
                print(failure.localizedDescription)
                results = []
        }
    }
}

class MockResultsViewModel: ResultsViewModel {
    init() {
        super.init(repository: MockGameRepository())
    }
}
