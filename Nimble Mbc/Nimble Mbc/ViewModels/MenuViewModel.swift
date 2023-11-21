//
//  MenuViewModel.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/10/23.
//

import Foundation
import Combine
import SwiftKeychainWrapper

class MenuViewModel: ObservableObject, Identifiable{
    private var usersService: UserServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    @Published private(set) var finishApp = false
    
    init(usersService: UserServiceProtocol = UserService()) {
        self.usersService = usersService
    }
    
    func onSingOutClick(){
        if let dataObject = KeychainWrapper.standard.data(forKey: ConstantKeys.USER_DATA) {
            do {
                let decoder = JSONDecoder()
                let dataLogin = try decoder.decode(DataLogin.self, from: dataObject)
                
                let logout = Logout(token: dataLogin.data.attributes.access_token,
                                    client_id: KeychainWrapper.standard.string(forKey: ConstantKeys.CLIENT_ID) ?? "",
                                    client_secret: KeychainWrapper.standard.string(forKey: ConstantKeys.CLIENT_SECRET) ?? "")
                self.usersService.logout(logoutUser: logout)
                    .receive(on: DispatchQueue.main)
                    .sink { completion in
                        switch completion{
                            case .failure(let error):
                                print(error.localizedDescription)
                            case .finished: break
                        }
                    } receiveValue: { data in
                        KeychainWrapper.standard.removeObject(forKey: ConstantKeys.USER_DATA)
                        self.finishApp = true
                    }
                    .store(in: &cancellables)
                
            } catch {
                print("Error parse JSON")
            }
            
        }
    }
}
