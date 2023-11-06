//
//  StepsView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/5/23.
//

import SwiftUI

struct StepsView: View {
    var options = Survey.fulfilled.rawValue
    var typeImg = 0
    let groupsImages: [[String]] = [["icoHandActive", "icoHandDesactive"],
                                    ["icoHearthLife", "icoHearthDead"],
                                    ["icoStartActivate", "icoStartDeactivate"]]
    let optionsSpace: [String] = ["Yes", "No"]
    let optionsTitles: [String] = ["How fulfilled did you feel during this WFH period?",
                                   "How did WFH change your productivity?",
                                   "I have a separate space to work (room or living room).", "Question NPS", "Question Multi Choice"]
    @EnvironmentObject var navigationCoordinator: Coordinator
//    @Environment(\.dismiss) var dismiss

    @State private var selectPeriod = "Very fulfilled"
    @State private var countVotes = 0
    @State private var indexImages = 0
    @State private var qualify = ""
    @State private var selectSpace = ""
    @State private var countPoints = 0
    @State private var labelOption = ""
    @State private var title = ""
    @State private var showingAlert = false
    @State private var removeScreen = 0
    
    var body: some View {
        ZStack {
            Image("homeWorking", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0){
                HStack{
                    Spacer()
                    Button() {
                        self.showingAlert = true
                    } label: {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color.surface)
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Warning!"),
                            message: Text("Are you sure you want to quit the survey?"),
                            primaryButton: .default(
                                Text("Yes"),
                                action: { navigationCoordinator.goBack(step: removeScreen) }
                            ),
                            secondaryButton: .destructive(
                                Text("Cancel"),
                                action: {}
                            )
                        )
                    }
                }
                
                Text(labelOption)
                    .frame(width: 343, alignment: .leading)
                    .font(Font.custom("NeuzeitSLT-Book", size: 17))
                    .foregroundColor(Color.white)
                    .padding([.top], 30)
                
                Text(title)
                    .lineLimit(3)
                    .frame(width: 343, alignment: .leading)
                    .font(Font.custom("NeuzeitSLT-BookHeavy", size: 34))
                    .foregroundColor(Color.white)
                    .padding([.top], 30)
                
                switch options {
                    case 1:
                        PickerView(selectOption: $selectPeriod)
                            .padding([.top], 40)
                    case 2:
                        VoteView(countVotes: $countVotes, imgActive: groupsImages[indexImages][0], imgDeactive: groupsImages[indexImages][1])
                            .padding([.top], 130)
                    case 3:
                        QualifyView(qualify: $qualify)
                            .padding([.top], 130)
                    case 4:
                        PickerView(selectOption: $selectSpace, options: optionsSpace)
                            .padding([.top], 40)
                    case 5:
                        QuestionView(countPoints: $countPoints)
                            .padding([.top], 130)
                    case 6:
                        ChoiseView()
                            .padding([.top], 130)
                    default:
                        EmptyView()
                }
                
                
                Spacer()
                
                HStack{
                    Spacer()
                    if options < 5 {
                        Button() {
                            if options == 1 {
                                navigationCoordinator.goProductivity()
                            }
                            if options == 2 {
                                navigationCoordinator.goPlace()
                            }
                            if options == 4 {
                                navigationCoordinator.goQuestion()
                            }
                            
                        } label: {
                            Image("icoAction", bundle: .main)
                                .resizable()
                                .frame(width: 56, height: 56)
                        }
                    }
                    else {
                        Button {
                            
                        } label: {
                            Text("Submit")
                                .font(Font.custom("NeuzeitSLT-BookHeavy", size: 17))
                                .foregroundColor(Color.black)
                        }
                        .frame(width: 120, height: 56)
                        .background(.white)
                        .cornerRadius(15)
                    }
                    
                }
                .frame(width: 343)
                
            }
            .frame(width: 343)
            .padding([.top], 60)
            .padding([.bottom], 60)
        }
        .onAppear(){
            indexImages = typeImg > 2 ? 0: typeImg
            removeScreen = options < 3 ? options : options - 1
            labelOption = "\(removeScreen)/5"
            title = optionsTitles[removeScreen - 1]
            
        }
        
    }
}

#Preview {
    StepsView(options: Survey.choice.rawValue)
}
