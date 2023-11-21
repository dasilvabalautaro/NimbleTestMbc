//
//  UserViewModel.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/8/23.
//

import Foundation
import Combine
import SwiftKeychainWrapper

class UserViewModel: ObservableObject, Identifiable{
    private var uiState = UserUIState()
    @Published private(set) var messageAlert = MessageAlert()
    private var usersService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(usersService: UserServiceProtocol = UserService()) {
        self.usersService = usersService
    }
    
    func onEmailChange(newValue: String) {
        uiState.email = newValue
    }
    
    func onSetPassword(newValue: String) {
        uiState.password = newValue
    }
    
    func onSignInClick(){
        if (!uiState.email.isValidEmail()) {
            messageAlert.text = "Please insert a valid email."
            messageAlert.type = .error
            return
        }
        
        if (!uiState.password.isValidPassword()) {
            messageAlert.text = "Please verify the security of password."
            messageAlert.type = .error
            return
        }
        
        let login = Login(grant_type: "password", email: uiState.email,
                          password: uiState.password, 
                          client_id: KeychainWrapper.standard.string(forKey: ConstantKeys.CLIENT_ID) ?? "",
                          client_secret: KeychainWrapper.standard.string(forKey: ConstantKeys.CLIENT_SECRET) ?? "")
        self.usersService.login(loginUser: login)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                    case .failure(let error):
                        self.messageAlert.text = error.localizedDescription
                        self.messageAlert.type = .error
                    case .finished: break
                }
            } receiveValue: { [weak self] data in
                KeychainWrapper.standard.set(data, forKey: ConstantKeys.USER_DATA)
                KeychainWrapper.standard.set(self?.uiState.email ?? "", forKey: ConstantKeys.USER_EMAIL)
                
                self?.messageAlert.text = "Welcome..."
                self?.messageAlert.type = .success
                
            }
            .store(in: &cancellables)
    }
    
}
