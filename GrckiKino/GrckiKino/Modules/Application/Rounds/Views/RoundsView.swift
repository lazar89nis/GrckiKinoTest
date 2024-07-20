//
//  RoundsView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct RoundsView: View {
    @State var viewModel: RoundsViewModel
    let coordinator: RoundsCoordinable
    
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            VStack(spacing: 0) {
                titleView
                    .padding(.top, 6)
                infoTextView
                    .padding(.vertical, 10)
                listView
                    .refreshable {
                        Task {
                            await viewModel.loadRounds()
                        }
                    }
            }
            .background(Color.appBackground)
            .navigationTitle("Rounds")
            .toolbar(.hidden, for: .navigationBar)
            navigationLinks
        }
        .onAppear() {
            Task {
                await viewModel.loadRounds()
            }
        }
    }
    
    var titleView: some View {
        Text("Grcki kino")
            .textCase(.uppercase)
            .font(.title)
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
                            navigationPath.append(round)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .background(Color.clear)
        }
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
            }
    }
}

#Preview {
    RoundsView(viewModel: MockRoundsViewModel(),
               coordinator: RoundsCoordinator(dependency: RoundsDependency()))
}
