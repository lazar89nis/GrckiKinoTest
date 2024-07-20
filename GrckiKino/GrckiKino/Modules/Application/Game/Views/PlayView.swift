//
//  PlayView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import SwiftUI

struct PlayView: View {
    
    @State var viewModel: PlayViewModel
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
                .tint(viewModel.timeLeftProgress < 0.2 ? R.color.lightRed.color : R.color.lightBlueStroke.color)
            
            HStack(spacing:0)  {
                HStack(spacing:0) {
                    Text("Time left: ")
                        .font(R.font.neuePlakRegular.font(size: 15))
                        .foregroundColor(R.color.textWhite.color)
                    
                    Text(viewModel.timeLeft)
                        .font(R.font.neuePlakBold.font(size: 15))
                        .foregroundColor(R.color.textWhite.color)
                }
                Spacer()
                HStack(spacing:0) {
                    Text("Selected: ")
                        .font(R.font.neuePlakRegular.font(size: 15))
                        .foregroundColor(R.color.textWhite.color)
                    
                    Text("\(playTableViewModel.selectedNumbers.count)")
                        .font(R.font.neuePlakBold.font(size: 15))
                        .foregroundColor(R.color.textWhite.color)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .background(R.color.footerBackground.color)
    }
}

#Preview {
    PlayView(viewModel: PlayViewModel(selectedRound: Round.fixture()),
             playTableViewModel: PlayTableViewModel())
    .background(R.color.background.color)
}
