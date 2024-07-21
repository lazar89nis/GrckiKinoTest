//
//  ResultsViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

@Observable class ResultsViewModel {
    var results: [Round] = []
    var fetchFailed: Bool = false
    var showFailedMessage: Bool = false
    var dataLoading = false
    
    private let repository: GameRepository
    
    init(repository: GameRepository) {
        self.repository = repository
    }
    
    func loadResults() async  {
        if dataLoading {
            return
        }
        fetchFailed = false
        dataLoading = true
        
        let dateFormatter = DateFormatter.formatter(withStyle: .jsonSimplified)
        let nowStr = dateFormatter.string(from: Date())
        
        let res = await repository.getResults(gameId: Config.gameId, fromDate: nowStr, toDate: nowStr)
        dataLoading = false
        switch res {
            case .success(let results):
                //print(results)
                self.results = results
            case .failure(let failure):
                print(failure.localizedDescription)
                results = []
                fetchFailed = true
                showFailedMessage = true
        }
    }
}

class MockResultsViewModel: ResultsViewModel {
    init(withError: Bool = false) {
        super.init(repository: MockGameRepository(withError: withError))
    }
}
