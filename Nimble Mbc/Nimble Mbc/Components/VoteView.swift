//
//  VoteView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/5/23.
//

import SwiftUI

struct VoteView: View {
    @Binding var countVotes: Int
    var imgActive: String
    var imgDeactive: String
    
    @State var listVotes = [false, false, false, false, false]
    
    var body: some View {
        HStack {
            Button() {
                listVotes[0].toggle()
            } label: {
                Image(listVotes[0] ? imgActive: imgDeactive, bundle: .main)
                    .resizable()
                    .frame(width: 28, height: 34)
            }
            Button() {
                listVotes[1].toggle()
            } label: {
                Image(listVotes[1] ? imgActive: imgDeactive, bundle: .main)
                    .resizable()
                    .frame(width: 28, height: 34)
            }
            Button() {
                listVotes[2].toggle()
            } label: {
                Image(listVotes[2] ? imgActive: imgDeactive, bundle: .main)
                    .resizable()
                    .frame(width: 28, height: 34)
            }
            Button() {
                listVotes[3].toggle()
            } label: {
                Image(listVotes[3] ? imgActive: imgDeactive, bundle: .main)
                    .resizable()
                    .frame(width: 28, height: 34)
            }
            Button() {
                listVotes[4].toggle()
            } label: {
                Image(listVotes[4] ? imgActive: imgDeactive, bundle: .main)
                    .resizable()
                    .frame(width: 28, height: 34)
            }
        }
        .onChange(of: listVotes) {_ in
            countVotes = listVotes.filter {$0 == true}.count
        }
    }
}

#Preview {
    VoteView(countVotes: .constant(0),
             imgActive: "icoHandActive", imgDeactive: "icoHandDesactive")
}
