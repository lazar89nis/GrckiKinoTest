//
//  RoundsListRow.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct RoundsListRow: View {
    
    var viewModel: RoundsListRowViewModel
        
    var body: some View {
        HStack(spacing: 0) {
            Text("\(viewModel.startsAt)")
                .font(R.font.neuePlakBold.font(size: 16))
                .foregroundColor(R.color.textWhite.color)
                .padding(EdgeInsets(top: 18, leading: 16, bottom: 16, trailing: 8))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(viewModel.isFinished ? "Finished" : "\(viewModel.timeLeft)")
                .font(R.font.neuePlakBold.font(size: 16))
                .foregroundColor(viewModel.isFinished ? R.color.lightBlueStroke.color : viewModel.isLowTime ? R.color.lightRed.color : R.color.textWhite.color)
                .padding(EdgeInsets(top: 18, leading: 0, bottom: 16, trailing: 16))
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .background(R.color.rowBackground.color)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(R.color.lightBlueStroke.color, lineWidth: viewModel.isFinished ? 3 : 0)
        )
        .padding(1.5)
    }
}

#Preview {
    RoundsListRow(viewModel: MockRoundsListRowViewModel())
}
