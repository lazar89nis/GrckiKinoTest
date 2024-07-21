//
//  OddsBubbleView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 21.7.24..
//

import SwiftUI

struct OddsBubbleView: View {
    var odd: Odd
    var isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .frame(height: 60)
                .foregroundColor(.appOddsBubbleBg)
                .cornerRadius(8)
                .overlay(
                    InsettableRect(cornerRadius: 6, insetAmount: 1)
                        .stroke(isSelected ? Color.appOddsStrokeActive : Color.appOddsStroke, lineWidth: 2)
                        .animation(.easeInOut(duration: 0.3), value: isSelected)
                )
            
            Text(format(odd.value))
                .font(.bodyMedium)
                .foregroundColor(.appTextWhite)
                .padding(.horizontal, 8)
                .offset(y: -12)
            
            Text("\(odd.numbersPlayed)")
                .font(.appCaption)
                .foregroundColor(.appTextWhite)
                .padding(EdgeInsets(top: 3, leading: 10, bottom: 2, trailing: 10))
                .background(Color.white.opacity(0.1))
                .cornerRadius(4)
                .padding(.horizontal, 8)
                .offset(y: 13)
        }
    }
    
    private func format(_ value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}

#Preview {
    ScrollView(.horizontal) {
        HStack(alignment: .center) {
            OddsBubbleView(odd: Odd.fixture(), isSelected: false)
            OddsBubbleView(odd: Odd.fixture(), isSelected: true)
        }        
    }
    .frame(maxHeight:  .infinity)
    .background(Color.appBackground)
}
