//
//  OddsView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import SwiftUI

struct OddsView: View {
    var odds:[Odd]
    @Binding var selectedNumbers: Set<Int>
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                HStack(spacing: 8) {
                    ForEach(odds, id: \.self) { odd in
                        OddsBubbleView(odd: odd, isSelected: selectedNumbers.count == odd.numbersPlayed)
                    }
                }
                .padding(.horizontal, 8)
            }
            .scrollIndicators(.hidden)
            .onChange(of: selectedNumbers) { newValue, _ in
                if newValue.count > 0 && newValue.count < odds.count {
                    withAnimation {
                        proxy.scrollTo(odds[newValue.count - 1], anchor: .center)
                    }
                }
            }
        }
    }
}

#Preview {
    OddsView(odds: Odd.fixtures(), selectedNumbers: .constant([3,5,6]))
        .background(Color.appBackground)
}
