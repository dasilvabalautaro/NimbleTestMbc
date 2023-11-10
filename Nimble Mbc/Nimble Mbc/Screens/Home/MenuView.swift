//
//  MenuView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/9/23.
//

import SwiftUI
import Resolver

struct MenuView: View {
    @Binding var showCloset: Bool
    
    @ObservedObject var viewModel: MenuViewModel = Resolver.resolve()
    @EnvironmentObject var navigationCoordinator: Coordinator
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color.black.opacity(0.2).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack{
                    Text("Mai")
                        .bold()
                        .frame(height: 40)
                        .font(Font.custom("NeuzeitSLT-BookHeavy", size: 34))
                        .foregroundColor(Color.white)
                    
                    Image("icoHome", bundle: .main)
                        .resizable()
                        .frame(width: 36, height: 36)
                        .padding([.leading], 50)
                        
                }
                .padding([.leading], 2)
                .padding([.top], 50)
                
                Divider().frame(width: 170, height: 1).overlay(.gray).padding([.top], 20)
                
                Button{
                    self.viewModel.onSingOutClick()
                } label: {
                    Text("Logout")
                        .frame(width: 90, height: 20, alignment: .leading)
                        .font(Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(.gray)
                }
                .padding([.top], 30)
                
                Spacer()
            }
            .frame(width: 200)
            .background(Color.black)
            .onChange(of: self.viewModel.finishApp){_ in
                if (self.viewModel.finishApp){
                    navigationCoordinator.goHome()
                }
                
            }
        }
        .onTapGesture {
            self.showCloset = false
        }
        
    }
}

#Preview {
    MenuView(showCloset: .constant(true))
}
