//
//  PlayView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import SwiftUI

struct PlayView: View {
    var viewModel: PlayViewModel
    @State var playTableViewModel: PlayTableViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            RoundInfoView(drawTime: viewModel.drawTime, roundId: viewModel.roundId)
            
            OddsView(odds: viewModel.odds, selectedNumbers: $playTableViewModel.selectedNumbers)
                .padding(.vertical, 10)
            
            PlayTableView(viewModel: playTableViewModel)
            
            footerView
        }
    }
    
    var footerView: some View {
        VStack {
            ProgressView(value: 1-viewModel.timeLeftProgress)
                .progressViewStyle(LinearProgressViewStyle())
                .tint(viewModel.timeLeftProgress < 0.2 ? .appLightRed : .appLightBlueStroke)
            
            HStack(spacing:0)  {
                timeLeftView
                Spacer()
                selectedNumbersView
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .background(Color.appFooterBackground)
    }
    
    var timeLeftView: some View {
        HStack(spacing: 0) {
            Text("Time left: ")
                .font(.bodyRegular)
                .foregroundColor(.appTextWhite)
            
            Text(viewModel.timeLeft)
                .font(.bodyRegularBold)
                .foregroundColor(viewModel.timeLeftProgress < 0.2 ? .appLightRed : .appTextWhite)
                .contentTransition(.numericText())
        }
    }
    
    var selectedNumbersView: some View {
        HStack(spacing: 0) {
            Text("Selected: ")
                .font(.bodyRegular)
                .foregroundColor(.appTextWhite)
            
            Text("\(playTableViewModel.selectedNumbers.count)")
                .font(.bodyRegularBold)
                .foregroundColor(.appTextWhite)
                .contentTransition(.numericText())
        }
    }
}

#Preview {
    PlayView(viewModel: MockPlayViewModel(),
             playTableViewModel: MockPlayTableViewModel())
    .background(Color.appBackground)
}
