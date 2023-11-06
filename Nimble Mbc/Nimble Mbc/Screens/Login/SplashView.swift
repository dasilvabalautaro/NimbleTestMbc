//
//  SplashView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/4/23.
//

import SwiftUI

struct SplashView: View {
    @State var isChange: Bool = false
    
    var body: some View {
        ZStack {
            Image("splash1", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            if self.isChange {
                VStack{
                    Image("logo", bundle: .main)
                        .resizable()
                        .frame(width: 201, height: 48)
                }
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    self.isChange = true
                }
            }
        }
    }
}

#Preview {
    SplashView()
}
