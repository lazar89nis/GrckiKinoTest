//
//  SplashView.swift
//  GrckiKino
//
//  Created by Lazar Djordjevic on 19.7.24..
//

import SwiftUI

struct SplashView: View {
    
    @State var viewModel: SplashViewModel
    
    let roundsCoordinator: RoundsCoordinable
    
    var body: some View {
        rootView
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        viewModel.splashFinished()
                    }
                }
            }
    }
    
    var launchView: some View {
        ZStack {
            backgroundView
            logoView
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    var backgroundView: some View {
        Color.red
    }
    
    var logoView: some View {
        Text("GRCKI KINO")
    }
    
    var rootView: some View {
        NavigationStack {
            view(forState: viewModel.state)
        }
    }
    
    @ViewBuilder
    private func view(forState state: AppState) -> some View {
        switch state {
            case .main:
                roundsCoordinator.view
            case .starting:
                launchView
        }
    }
}

#Preview {
    let coordinator = SplashCoordinator(dependency: SplashDependency())
    
    return SplashView(
        viewModel: MockSplashViewModel(state: .starting),
        roundsCoordinator: coordinator.roundsCoordinator
    )
}
