//
//  NewsViewModel.swift
//  jbcnews
//
//  Created by cagla copuroglu on 20.08.2022.
//

import NewsKit

enum NewsViewRoute {
    case detail(NewsDetailViewModelProtocol)
}

protocol NewsViewModelOutputProtocol: AnyObject {
    var delegate: NewsViewModelDelegate? { get set }
}

enum NewsViewModelOutput {
    case updateTitle(String)
}

protocol NewsViewModelDelegate: AnyObject  {
    func navigate(to route: NewsViewRoute)
    func handleViewModelOutput(_ output: NewsViewModelOutput)
}



final class NewsViewModel: NewsViewModelOutputProtocol {
    
    private let service: ServiceProtocol
    weak var delegate: NewsViewModelDelegate?
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    

    private func notify(_ output: NewsViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }

    

}
