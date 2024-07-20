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
            roundInfoView
            oddsView
            PlayTableView(viewModel: playTableViewModel)
            footerView
        }
        
    }
    
    func makeBubbleView(infoText: String, valueText: String) -> some View {
        VStack {
            Text(infoText)
                .font(R.font.neuePlakSemiBold.font(size: 13))
                .foregroundColor(R.color.textWhite.color.opacity(0.8))
            
            Text(valueText)
                .font(R.font.neuePlakBold.font(size: 15))
                .foregroundColor(R.color.textWhite.color)
            
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(R.color.toolbarBackground.color)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 1)
        )
    }
    
    var roundInfoView: some View {
        HStack(spacing: 16) {
            makeBubbleView(infoText: "Draw time".uppercased(), valueText: viewModel.drawTime)
            makeBubbleView(infoText: "Round".uppercased(), valueText: viewModel.roundId)
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
        .frame(maxWidth: .infinity)
    }
    
    var oddsView: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(viewModel.odds, id: \.self) { odd in
                    ZStack(alignment: .center) {
                        Text(String(odd.value))
                            .frame(maxHeight: 60)
                            .font(R.font.neuePlakBold.font(size: 15))
                            .foregroundColor(R.color.textWhite.color)
                            .padding(.horizontal, 16)
                            .background(RadialGradient(gradient: Gradient(colors: [
                                R.color.oddsGradient1.color,
                                R.color.oddsGradient2.color]),
                                                       center: .bottom,
                                                       startRadius: 0,
                                                       endRadius: 40)
                            )
                            .cornerRadius(6)
                        
                        Text("\(odd.round).")
                            .font(R.font.neuePlakSemiBold.font(size: 13))
                            .foregroundColor(R.color.textWhite.color.opacity(0.8))
                            .padding(.horizontal, 12)
                            .frame(maxHeight: 24)
                            .background(R.color.oddsGradient1.color)
                            .cornerRadius(12)
                            .offset(CGSize(width: 0.0, height: 30.0))
                    }
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 12+10)
        }
        .padding(.top, 10)
    }
    
    var footerView: some View {
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
        .background(R.color.footerBackground.color)
    }
}

#Preview {
    PlayView(viewModel: PlayViewModel(selectedRound: Round.fixture()),
             playTableViewModel: PlayTableViewModel())
}
