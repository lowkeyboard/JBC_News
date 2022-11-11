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
            kSecValueData: "eklenen deger".data(using: .utf8)!,
            kSecAttrAccount: "kullanici adi",
            kSecClass: kSecClassGenericPassword
        ] as CFDictionary
        
        let durum = SecItemAdd(query, nil)
        print(durum)
    }
    
    func read() {
        let query = [
            kSecAttrAccount: "kullanici adi",
            kSecClass: kSecClassGenericPassword,
            kSecReturnData: true
        ] as CFDictionary
        
        var ref: AnyObject? = nil
        let durum = SecItemCopyMatching(query, &ref)
        
        if durum == 0 {
            let deger = String(data: ref as! Data, encoding: .utf8)
            print(deger)
        }

    }
}
