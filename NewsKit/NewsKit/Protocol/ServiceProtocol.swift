//
//  ServiceProtocol.swift
//  NewsKit
//
//  Created by cagla copuroglu on 8.11.2022.
//

import Alamofire

public protocol ServiceProtocol {

    func requestX( authKey: String, success: @escaping (_ model: XModelResponse) -> Void, failure: @escaping (_ error: Error?) -> Void )
    
    func requestHeadlines(authApiKey: String)
    
    func requestTopStories(authApiKey: String)
    
    func requestAllNews(authApiKey: String)
    
    func requestSimilarNews(authApiKey: String)

    
    func requestAuth( success: @escaping (DataResponse<String, AFError>) -> Void, failure: @escaping (Error?) -> Void)
    
}
