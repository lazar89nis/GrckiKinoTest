//
//  ResultsView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI
import AlertToast

struct ResultsView: View {
    @State var viewModel: ResultsViewModel
    
    var body: some View {
        VStack {
            Group {
                if viewModel.results.isEmpty && viewModel.dataLoading {
                    loader
                } else {
                    listView
                }
            }
            if viewModel.fetchFailed {
                Button(action: {
                    Task {
                        await viewModel.loadResults()
                    }
                }) {
                    Text("Try again")
                        .foregroundColor(.appTextWhite)
                }
            }
        }
        .toast(isPresenting: $viewModel.showFailedMessage, duration: 3, tapToDismiss: true){
            AlertToast(displayMode: .alert,
                       type: .error(.appTextWhite),
                       title: String.localized(key: "There was an error getting data"),
                       subTitle: String.localized(key: "Please try again"),
                       style: AlertToast.AlertStyle.style(backgroundColor:.appLightRed,
                                                          titleColor: .appTextWhite,
                                                          subTitleColor: .appTextWhite,
                                                          titleFont: .bodyLargeBold,
                                                          subTitleFont: .bodyLarge))
        }
        .onAppear {
            Task {
                await viewModel.loadResults()
            }
        }
        
    }
    
    var listView: some View {
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
    }
    
    var loader: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .tint(.appTextWhite)
            .scaleEffect(2)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ResultsView(viewModel: MockResultsViewModel(withError: true))
        .background(Color.appBackground)
}
