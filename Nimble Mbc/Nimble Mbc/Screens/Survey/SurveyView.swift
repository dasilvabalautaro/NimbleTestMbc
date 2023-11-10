//
//  SurveyView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/5/23.
//

import SwiftUI

struct SurveyView: View {
    @EnvironmentObject var navigationCoordinator: Coordinator
    
    var body: some View {
        ZStack {
            Image("homeWorking", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0){
                HStack{
                    Button() {
                        navigationCoordinator.goBack()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 24)
                            .foregroundColor(Color.surface)
                    }
                    Spacer()
                }
                
                Text("Working from home Check-In")
                    .lineLimit(2)
                    .frame(width: 343, alignment: .leading)
                    .font(Font.custom("NeuzeitSLT-BookHeavy", size: 34))
                    .foregroundColor(Color.white)
                    .padding([.top], 30)
                
                Text("We would like to know how you feel about our work from home (WFH) experience.")
                    .lineLimit(2)
                    .frame(width: 343, alignment: .leading)
                    .font(Font.custom("NeuzeitSLT-Book", size: 17))
                    .foregroundColor(Color.white)
                    .padding([.top], 30)
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button {
                        navigationCoordinator.goFulfilled()
                    } label: {
                        Text("Start Survey")
                            .font(Font.custom("NeuzeitSLT-BookHeavy", size: 17))
                            .foregroundColor(Color.black)
                    }
                    .frame(width: 140, height: 56)
                    .background(.white)
                    .cornerRadius(15)
                }
                .frame(width: 343)
            }
            .frame(width: 343)
            .padding([.top], 60)
            .padding([.bottom], 60)
        }
    }
}

#Preview {
    SurveyView()
}
