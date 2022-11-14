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
        
        
    public func requestTopStories(authKey: String, success: @escaping (TopStoriesModel) -> Void, failure: @escaping (Error?) -> Void) {
        let url = Service.newsUrl
        
        let params: [String:String] = [
            "api_token": authKey
        ]
                
        AF.request(url, method: .get, parameters: params).validate().responseDecodable(of: TopStoriesModel.self) { (model) in
            guard let data = model.value else {
                print(model.response ?? "")
                return
            }
            success(data)
        }

    }
    
    public func requestAllNews(authKey: String) {
        
    }
    
    public func requestSimilarNews(authKey: String) {
        
    }
    
        
    public func requestAuth(success: @escaping (DataResponse<String, AFError>) -> Void, failure: @escaping (Error?) -> Void) {
        
        let url = URL(string: Service.authUrl)!
        
        AF.request(url, method: .get, parameters: .none).validate().responseDecodable(of: AuthModelResponse.self) { response in
            let propertyResponse = response.map { $0.newsApiKey }
            debugPrint(propertyResponse)
            success(propertyResponse)
        }

        
    }
    
}
