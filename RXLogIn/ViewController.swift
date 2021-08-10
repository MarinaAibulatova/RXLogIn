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
  
  override func viewDidLoad() {
    super.viewDidLoad()
 
    title = "Log in"
 
    setView()
    bind()
  }
  
  //MARK: - view
  private func setView() {
    view.addSubview(loginView.mainView)
    loginView.mainView.snp.makeConstraints { (make) in
      make.left.equalToSuperview()
      make.right.equalToSuperview()
      make.bottom.equalToSuperview()
      make.top.equalToSuperview()
    }
    loginView.emailTextField.delegate = self
    loginView.logInButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
  }
  
  private func updateView(validation: Bool) {
    self.loginView.logInButton.isEnabled = validation
    self.loginView.logInButton.backgroundColor = validation ? UIColor.systemBlue: UIColor.systemGray6
    self.loginView.logInButton.setTitleColor(validation ? UIColor.white: UIColor.systemBlue, for: .normal)
  }
  
  //MARK: - bind
  func bind() {
    let email = loginView.emailTextField.rx.text.orEmpty.asObservable()
    let password = loginView.passwordTextField.rx.text.orEmpty.asObservable()

    viewModel.validation(email: email, password: password)
      .bind{ [weak self] (isEnable) in
        self?.updateView(validation: isEnable)
      }.disposed(by: disposeBag)
  }
  
  //MARK: - actions
  @objc func buttonTapped(_ sender: UIButton) {
    loginView.logInButton.showsTouchWhenHighlighted = true
    print("tap here")
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    loginView.passwordTextField.becomeFirstResponder()
  }
}
