//
//  QualifyView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/5/23.
//

import SwiftUI

struct QualifyView: View {
    @Binding var qualify: String
    
    var body: some View {
        HStack {
            Button() {
                qualify = "Very bad"
            } label: {
                Image("icoVeryungry", bundle: .main)
                    .resizable()
                    .frame(width: 30, height: 34)
            }
            Button() {
                qualify = "Bad"
            } label: {
                Image("icoUngry", bundle: .main)
                    .resizable()
                    .frame(width: 30, height: 34)
            }
            Button() {
                qualify = "Don't know"
            } label: {
                Image("icoUnknow", bundle: .main)
                    .resizable()
                    .frame(width: 30, height: 34)
            }
            Button() {
                qualify = "Good"
            } label: {
                Image("icoGood", bundle: .main)
                    .resizable()
                    .frame(width: 30, height: 34)
            }
            Button() {
                qualify = "Very good"
            } label: {
                Image("icoSmile", bundle: .main)
                    .resizable()
                    .frame(width: 30, height: 34)
            }
        }
    }
}

#Preview {
    QualifyView(qualify: .constant(""))
}
