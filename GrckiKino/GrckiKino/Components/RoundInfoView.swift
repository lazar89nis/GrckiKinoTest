//
//  RoundInfoView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 20.7.24..
//

import SwiftUI
extension String {
    // Function to return localized string using key and arguments
    static func localized(key: String, _ arguments: CVarArg...) -> String {
        let format = NSLocalizedString(key, comment: "")
        return String(format: format, arguments: arguments)
    }
}

struct RoundInfoView: View {
    
    var drawTime:String
    var roundId:String
    
    var body: some View {
        HStack(spacing: 16) {
            makeBubbleView(infoText: String.localized(key:"Draw time: "), valueText: drawTime, hasInfinityWidth: true)
            makeBubbleView(infoText: String.localized(key:"Round: "), valueText: roundId)
        }
        .padding(.horizontal, 16)
        .frame(maxWidth: .infinity)
    }
    
    func makeBubbleView(infoText: String, valueText: String, hasInfinityWidth: Bool = false) -> some View {
        HStack(spacing: 0) {
            Text(infoText)
                .font(R.font.neuePlakSemiBold.font(size: 13))
                .foregroundColor(R.color.textWhite.color.opacity(0.8))
            
            Text(valueText)
                .font(R.font.neuePlakBold.font(size: 13))
                .foregroundColor(R.color.textWhite.color)
            
        }
        .frame(maxWidth: hasInfinityWidth ? .infinity : nil)
        .padding(.vertical, 12)
        .padding(.horizontal, 12)
        .background(R.color.toolbarBackground.color)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white.opacity(0.6), lineWidth: 2)
        )
    }
}

#Preview {
    HStack {
        RoundInfoView(drawTime: "07-20 03:55", roundId: "1107537")
    }
    .padding(.vertical, 20)
    .background(R.color.background.color)        
}
