//
//  LazyLoadView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/4/23.
//

import SwiftUI

struct LazyLoadView: View {
    @EnvironmentObject var navigationCoordinator: Coordinator
    
    @State private var image: Image?
    @State private var finish = false
    
    var imageNames: [String] = ["transition", "transition1"]
//    @State var isAnimating = false
//    let transition = AnyTransition.asymmetric(insertion: .slide, removal: .scale).combined(with: .opacity)

    var body: some View {
        ZStack {
            image?
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                
//            Image("transition1", bundle: .main)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .edgesIgnoringSafeArea(.all)
//            Image("transition", bundle: .main)
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .edgesIgnoringSafeArea(.all)
//                .transition(transition)
//                .animation(.default.speed(0.5), value: isAnimating)
            
        }
        .onChange(of: self.finish) {item in
            self.navigationCoordinator.goContentHome()
        }
        .onAppear(perform: {
            self.animate()
//            isAnimating = true
        })
//        .animation(.easeInOut.repeatForever(), value: isAnimating)
        
    }
   
    private func animate() {
        var imageIndex: Int = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { timer in
            if imageIndex < self.imageNames.count {
                self.image = Image(self.imageNames[imageIndex], bundle: .main)
                
                imageIndex += 1
            }
            else {
//                timer.invalidate() 0.35
                self.finish = true
//                imageIndex = 0
            }
        }
    }
    
}

#Preview {
    LazyLoadView()
}
