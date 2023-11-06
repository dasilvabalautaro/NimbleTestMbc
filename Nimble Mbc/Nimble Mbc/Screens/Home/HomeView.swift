//
//  HomeView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/4/23.
//

import SwiftUI

struct HomeView: View {
    var page: PageModel
    @EnvironmentObject var navigationCoordinator: Coordinator
    
    var body: some View {
        ZStack {
            Image(page.background, bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0.0){
                Text("monday, june 15")
                    .frame(width: 343, height: 30, alignment: .leading)
                    .font(Font.custom("NeuzeitSLT-Book", size: 13))
                    .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.white)
                    
                HStack{
                    Text("today")
                        .bold()
                        .frame(height: 40, alignment: .leading)
                        .font(Font.custom("NeuzeitSLT-Book", size: 34))
                        .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.white)
                        
                    Spacer()
                    
                    Image("icoHome", bundle: .main)
                        .resizable()
                        .frame(width: 36, height: 36)
                        
                }
                .frame(width: 343)
                
                Spacer()
                
                HStack{
                    DotView(color: page.indexDot == 0 ? Color.white: Color.gray)
                    DotView(color: page.indexDot == 1 ? Color.white: Color.gray)
                    if page.dots == 3 {
                        DotView(color: page.indexDot == 2 ? Color.white: Color.gray)
                    }
                    
                }
                .frame(width: 343, height: 10, alignment: .leading)
                
                Text(page.title)
                    .frame(width: 343, height: 100, alignment: .leading)
                    .font(Font.custom("NeuzeitSLT-BookHeavy", size: 34))
                    .foregroundColor(Color.white)
                    .padding([.top], 24)
                
                HStack{
                    
                    Text(page.paragraph)
                        .frame(width: 275, height: 50, alignment: .leading)
                        .font(Font.custom("NeuzeitSLT-Book", size: 17))
                        .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    
                    Button() {
                        if page.action {
                            navigationCoordinator.goSurvey()
                        }
                    } label: {
                        Image("icoAction", bundle: .main)
                            .resizable()
                            .frame(width: 56, height: 56)
                    }

                   
                }
                .frame(width: 343, height: 56, alignment: .leading)
            }
            .padding([.top], 60)
            .padding([.bottom], 60)
        }
        
    }
}

#Preview {
    HomeView(page: PageModel.homeSample)
}
