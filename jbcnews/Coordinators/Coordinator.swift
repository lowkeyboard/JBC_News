//
//  Coordinator.swift
//  jbcnews
//
//  Created by cagla copuroglu on 17.08.2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    var children: [Coordinator]? { get set } // to control coordinators as if they're child coordinators.
    func start()
}
