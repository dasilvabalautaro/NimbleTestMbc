//
//  LoginView.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/4/23.
//

import SwiftUI

struct LoginView: View {
    enum Field {
        case email
        case password
    }
    
    @EnvironmentObject var navigationCoordinator: Coordinator
    @State private var email = String()
    @State private var password = String()
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack {
            Image("back", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                VStack{
                    Image("logo", bundle: .main)
                        .resizable()
                        .frame(width: 201, height: 48)
                        .padding([.top], 153)
                    
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
                    .padding([.top], 149)
                }
                .frame(width: 343)
                
                HStack{
                    SecureField("Password", text: $password)
                        .focused($focusedField, equals: .password)
                        .keyboardType(.alphabet)
                        .submitLabel(.done)
                        .frame(height: 56)
                        .font(Font.custom("NeuzeitSLTStd-Book", size: 17))
                        .foregroundColor(.white)
                        .padding([.leading], 12)
                        .textContentType(.newPassword)
                    Spacer()
                    Text("Forgot?")
                        .frame(height: 56)
                        .font(Font.custom("NeuzeitSLT-Book", size: 17))
                        .foregroundColor(Color.placeholder)
                        .padding([.trailing], 12)
                        .onTapGesture {
                            navigationCoordinator.goReset()
                        }
                }
                .frame(width: 343, height: 56)
                .background(Color.backgroundTextField)
                .cornerRadius(15)
                .padding([.top], 20)
                
                Button {
                    navigationCoordinator.goLoad()
                } label: {
                    Text("Log in")
                        .frame(width: 343, height: 56)
                        .font(Font.custom("NeuzeitSLT-BookHeavy", size: 17))
                        .foregroundColor(Color.black)
                }
                .background(.white)
                .cornerRadius(15)
                .padding([.top], 20)
                
                Spacer()
            }
            .onSubmit {
                switch focusedField {
                case .email:
                    focusedField = .password
                case .password:
                        break
//                    self.viewModel.onPasswordChange(newValue: password)
                default:
                    break
                }
            }
        }
        
    }
}

#Preview {
    LoginView()
}
