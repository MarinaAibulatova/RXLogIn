//
//  LoginView.swift
//  RXLogIn
//
//  Created by Марина Айбулатова on 09.08.2021.
//

import UIKit
import SnapKit

class LoginView: UIView {
  
  //MARK: - UI components
   let mainView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.contentMode = .scaleToFill
    
    return view
  }()
  
  private let emailTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.font = UIFont.systemFont(ofSize: 14)
    textField.placeholder = "Email"
    textField.keyboardType = .emailAddress
    textField.returnKeyType = .next
    textField.autocapitalizationType = .none
    textField.borderStyle = .roundedRect
    textField.layer.borderColor = UIColor.systemTeal.cgColor
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 10
    textField.clipsToBounds = true
    textField.backgroundColor = UIColor.systemGray6
    
    return textField
  }()
  
  private let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.font = UIFont.systemFont(ofSize: 14)
    textField.isSecureTextEntry = true
    textField.placeholder = "Password"
    textField.borderStyle = .roundedRect
    textField.layer.borderColor = UIColor.systemTeal.cgColor
    textField.layer.borderWidth = 1
    textField.layer.cornerRadius = 10
    textField.clipsToBounds = true
    textField.backgroundColor = UIColor.systemGray6
    
    return textField
  }()
  
  private let forgotButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = UIColor.white
    button.setTitle("Forgot password", for: .normal)
    button.setTitleColor(.systemTeal, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
   
    return button
  }()
  
  private let logInButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Log in", for: .normal)
    button.setTitleColor(UIColor.systemBlue, for: .normal)
    button.backgroundColor = UIColor.systemGray6
    button.layer.cornerRadius = 10
    
    return button
  }()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - set view
  private func setView() {
    mainView.addSubview(emailTextField)
    mainView.addSubview(passwordTextField)
    mainView.addSubview(forgotButton)
    mainView.addSubview(logInButton)
    
    setEmailConstraints()
    setPasswordConstraints()
    setForgotButtonConstraints()
    setLoginButtonConstraints()
  }
  
  //MARK: - constraints
  private func setEmailConstraints() {
    emailTextField.snp.makeConstraints { (make) in
      make.left.equalTo(mainView.layoutMargins.left)
      make.right.equalTo(mainView.snp.right).offset(-8)
      make.top.equalToSuperview().offset(80)
      make.height.equalTo(35)
    }
  }
  
  private func setPasswordConstraints() {
    passwordTextField.snp.makeConstraints { (make) in
      make.left.equalTo(mainView.layoutMargins.left)
      make.right.equalTo(mainView.snp.right).offset(-8)
      make.top.equalTo(emailTextField.snp.bottom).offset(30)
      make.height.equalTo(35)
    }
  }
  
  private func setForgotButtonConstraints() {
    forgotButton.snp.makeConstraints { (make) in
      make.top.equalTo(passwordTextField.snp.bottom).offset(20)
      make.left.equalTo(mainView.layoutMargins.left)
    }
  }
  
  private func setLoginButtonConstraints() {
    logInButton.snp.makeConstraints { (make) in
      make.left.equalTo(mainView.layoutMargins.left)
      make.right.equalTo(mainView.snp.right).offset(-8)
      make.top.equalTo(forgotButton.snp.bottom).offset(30)
    }
  }

  
  
  

  
  

  
  

}

