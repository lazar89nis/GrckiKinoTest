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
            .background(R.color.background.color)
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
        Text("Grcki kino".uppercased())
            .font(R.font.neuePlakBold.font(size: 36))
            .foregroundColor(R.color.textWhite.color)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 16)
    }
    
    var infoTextView: some View {
        Text("Select round to play".uppercased())
            .font(R.font.neuePlakBold.font(size: 15))
            .foregroundColor(R.color.textWhite.color)
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
                .font(R.font.neuePlakRegular.font(size: 16))
                .foregroundColor(R.color.textWhite.color)
                .multilineTextAlignment(.center)
                .padding(.leading, 0)
            
            Spacer()
            Text("Time left")
                .font(R.font.neuePlakRegular.font(size: 16))
                .foregroundColor(R.color.textWhite.color)
                .multilineTextAlignment(.center)
                .padding(.trailing, 0)
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
