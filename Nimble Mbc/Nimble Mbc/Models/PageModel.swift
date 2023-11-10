//
//  PageModel.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/5/23.
//

import Foundation

struct PageModel: Identifiable {
    let id = UUID()
    var background: String
    var indexDot: Int8
    var title: String
    var paragraph: String
    var dots: Int8
    var action: Bool
    var tag: Int
    
    static var homeSample = PageModel(background: "homeWorking", indexDot: 0,
                                      title: "Working from home Check-In",
                                      paragraph: "We would like to know how you feel about our work from home (WFH) experience.",
                                      dots: 3, action: true, tag: 0)
    
    static var homePages: [PageModel] = [
        PageModel(background: "homeWorking", indexDot: 0,
                  title: "Working from home Check-In",
                  paragraph: "We would like to know how you feel about our work from home (WFH) experience.",
                  dots: 3, action: true, tag: 0),
        PageModel(background: "homeCareer", indexDot: 1,
                  title: "Career training and development",
                  paragraph: "We would like to know what are your goals and skills you wanted to learn.",
                  dots: 3, action: false, tag: 1),
        PageModel(background: "homeInclusion", indexDot: 2,
                  title: "Inclusion and belonging",
                  paragraph: "Building a workplace culture that prioritizes belonging and inclusion...",
                  dots: 3, action: false, tag: 2)]
}
