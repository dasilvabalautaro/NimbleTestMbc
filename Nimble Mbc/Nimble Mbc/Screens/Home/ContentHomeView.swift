//
//  ContentHomeView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/5/23.
//

import SwiftUI

struct ContentHomeView: View {
    @State private var pageIndex = 0
    private let pages: [PageModel] = PageModel.homePages
    
    var body: some View {
        TabView(selection: $pageIndex){
            ForEach(pages){ page in
                HomeView(page: page).tag(page.tag)
            }
        }
        
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .padding([.top], 0)
        .padding([.bottom], 0)
        .edgesIgnoringSafeArea(.all)
        .animation(.easeInOut, value: pageIndex)
    }
    
}

#Preview {
    ContentHomeView()
}
