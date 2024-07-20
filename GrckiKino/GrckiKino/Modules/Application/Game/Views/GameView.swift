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
        .toolbarBackground(Color.appToolbarBackground, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
    
    var bgView: some View {
        Color.appBackground.edgesIgnoringSafeArea(.all)
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
        ZStack {
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
}

#Preview {
    NavigationStack {
        GameView(viewModel: MockGameViewModel(),
                 dependency: GameDependency())
    }
}
