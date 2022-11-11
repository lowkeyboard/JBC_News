//
//  ServiceProtocol.swift
//  NewsKit
//
//  Created by cagla copuroglu on 8.11.2022.
//

import Alamofire

public protocol ServiceProtocol {

    func requestAuth( success: @escaping (DataResponse<String, AFError>) -> Void, failure: @escaping (Error?) -> Void)

    func requestTopStories(authKey: String, success: @escaping (TopStoriesModel) -> Void, failure: @escaping (Error?) -> Void)
    
    func requestAllNews(authKey: String)
    
    func requestSimilarNews(authKey: String)
    
}
