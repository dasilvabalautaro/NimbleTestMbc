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

    var body: some View {
        ZStack {
            image?
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
        }
        .onChange(of: self.finish) {item in
            self.navigationCoordinator.goContentHome()
        }
        .onAppear(perform: {
            self.image = Image(self.imageNames[1], bundle: .main)
            self.animate()
        })
        
    }
   
    private func animate() {
        var imageIndex: Int = 0
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
            if imageIndex < self.imageNames.count {
                withAnimation(.linear) {
                    self.image = Image(self.imageNames[imageIndex], bundle: .main)
                }
                
                imageIndex += 1
            }
            else {
                self.finish = true
            }
        }
    }
    
}

#Preview {
    LazyLoadView()
}
