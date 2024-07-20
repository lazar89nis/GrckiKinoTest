//
//  GameView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct GameView: View {
    
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
        .navigationTitle("Round \(String(viewModel.selectedRound.drawId))")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(R.color.toolbarBackground.color, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
    
    var bgView: some View {
        R.color.background.color//.edgesIgnoringSafeArea(.all)
    }
    
    var pickerView: some View {
        Picker("Select View", selection: $viewModel.selectedSegment) {
            Text("Lottery ticket").tag(0)
            Text("Draw view").tag(1)
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
            ResultsView()
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .animation(.easeInOut, value: viewModel.selectedSegment)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    NavigationStack {
        GameView(viewModel: GameViewModel(selectedRound: Round.fixture()),
                 dependency: GameDependency())
    }
}
