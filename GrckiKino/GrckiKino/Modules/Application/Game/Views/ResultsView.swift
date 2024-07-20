//
//  ResultsView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct ResultsView: View {
    
    @State var viewModel: ResultsViewModel
    
    var body: some View {
        List(viewModel.results, id: \.self) { result in
            RoundResultView(viewModel: RoundResultViewModel(result: result))
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
                .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
        .refreshable {
            Task {
                await viewModel.loadResults()
            }
        }
        .onAppear() {
            Task {
                await viewModel.loadResults()
            }
        }
    }
}

#Preview {
    ResultsView(viewModel: ResultsViewModel(repository: GameWebRepository()))
}
