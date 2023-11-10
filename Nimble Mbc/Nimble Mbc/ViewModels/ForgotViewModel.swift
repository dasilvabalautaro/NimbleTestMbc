//
//  ForgotViewModel.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/9/23.
//

import Foundation
import Combine

class ForgotViewModel: ObservableObject, Identifiable {
    private var uiState = UserUIState()
    private var usersService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    @Published private(set) var messageAlert = MessageAlert()
    
    init(usersService: UserServiceProtocol = UserService()) {
        self.usersService = usersService
    }
    
    func onEmailChange(newValue: String) {
        uiState.email = newValue
    }
    
    func onForgotClick(){
        if (!uiState.email.isValidEmail()) {
            messageAlert.text = "Please insert a valid email."
            messageAlert.type = .error
            return
        }
        
        
        let userEmail = UserEmail(email: uiState.email)
        let forgot = Forgot(user: userEmail, client_id: ConstantKeys.CLIENT_ID,
                            client_secret: ConstantKeys.CLIENT_SECRET)
        self.usersService.forgot(forgotUser: forgot)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion{
                    case .failure(let error):
                        self.messageAlert.text = error.localizedDescription
                        self.messageAlert.type = .error
                    case .finished: break
                }
            } receiveValue: { data in
                self.messageAlert.text = "If your email address exists in our database, you will receive a password recovery link at your"
                self.messageAlert.type = .success
            }
            .store(in: &cancellables)
       
    }
}
