//
//  ResultsViewModel.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import Foundation

@Observable class ResultsViewModel {
    private var repository: GameRepository
    
    var results: [Round] = []
    
    init(repository: GameRepository) {
        self.repository = repository
    }
    
    func loadResults() async  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
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
