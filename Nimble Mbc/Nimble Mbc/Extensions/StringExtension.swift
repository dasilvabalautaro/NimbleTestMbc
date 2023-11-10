//
//  StringExtension.swift
//  Nimble Mbc
//
//  Created by David Silva on 11/8/23.
//

import Foundation
import SwiftUI

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format:"SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
    
//    func isValidPassword() -> Bool {
//        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
//        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
//    }
    
    func isValidPassword() -> Bool {
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: self)){
            return false //One UpperCase
        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: self)){
            return false // One Digit
        }

        if(!NSPredicate(format:"SELF MATCHES %@", ".*[!&^%$#@*_()/]+.*").evaluate(with: self)){
            return false // One Symbol
        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: self)){
            return false //One LowerCase
        }
        
        if(self.count < 8){
            return false //min 8 characters total
        }
        return true
    }

}
