//
//  ViewController.swift
//  RXLogIn
//
//  Created by Марина Айбулатова on 09.08.2021.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

 private let loginView = LoginView()
  
  //MARK: - rx
  private let disposeBag = DisposeBag()
  private var viewModel = LoginViewModel()
  
  //MARK: - ui
  weak var emailTextField: UITextField!
  weak var passwordTextField: UITextField!
  weak var logInButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
 
    setView()
    bind()
  }
  
  override func loadView() {
    let view = LoginView()
    self.emailTextField = view.emailTextField
    self.passwordTextField = view.passwordTextField
    self.logInButton = view.logInButton
    
    self.view = view
  }
  
  //MARK: - view
  private func setView() {
    title = "Log in"
    emailTextField.delegate = self
    logInButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
  }

  //MARK: - bind
  func bind() {
    emailTextField.rx.text
      .orEmpty
      .bind(to: viewModel.emailRelay)
      .disposed(by: disposeBag)
    
    passwordTextField.rx.text
      .orEmpty
      .bind(to: viewModel.passwordRelay)
      .disposed(by: disposeBag)

    viewModel.validation()
      .bind(to: self.logInButton.rx.isEnabled)
      .disposed(by: disposeBag)
  }

//  //MARK: - actions
  @objc func buttonTapped(_ sender: UIButton) {
    print("tap here")
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    passwordTextField.becomeFirstResponder()
  }
}
