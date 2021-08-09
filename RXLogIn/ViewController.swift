//
//  ViewController.swift
//  RXLogIn
//
//  Created by Марина Айбулатова on 09.08.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

  private let loginView = LoginView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "Log in"
    title = "Log in"
    navigationController?.title = "Log in"
    
    
    view.addSubview(loginView.mainView)
    loginView.mainView.snp.makeConstraints { (make) in
      make.left.equalToSuperview()
      make.right.equalToSuperview()
      make.bottom.equalToSuperview()
      make.top.equalToSuperview()
    }
  }


}

