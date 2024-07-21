//
//  LiveDrawView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI


struct LiveDrawView: View {
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .tint(.appTextWhite)
                    .scaleEffect(2)
            }
            WebView(isLoading: $isLoading)
                .opacity(isLoading ? 0 : 1)
        }.background(Color.appBackground)
    }
}

#Preview {
    LiveDrawView()
}
