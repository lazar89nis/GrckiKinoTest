//
//  GameView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI
import AlertToast

struct GameView: View {
    @Environment(RoundsViewModel.self) var roundsViewModel

    @State var viewModel: GameViewModel
    let dependency: GameInjectable

    var body: some View {
        ZStack {
            bgView
            VStack(spacing: 0) {
                pickerView
                mainContentView
            }
            .padding(.top)
        }
        .onChange(of: roundsViewModel.activeRound, { oldValue, newValue in
            viewModel.activeRoundChanged(newRound: newValue)
        })
        .toast(isPresenting: $viewModel.newRoundStartedToast, duration: 3, tapToDismiss: true){
            AlertToast(displayMode: .alert,
                       type: .complete(.appTextWhite),
                       title: String.localized(key: "Round finished"),
                       subTitle: String.localized(key: "New round starting"),
                       style: AlertToast.AlertStyle.style(backgroundColor:.appRoundDoneBackground,
                                                          titleColor: .appTextWhite,
                                                          subTitleColor: .appTextWhite,
                                                          titleFont: .bodyLargeBold,
                                                          subTitleFont: .bodyLarge))
        }
        .navigationTitle("Round \(String(viewModel.selectedRound.drawId))")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.appToolbarBackground, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
    
    var bgView: some View {
        Color.appBackground
            .edgesIgnoringSafeArea(.all)
    }
    
    var pickerView: some View {
        Picker("Select View", selection: $viewModel.selectedSegment) {
            Text("Play").tag(0)
            Text("Live draw").tag(1)
            Text("Results").tag(2)
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, 16)
    }
    
    var mainContentView: some View {
        TabView(selection: $viewModel.selectedSegment) {
            PlayView(viewModel: dependency.playViewModel(round: viewModel.selectedRound),
                     playTableViewModel: dependency.playTableViewModel())
            .tag(0)
            .padding(.top)
            
            LiveDrawView()
                .tag(1)
                .padding(.top)
                .edgesIgnoringSafeArea(.all)
            
            ResultsView(viewModel: dependency.resultsViewModel())
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .animation(.easeInOut, value: viewModel.selectedSegment)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    let roundsViewModel = MockRoundsViewModel()
    Task {
        do {
            await roundsViewModel.loadRounds()
        }
    }
    return NavigationStack {
        GameView(viewModel: MockGameViewModel(),
                 dependency: GameDependency())
        .environment(roundsViewModel as RoundsViewModel)
    }
}
