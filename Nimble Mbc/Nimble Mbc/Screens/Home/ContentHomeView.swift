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
//        ZStack {
            
            TabView(selection: $pageIndex){
                ForEach(pages){ page in
                    HomeView(page: page).tag(page.tag)
                }
            }
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .padding([.top], 0)
            .padding([.bottom], 0)
            .edgesIgnoringSafeArea(.all)
            .animation(.easeInOut, value: pageIndex)
            
//        }
//        .ignoresSafeArea(.container, edges: .top)
//        .edgesIgnoringSafeArea(.all)
    }
    
}

#Preview {
    ContentHomeView()
}
