//
//  ContentView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/4/23.
//

import SwiftUI
import Resolver

struct ContentView: View {
    @State var showSplashView: Bool = true
    @ObservedObject var navigationCoordinator = Coordinator()
    
    var body: some View {
        NavigationStack(path: $navigationCoordinator.path) {
            VStack {
                if showSplashView {
                    SplashView().onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                self.showSplashView = false
                            }
                        }
                    }
                }
            }
            .onChange(of: self.showSplashView){_ in
                self.navigationCoordinator.goLogin()
            }
            .navigationDestination(for: Route.self) { path in
                ViewFactory.viewForDestination(path)
            }
        }
        .environmentObject(navigationCoordinator)
    }
}

#Preview {
    ContentView()
}
