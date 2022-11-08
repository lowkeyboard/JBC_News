//
//  NetworkService.swift
//  NewsKit
//
//  Created by cagla copuroglu on 8.11.2022.
//

import Foundation
import Alamofire

public class NetworkService: ServiceProtocol {
    public func requestX(parameter: String, success: @escaping (XModelResponse) -> Void, failure: @escaping (Error?) -> Void) {
        //implementation of method here.
        
//        guard let data = model.value else {
//            print(model.response ?? "")
//            return
//        }
//        success(data)

    }
}
