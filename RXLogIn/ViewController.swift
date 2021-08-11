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
  weak var scrollView: UIScrollView!

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
    self.scrollView = view.scrollView
    
    self.view = view
  }
  
  //MARK: - view
  private func setView() {
    title = "Log in"
    emailTextField.delegate = self
  
    logInButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillShow(_:)),
      name: UIResponder.keyboardWillShowNotification,
      object: nil)
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(keyboardWillHide(_:)),
      name: UIResponder.keyboardWillHideNotification,
      object: nil)
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

  //MARK: - actions
  @objc func buttonTapped(_ sender: UIButton) {
    print("tap here")
  }
  
  //MARK: - keybord scroll
  @objc func keyboardWillShow(_ notification: Notification) {
    setScrollViewInsetForKeyboardShow(true, notification: notification)
  }
  
  @objc func keyboardWillHide(_ notification: Notification) {
    setScrollViewInsetForKeyboardShow(false, notification: notification)
  }
  
  func setScrollViewInsetForKeyboardShow(_ show: Bool, notification: Notification) {
    guard
      let userInfo = notification.userInfo,
      let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
      else {
        return
    }
    scrollView.contentInset.bottom = (keyboardFrame.cgRectValue.height + 20) * (show ? 1: -1)
  }
}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    passwordTextField.becomeFirstResponder()
  }
}
