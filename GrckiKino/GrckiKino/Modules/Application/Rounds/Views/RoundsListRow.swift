//
//  RoundsListRow.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct RoundsListRow: View {
    @State var viewModel: RoundsListRowViewModel
        
    var body: some View {
        HStack(spacing: 0) {
            Text("\(viewModel.startsAt)")
                .font(.bodyLargeBold)
                .foregroundColor(.appTextWhite)
                .padding(EdgeInsets(top: 18, leading: 16, bottom: 16, trailing: 8))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(viewModel.isFinished ? "Finished" : viewModel.timeLeft)
                .font(.bodyLargeBold)
                .foregroundColor(viewModel.isFinished ? .appLightBlueStroke : (viewModel.isLowTime ? .appLightRed : .appTextWhite))
                .padding(EdgeInsets(top: 18, leading: 0, bottom: 16, trailing: 16))
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .background(Color.appRowBackground)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.appLightBlueStroke, lineWidth: viewModel.isFinished ? 3 : 0)
        )
        .padding(1.5)
    }
}

#Preview {
    RoundsListRow(viewModel: MockRoundsListRowViewModel())
}
