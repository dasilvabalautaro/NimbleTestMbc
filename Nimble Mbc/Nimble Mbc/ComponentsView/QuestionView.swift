//
//  QuestionView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/5/23.
//

import SwiftUI

struct QuestionView: View {
    @Binding var countPoints: Int
    @State private var listVotes = [false, false, false, false, false,
                                    false, false, false, false, false]
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    listVotes = [false, false, false, false, false,
                                                    false, false, false, false, false]
                    listVotes[0].toggle()
                    countPoints = 1
                } label: {
                    Text("1 ")
                        .font(listVotes[0] ? Font.custom("NeuzeitSLT-BookHeavy", size: 21) : Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(Color.white)
                }
                Divider().frame(width: 2, height: 40).overlay(.white)
                Button {
                    listVotes = [true, false, false, false, false,
                                                    false, false, false, false, false]
                    listVotes[1].toggle()
                    countPoints = 2
                } label: {
                    Text("2 ")
                        .font(listVotes[1] ? Font.custom("NeuzeitSLT-BookHeavy", size: 21) : Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(Color.white)
                }
                Divider().frame(width: 2, height: 40).overlay(.white)
                Button {
                    listVotes = [true, true, false, false, false,
                                                    false, false, false, false, false]
                    listVotes[2].toggle()
                    countPoints = 3
                } label: {
                    Text("3 ")
                        .font(listVotes[2] ? Font.custom("NeuzeitSLT-BookHeavy", size: 21) : Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(Color.white)
                }
                Divider().frame(width: 2, height: 40).overlay(.white)
                Button {
                    listVotes = [true, true, true, false, false,
                                                    false, false, false, false, false]
                    listVotes[3].toggle()
                    countPoints = 4
                } label: {
                    Text("4 ")
                        .font(listVotes[3] ? Font.custom("NeuzeitSLT-BookHeavy", size: 21) : Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(Color.white)
                }
                Divider().frame(width: 2, height: 40).overlay(.white)
                Button {
                    listVotes = [true, true, true, true, false,
                                                    false, false, false, false, false]
                    listVotes[4].toggle()
                    countPoints = 5
                } label: {
                    Text("5 ")
                        .font(listVotes[4] ? Font.custom("NeuzeitSLT-BookHeavy", size: 21) : Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(Color.white)
                }
                Divider().frame(width: 2, height: 40).overlay(.white)
                Button {
                    listVotes = [true, true, true, true, true,
                                                    false, false, false, false, false]
                    listVotes[5].toggle()
                    countPoints = 6
                } label: {
                    Text("6 ")
                        .font(listVotes[5] ? Font.custom("NeuzeitSLT-BookHeavy", size: 21) : Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(Color.white)
                }
                Divider().frame(width: 2, height: 40).overlay(.white)
                Button {
                    listVotes = [true, true, true, true, true,
                                 true, false, false, false, false]
                    listVotes[6].toggle()
                    countPoints = 7
                } label: {
                    Text("7 ")
                        .font(listVotes[6] ? Font.custom("NeuzeitSLT-BookHeavy", size: 21) : Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(Color.white)
                }
                Divider().frame(width: 2, height: 40).overlay(.white)
                Button {
                    listVotes = [true, true, true, true, true,
                                 true, true, false, false, false]
                    listVotes[7].toggle()
                    countPoints = 8
                } label: {
                    Text("8 ")
                        .font(listVotes[7] ? Font.custom("NeuzeitSLT-BookHeavy", size: 21) : Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(Color.white)
                }
                Divider().frame(width: 2, height: 40).overlay(.white)
                Button {
                    listVotes = [true, true, true, true, true,
                                 true, true, true, false, false]
                    listVotes[8].toggle()
                    countPoints = 9
                } label: {
                    Text("9 ")
                        .font(listVotes[8] ? Font.custom("NeuzeitSLT-BookHeavy", size: 21) : Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(Color.white)
                }
                Divider().frame(width: 2, height: 40).overlay(.white)
                Button {
                    listVotes = [true, true, true, true, true,
                                 true, true, true, true, false]
                    listVotes[9].toggle()
                    countPoints = 10
                } label: {
                    Text("10")
                        .font(listVotes[9] ? Font.custom("NeuzeitSLT-BookHeavy", size: 21) : Font.custom("NeuzeitSLT-Book", size: 20))
                        .foregroundColor(Color.white)
                }
                
            }
            .frame(width: 343)
            .padding(EdgeInsets(.init(top: 2, leading: 6, bottom: 2, trailing: 6)))
            .overlay(
                RoundedRectangle(cornerRadius: 16).stroke(.white, lineWidth: 2)
            )
            
            HStack{
                Text("Not at all Likely")
                    .font(countPoints < 6 ? Font.custom("NeuzeitSLT-BookHeavy", size: 17) : Font.custom("NeuzeitSLT-Book", size: 17))
                    .foregroundColor(Color.white)
                    .padding([.top], 10)
                Spacer()
                Text("Extremely Likely")
                    .font(countPoints > 5 ? Font.custom("NeuzeitSLT-BookHeavy", size: 17) : Font.custom("NeuzeitSLT-Book", size: 17))
                    .foregroundColor(Color.white)
                    .padding([.top], 10)
            }
        }
        
    }
}

#Preview {
    QuestionView(countPoints: .constant(0))
}
