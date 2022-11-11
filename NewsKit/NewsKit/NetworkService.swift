//
//  NetworkService.swift
//  NewsKit
//
//  Created by cagla copuroglu on 8.11.2022.
//

import Foundation
import Alamofire

public class NetworkService: ServiceProtocol {
    
    public init() {}
        
    
    public func requestHeadlines(authApiKey: String) {
        
    }
    
    public func requestTopStories(authApiKey: String) {
        
    }
    
    public func requestAllNews(authApiKey: String) {
        
    }
    
    public func requestSimilarNews(authApiKey: String) {
        
    }
    
        
    public func requestAuth(success: @escaping (DataResponse<String, AFError>) -> Void, failure: @escaping (Error?) -> Void) {
        
        let url = URL(string: Service.authUrl)!
        
        AF.request(url, method: .get, parameters: .none).validate().responseDecodable(of: AuthModelResponse.self) { response in
            let propertyResponse = response.map { $0.newsApiKey }
            debugPrint(propertyResponse)
            success(propertyResponse)
        }

        
    }
    
    public func requestX(authApiKey: String, success: @escaping (XModelResponse) -> Void, failure: @escaping (Error?) -> Void) {
        //implementation of method here.
        
//        guard let data = model.value else {
//            print(model.response ?? "")
//            return
//        }
//        success(data)

    }
}
