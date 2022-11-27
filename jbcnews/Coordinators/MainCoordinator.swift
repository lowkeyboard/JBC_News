//
//  MainCoordinator.swift
//  jbcnews
//
//  Created by cagla copuroglu on 17.08.2022.
//

import UIKit
import NewsKit

protocol FlowProtocol: Coordinator {
    func showOnboardingFlow()
    func showInAppFlow()
}

class MainCoordinator: FlowProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate? = nil
    var navigationController: UINavigationController
    var childCoordinators = [Coordinator]()
    var type: CoordinatorType { .app }
    
    let service = NetworkService()

    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        //TODO: add isOnboardingCompleted and set flows accordingly
        showOnboardingFlow()
    }
    
    func showOnboardingFlow() {
        let vc = OnboardViewController()
        vc.coordinator = self
        vc.didSendEventClosure = { [weak self] event in
            switch event {
            case .onboard:
                self?.showInAppFlow()
            }
        }
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showInAppFlow() {
        let tabCoordinator = TabCoordinator.init(navigationController)
        tabCoordinator.finishDelegate = self
        tabCoordinator.start()
        childCoordinators.append(tabCoordinator)
    }


    func navigateToNews() {
        let vc = NewsViewController()
        vc.viewModel = NewsViewModel(service: service)

        navigationController.pushViewController(vc, animated: true)

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

extension MainCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })

        switch childCoordinator.type {
        case .tab:
            navigationController.viewControllers.removeAll()

            showOnboardingFlow()
        case .login:
            navigationController.viewControllers.removeAll()

            showInAppFlow()
        default:
            break
        }
    }
}

