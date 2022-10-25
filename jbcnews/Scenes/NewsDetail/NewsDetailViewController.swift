//
//  NewsDetailViewController.swift
//  jbcnews
//
//  Created by cagla copuroglu on 17.08.2022.
//

import UIKit

class NewsDetailViewController: UIViewController {
    
    var index: Int
    
    init(index: Int) {
        self.index = index
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    
    override func viewDidLoad() {
        self.title = "\(index)"
    }
    
}
