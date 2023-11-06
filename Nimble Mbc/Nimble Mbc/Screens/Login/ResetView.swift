//
//  ResetView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/4/23.
//

import SwiftUI

struct ResetView: View {
    enum Field {
        case email
    }
    
    @EnvironmentObject var navigationCoordinator: Coordinator
    
    @State private var email = String()
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack {
            Image("back", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Button() {
                        navigationCoordinator.goBack()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 24)
                            .foregroundColor(Color.surface)
                    }
                    Spacer()
                }
                .padding([.top], 10)
                
                Image("logo", bundle: .main)
                    .resizable()
                    .frame(width: 201, height: 48)
                    .padding([.top], 141)
                
                Text("Enter your email to receive instructions for resetting your password.")
                    .multilineTextAlignment(.center)
                    .frame(height: 56)
                    .font(Font.custom("NeuzeitSLT-Book", size: 17))
                    .foregroundColor(Color.white)
                    .padding([.top], 24)
                
                TextField("Email", text: $email)
                .focused($focusedField, equals: .email)
                .onChange(of: focusedField) { [oldFocus = focusedField] newFocus in
                    guard oldFocus == .email, newFocus != .email else { return }
//                    self.viewModel.onEmailChange(newValue: email)
                }
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .submitLabel(.next)
                .textContentType(.emailAddress)
                .frame(height: 56)
                .font(Font.custom("NeuzeitSLT-BookRegular", size: 17))
                .foregroundColor(.white)
                .padding([.leading], 12)
                .background(Color.backgroundTextField)
                .cornerRadius(15)
                .padding([.top], 90)
                
                Button {
                    
                } label: {
                    Text("Reset")
                        .frame(width: 343, height: 56)
                        .font(Font.custom("NeuzeitSLT-BookHeavy", size: 17))
                        .foregroundColor(Color.black)
                }
                .background(.white)
                .cornerRadius(15)
                .padding([.top], 20)
                
                Spacer()
            }
        }
        .frame(width: 343)
    }
}

#Preview {
    ResetView()
}
