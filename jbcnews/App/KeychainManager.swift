//
//  SessionManager.swift
//  jbcnews
//
//  Created by cagla copuroglu on 10.11.2022.
//

import Security
import Foundation

class KeychainManager {

    public init () {}
    
    func save(value: String) {
        let query = [
            kSecValueData: value.data(using: .utf8)!,
            kSecAttrAccount: "username",
            kSecClass: kSecClassGenericPassword
        ] as CFDictionary
        
        let durum = SecItemAdd(query, nil)
        print(durum)
    }
    
    func read() -> String {
        let query = [
            kSecAttrAccount: "username",
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var ref: AnyObject? = nil
        let status = SecItemCopyMatching(query, &ref)
        var val = ""
        
        if status == 0 {
            val = String(data: ref as! Data, encoding: .utf8) ?? ""
        }
        
        return val

    }
}
