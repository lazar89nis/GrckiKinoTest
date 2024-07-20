//
//  RoundResultView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import SwiftUI

struct RoundResultView: View {
    let numberOfColumns = 5
    let spacing:CGFloat = 16
    
    @State var viewModel: RoundResultViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            RoundInfoView(drawTime: viewModel.drawTime, roundId: viewModel.roundId)
                .padding(.top, 16)
            let buttonSize = calculateButtonSize()
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(buttonSize), 
                                                         spacing: spacing),
                                     count: numberOfColumns),
                      spacing: spacing) {
                ForEach(viewModel.winningNumbers, id: \.self) { number in
                    PlayTableCircle(number: number,
                                    selected: true,
                                    buttonSize: buttonSize)
                }
            }
            .padding(16)
        }
        .background(R.color.rowBackground.color)
        .cornerRadius(10)
    }
    
    func calculateButtonSize() -> CGFloat {
        return (UIScreen.main.bounds.size.width-64 - CGFloat(Int(spacing) * (numberOfColumns-1))) / CGFloat(numberOfColumns)
    }
}

#Preview {
    RoundResultView(viewModel: RoundResultViewModel(result: Round.fixture()))
}
