//
//  RoundsView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI
import AlertToast

struct RoundsView: View {
    @State var viewModel: RoundsViewModel
    let coordinator: RoundsCoordinable
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            VStack(spacing: 0) {
                titleView
                    .padding(.top, 6)
                Group {
                    if viewModel.rounds.isEmpty && viewModel.dataLoading {
                        loader
                    } else {
                        infoTextView
                            .padding(.vertical, 10)
                        listView
                    }
                }
                if viewModel.fetchFailed {
                    Button(action: {
                        Task {
                            await viewModel.loadRounds()
                        }
                    }) {
                        Text("Try again")
                            .foregroundColor(.appTextWhite)
                    }
                }
            }
            .background(Color.appBackground)
            .navigationTitle("Rounds")
            .toolbar(.hidden, for: .navigationBar)
            navigationLinks
                
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
                await viewModel.loadRounds()
            }
        }
    }
    
    var titleView: some View {
        Text("Grcki kino")
            .textCase(.uppercase)
            .font(.appTitle)
            .foregroundColor(.appTextWhite)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
    }
    
    var infoTextView: some View {
        Text("Select round to play")
            .textCase(.uppercase)
            .font(.bodyRegularBold)
            .foregroundColor(.appTextWhite)
            .multilineTextAlignment(.center)
            .padding(EdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16))
    }
    
    var listView: some View {
        VStack(spacing: 0) {
            listHeader
            List(viewModel.rounds, id: \.self.drawId) { round in
                let rowViewModel = RoundsListRowViewModel(round: round)
                RoundsListRow(viewModel: rowViewModel)
                    .onTapGesture {
                        if(!rowViewModel.isFinished) {
                            viewModel.navigationPath.append(round)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .background(Color.clear)
        }
        .refreshable {
            Task {
                await viewModel.loadRounds()
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
    
    var listHeader: some View {
        HStack {
            Text("Starts at")
                .font(.bodyLarge)
                .foregroundColor(.appTextWhite)
                .multilineTextAlignment(.center)
            Spacer()
            Text("Time left")
                .font(.bodyLarge)
                .foregroundColor(.appTextWhite)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, 32)
    }
    
    @ViewBuilder var navigationLinks: some View {
        Spacer().frame(width: 0, height: 0)
            .navigationDestination(for: Round.self) { round in
                self.coordinator.openGameView(round: round)
                    .environment(viewModel)
            }
    }
}

#Preview {
    let viewModel = MockRoundsViewModel(withError: false)
    return RoundsView(viewModel: viewModel,
                      coordinator: RoundsCoordinator(dependency: RoundsDependency()))
}
