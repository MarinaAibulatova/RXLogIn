//
//  ViewController.swift
//  RXLogIn
//
//  Created by Марина Айбулатова on 09.08.2021.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

  private let loginView = LoginView()
  
  //MARK: - rx
  private let disposeBag = DisposeBag()
  private var viewModel = LoginViewModel()
  
  var emailSubject = BehaviorSubject<String>(value: "")
  
  override func viewDidLoad() {
    super.viewDidLoad()
 
    title = "Log in"
 
    setView()
    
    loginView.emailTextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.emailSubject).disposed(by: disposeBag)
    loginView.passwordTextField.rx.text.map { $0 ?? "" }.bind(to: viewModel.passwordSubject).disposed(by: disposeBag)
     
    viewModel.isValid().bind(to: loginView.logInButton.rx.isEnabled).disposed(by: disposeBag)
    
    viewModel.isValid().bind {(isEnable) in
      self.loginView.logInButton.backgroundColor = isEnable ? UIColor.systemBlue: UIColor.systemGray6
      self.loginView.logInButton.setTitleColor(isEnable ? UIColor.white: UIColor.systemBlue, for: .normal)
    }.disposed(by: disposeBag)
    
  }
  
  //MARK: - set view
  private func setView() {
    view.addSubview(loginView.mainView)
    loginView.mainView.snp.makeConstraints { (make) in
      make.left.equalToSuperview()
      make.right.equalToSuperview()
      make.bottom.equalToSuperview()
      make.top.equalToSuperview()
    }
   
    loginView.logInButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
  }
  
  @objc func buttonTapped(_ sender: UIButton) {
    print("tap here")
  }



}

