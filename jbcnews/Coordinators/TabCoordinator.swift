//
//  TabCoordinator.swift
//  jbcnews
//
//  Created by cagla copuroglu on 22.11.2022.
//

import UIKit
import NewsKit

enum TabBarPage {
    case ready
    case steady
    
    init?(index: Int) {
        switch index {
        case 0:
            self = .ready
        case 1:
            self = .steady
        default:
            return nil
        }
    }
    
    func pageTitleValue() -> String {
        switch self {
        case .ready:
            return "Ready"
        case .steady:
            return "Steady"
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .ready:
            return 0
        case .steady:
            return 1
        }
    }
    
    // Add tab icon value
    
    // Add tab icon selected / deselected color
    
    // etc
}


protocol TabCoordinatorProtocol: Coordinator {
    var tabBarController: UITabBarController { get set }
    
    func selectPage(_ page: TabBarPage)
    
    func setSelectedIndex(_ index: Int)
    
    func currentPage() -> TabBarPage?
}

class TabCoordinator: NSObject, Coordinator {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    var tabBarController: UITabBarController
    
    var type: CoordinatorType { .tab }
    let service = NetworkService()
    
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.tabBarController = .init()
    }
    
    func start() {
        // Let's define which pages do we want to add into tab bar
        let pages: [TabBarPage] = [.steady, .ready]
            .sorted(by: { $0.pageOrderNumber() < $1.pageOrderNumber() })
        
        // Initialization of ViewControllers or these pages
        let controllers: [UINavigationController] = pages.map({ getTabController($0) })
        
        prepareTabBarController(withTabControllers: controllers)
    }
    
    deinit {
        print("TabCoordinator deinit")
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        /// Set delegate for UITabBarController
        tabBarController.delegate = self
        /// Assign page's controllers
        tabBarController.setViewControllers(tabControllers, animated: true)
        /// Let set index
        tabBarController.selectedIndex = TabBarPage.ready.pageOrderNumber()
        /// Styling
        tabBarController.tabBar.isTranslucent = false
        
        /// In this step, we attach tabBarController to navigation controller associated with this coordanator
        navigationController.viewControllers = [tabBarController]
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        
        navController.tabBarItem = UITabBarItem.init(title: page.pageTitleValue(),
                                                     image: nil,
                                                     tag: page.pageOrderNumber())
        
        switch page {
        case .ready:
            // If needed: Each tab bar flow can have it's own Coordinator.
            let vc = NewsViewController()
            vc.viewModel = NewsViewModel(service: service)
            vc.didSendEventClosure = { [weak self] event in
                switch event {
                case .ready:
                    self?.selectPage(.steady)
                    
                }
            }
            
            navController.pushViewController(vc, animated: true)
        case .steady:
            let steadyVC = SteadyViewController()
            steadyVC.didSendEventClosure = { [weak self] event in
                switch event {
                case .steady:
                    self?.selectPage(.ready)
                }
            }
            
            navController.pushViewController(steadyVC, animated: true)
            
            
        }
            return navController
        
    }
        
        func currentPage() -> TabBarPage? { TabBarPage.init(index: tabBarController.selectedIndex) }
        
        func selectPage(_ page: TabBarPage) {
            tabBarController.selectedIndex = page.pageOrderNumber()
        }
        
        func setSelectedIndex(_ index: Int) {
            guard let page = TabBarPage.init(index: index) else { return }
            
            tabBarController.selectedIndex = page.pageOrderNumber()
        }
    
}

// MARK: - UITabBarControllerDelegate
extension TabCoordinator: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          didSelect viewController: UIViewController) {
        // Some implementation
    }
}
