//
//  PickerView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/5/23.
//

import SwiftUI

struct PickerView: View {
    @Binding var selectOption: String
    var options = ["Very fulfilled", "Somewhat fulfilled",
                   "Somewhat unfulfilled", "Very unfulfilled"]
    
    var body: some View {
        Picker("Please choose a option", selection: $selectOption) {
            ForEach(options, id: \.self) {
                Text($0)
                    .font(Font.custom("NeuzeitSLT-BookHeavy", size: 20))
                    .foregroundStyle(Color.white)
                Divider().frame(height: 3).overlay(.white)
            }
        }
        .pickerStyle(.wheel)
    }
}

#Preview {
    PickerView(selectOption: .constant("Very fulfilled"))
    
}
