//
//  ChoiseView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/6/23.
//

import SwiftUI

struct Choice: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

private var choices = [
    Choice(name: "Choice 1"),
    Choice(name: "Choice 2"),
    Choice(name: "Choice 3"),
    Choice(name: "Choice 4"),
    Choice(name: "Choice 5")
]

struct ChoiseView: View {
    @State private var multiSelection = Set<UUID>()

    var body: some View {
        List(choices, selection: $multiSelection) {it in
            HStack {
                Text(it.name)
                    .font(self.multiSelection.contains(it.id) ? Font.custom("NeuzeitSLT-BookHeavy", size: 20) : Font.custom("NeuzeitSLT-Book", size: 20))
                    .foregroundColor(Color.white)
                Spacer()
                Image(systemName: self.multiSelection.contains(it.id) ? "checkmark.circle.fill" : "circle")
                    .foregroundColor( Color.white)
                
            }
            .padding(0)
            .onTapGesture {
                if self.multiSelection.contains(it.id) {
                    self.multiSelection.remove(it.id)
                }
                else {
                    self.multiSelection.insert(it.id)
                }
            }
            .listRowBackground(Color.clear)
            .listRowSeparatorTint(.white)
        }
        .frame(width: 250, height: 100, alignment: .center)
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        
    }
    
}

#Preview {
    ChoiseView()
}
