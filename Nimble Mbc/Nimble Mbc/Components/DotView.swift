//
//  DotView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/5/23.
//

import SwiftUI

struct DotView: View {
    var color: Color
    
    var body: some View {
        Circle()
            .frame(width: 10, height: 10)
            .foregroundColor(color)
    }
}

#Preview {
    DotView(color: Color.black)
}
