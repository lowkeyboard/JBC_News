//
//  OnboardViewController.swift
//  jbcnews
//
//  Created by cagla copuroglu on 17.08.2022.
//

import UIKit

class OnboardViewController: UIViewController {
    var coordinator: MainCoordinator?
    let button = UIButton()
    
    lazy var snapView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .purple
        view.layer.opacity = 0.7
        return view
    }()
  
    lazy var snapLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Medium", size: 22)
        label.text = "Skip to News"
        label.textColor = .white
        return label
    }()
    
    lazy var snapBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("CLICK", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(snapView)
        snapView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(200)
        }
        
        self.snapView.addSubview(snapLabel)
        snapLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }
        
        self.snapView.addSubview(snapBtn)
        snapBtn.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().offset(-30)
            make.height.equalTo(60)
        }
        
        snapBtn.addTarget(self, action: #selector(self.buttonAction(sender:)), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton) {
      print("signUpbuttonAction tapped")
        self.coordinator?.navigateToNews()
    }



}
