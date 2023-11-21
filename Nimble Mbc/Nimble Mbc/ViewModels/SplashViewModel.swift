//
//  SplashViewModel.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/8/23.
//

import Foundation
import Combine
import SwiftKeychainWrapper

class SplashViewModel: ObservableObject, Identifiable {
    @Published private(set) var statusUser: StatusUser = .unauthenticated
    @Published private(set) var finishProcess = false
    private var usersService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    private let pwd = "It@pallu123qwe"
    
    init(usersService: UserServiceProtocol = UserService()) {
        self.usersService = usersService
    }
    
    public func onAppear() {
        if !self.verifyRegister(){
            self.register()
            self.statusUser = .unauthenticated
        }
        else if self.verifyToken() {
            self.refreshToken()
            self.statusUser = .authenticated
        }
        else {
            self.statusUser = .unauthenticated
            self.delayFinish()
        }
        
    }
    
    private func register(){
        self.setDoor()
        let user = User(email: ConstantKeys.NEW_USER_EMAIL,
                        name: ConstantKeys.NEW_USER_NAME,
                        password: self.pwd,
                        password_confirmation: self.pwd)
        let postUser = PostUser(
            user: user,
            client_id: KeychainWrapper.standard.string(forKey: ConstantKeys.CLIENT_ID) ?? "",
            client_secret: KeychainWrapper.standard.string(forKey: ConstantKeys.CLIENT_SECRET) ?? "")
        self.usersService.add(postUser: postUser)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .failure(let error):
                        print(error)
                    case .finished: break
                }
            } receiveValue: { value in
                print("\(value)")
                self.delayFinish()
            }
            .store(in: &cancellables)
        
    }
    
    private func verifyRegister() -> Bool{
        if (KeychainWrapper.standard.string(forKey: ConstantKeys.USER_EMAIL) != nil) {
            return true
        }
        return false
    }

    private func verifyToken() -> Bool{
        if (KeychainWrapper.standard.data(forKey: ConstantKeys.USER_DATA) != nil) {
            return true
        }
        return false
    }
    
    private func refreshToken(){
        if let dataObject = KeychainWrapper.standard.data(forKey: ConstantKeys.USER_DATA) {
            do {
                let decoder = JSONDecoder()
                let dataLogin = try decoder.decode(DataLogin.self, from: dataObject)
                
                let bodyRefresh = Refresh(grant_type: "refresh_token",
                                          refresh_token: dataLogin.data.attributes.refresh_token,
                                          client_id: KeychainWrapper.standard.string(forKey: ConstantKeys.CLIENT_ID) ?? "",
                                          client_secret: KeychainWrapper.standard.string(forKey: ConstantKeys.CLIENT_SECRET) ?? "")
                self.usersService.refresh(refreshToken: bodyRefresh)
                    .receive(on: DispatchQueue.main)
                    .sink { completion in
                        switch completion{
                            case .failure(let error):
                                print(error.localizedDescription)
                            case .finished: break
                        }
                    } receiveValue: { data in
                        KeychainWrapper.standard.set(data, forKey: ConstantKeys.USER_DATA)
                        self.delayFinish()
                    }
                    .store(in: &cancellables)
            } catch {
                print("Error parse JSON")
            }
            
        }
    }
    
    private func delayFinish(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.finishProcess = true
        }
    }
    
    private func setDoor(){
        KeychainWrapper.standard.set("ofzl-2h5ympKa0WqqTzqlVJUiRsxmXQmt5tkgrlWnOE", forKey: ConstantKeys.CLIENT_ID)
        KeychainWrapper.standard.set("lMQb900L-mTeU-FVTCwyhjsfBwRCxwwbCitPob96cuU", forKey: ConstantKeys.CLIENT_SECRET)
        
    }
}
