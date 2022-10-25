//
//  FeedCoordinator.swift
//  jbcnews
//
//  Created by cagla copuroglu on 17.08.2022.
//

import UIKit

class FeedCoordinator: Coordinator {
    var children: [Coordinator]?
    var navigationController: UINavigationController?
    weak var parentCoordinator: MainCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {

    }

    func navigateToDetail(index: Int) {
        let vc = NewsDetailViewController(index: index)

        self.navigationController?.show(vc, sender: self)
    }

    func navigateToSignIn() {
        parentCoordinator?.childDidFinish(self)
    }

}
