//
//  MainCoordinator.swift
//  jbcnews
//
//  Created by cagla copuroglu on 17.08.2022.
//

import UIKit
import NewsKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var children: [Coordinator]?
    var childCoordinators = [Coordinator]()
    var feedCoordinator: FeedCoordinator?
    let service = NetworkService()

    init(navigationController: UINavigationController, feedCoordinator: FeedCoordinator) {
        self.navigationController = navigationController
        self.feedCoordinator = feedCoordinator
    }

    func start() {
        let vc = OnboardViewController()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: false)

    }


    func navigateToNews() {
        let vc = NewsViewController()
//        vc.viewModel = HomeViewModel(service: service, coordinator: feedCoordinator!)
        vc.viewModel = NewsViewModel(service: service)

        navigationController?.pushViewController(vc, animated: true)

    }

    // details
    func navigateToNewsDetail() {
        let child = FeedCoordinator(navigationController: navigationController!)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }

    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }

    }

}
