//
//  RoundsListRow.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct RoundsListRow: View {
    
    //let roundsCoordinator: RoundsCoordinator
    
    var body: some View {
        HStack(spacing: 0) {
            Text("Starts at: 15:10")
                .font(R.font.neuePlakBold.font(size: 16))
                .foregroundColor(R.color.textWhite.color)
                .padding(EdgeInsets(top: 18, leading: 16, bottom: 16, trailing: 8))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text("Time left: 00:45")
                .font(R.font.neuePlakRegular.font(size: 16))
                .foregroundColor(R.color.textWhite.color)
                .padding(EdgeInsets(top: 18, leading: 0, bottom: 16, trailing: 16))
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .background(R.color.rowBackground.color)
        .cornerRadius(8)
        /*.overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color(red: 22/255, green: 112/255, blue: 200/255), lineWidth: index == 2 ? 3 : 0)
        )*/
    }
}

#Preview {
    RoundsListRow()
}
