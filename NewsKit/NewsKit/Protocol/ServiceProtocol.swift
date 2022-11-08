//
//  ServiceProtocol.swift
//  NewsKit
//
//  Created by cagla copuroglu on 8.11.2022.
//


public protocol ServiceProtocol {

    func requestX( parameter: String, success: @escaping (_ model: XModelResponse) -> Void, failure: @escaping (_ error: Error?) -> Void )
    
}
