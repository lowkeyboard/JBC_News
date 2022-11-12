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

protocol NewsViewModelProtocol: AnyObject {
    var delegate: NewsViewModelDelegate? { get set }
    func load()
    func selectNews(at index: Int)
}

enum NewsViewModelOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showNewsList([NewsPresentation])
}

protocol NewsViewModelDelegate: AnyObject  {
    func navigate(to route: NewsViewRoute)
    func handleViewModelOutput(_ output: NewsViewModelOutput)
}



final class NewsViewModel: NewsViewModelProtocol {
    
    weak var coordinator: FeedCoordinator?
    private let service: ServiceProtocol
    weak var delegate: NewsViewModelDelegate?
    private var news: [Datum] = []

    init(service: ServiceProtocol) {
        self.service = service
    }
    

    
    func load() {

        notify(.updateTitle("Top News"))
        notify(.setLoading(true))
        
        service.requestTopStories(authKey: "WCCZ8CWNffEeeZEfHzbuW1vdc5sXFYQRmhOmNHnC") { [weak self] results in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            self.news = results.data
            let presentations = self.news.map({NewsPresentation(news: $0)})
                self.notify(.showNewsList(presentations))

        } failure: { error in
            print(error ?? "Error occured with pokemon service.")
        }


    }

    func selectNews(at index: Int) {
        print("news at \(index) has selected")
        self.coordinator?.navigateToDetail(index: index)

    }

    private func notify(_ output: NewsViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
    

    

}
