//
//  ViewController.swift
//  App-BDE-iOS
//
//  Created by Nicolas Barbosa on 08/10/2020.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var mailTextField = UITextField()
    lazy var passwordTextField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mailTextField)
        self.view.addSubview(passwordTextField)
        
        
        mailTextField.placeholder = "test"
        mailTextField.snp.makeConstraints { make in
           make.width.height.equalTo(100)
           make.center.equalTo(self.view)
        }
        
        passwordTextField.placeholder = "test"
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(mailTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
    
    
}

