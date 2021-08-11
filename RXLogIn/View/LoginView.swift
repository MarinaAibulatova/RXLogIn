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
   
    view.backgroundColor = .white
    view.contentMode = .scaleToFill
    view.isUserInteractionEnabled = true
    
    return view
  }()
  
   let emailTextField: UITextField = {
    let textField = UITextField()
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
    textField.becomeFirstResponder()
    
    return textField
  }()
  
   let passwordTextField: UITextField = {
    let textField = UITextField()
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
  
   let forgotButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor.white
    button.setTitle("Forgot password", for: .normal)
    button.setTitleColor(.systemTeal, for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 10)
   
    return button
  }()
  
   let logInButton: UIButton = {
    let button = UIButton()
    button.setTitle("Log in", for: .normal)
    button.setTitleColor(UIColor.white, for: .normal)
    button.setTitleColor(UIColor.systemBlue, for: .disabled)
    button.setBackgroundColor(color: UIColor.systemGray6, forState: .disabled)
    button.setBackgroundColor(color: UIColor.systemBlue, forState: .normal)
    button.showsTouchWhenHighlighted = true
    button.layer.cornerRadius = 10
    
    return button
  }()
  
  let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    return scrollView
  }()
  
  let contentView: UIView = {
    let view = UIView()

    return view
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
    self.backgroundColor = .white
    
    addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(mainView)
    
    mainView.addSubview(emailTextField)
    mainView.addSubview(passwordTextField)
    mainView.addSubview(forgotButton)
    mainView.addSubview(logInButton)
    
    setScrollViewConstraints()
    setContentViewConstraints()
    setMainViewConstraints()
    
    setEmailConstraints()
    setPasswordConstraints()
    setForgotButtonConstraints()
    setLoginButtonConstraints()
    
  }
  
  //MARK: - constraints
  private func setScrollViewConstraints() {
    scrollView.snp.makeConstraints { (make) in
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalToSuperview()
      make.top.equalToSuperview()
    }
  }
  
  private func setContentViewConstraints() {
    contentView.snp.makeConstraints { (make) in
      make.height.equalTo(UIScreen.main.bounds.height + 100)
      make.leading.equalTo(scrollView.snp.leading)
      make.trailing.equalTo(scrollView.snp.trailing)
      make.bottom.equalTo(scrollView.snp.bottom)
      make.top.equalTo(scrollView.snp.top)
      make.width.equalTo(scrollView.snp.width)
    }
  }
  
  private func setMainViewConstraints() {
    mainView.snp.makeConstraints { (make) in
      make.leading.equalTo(contentView.snp.leading)
      make.trailing.equalTo(contentView.snp.trailing)
      make.top.equalTo(contentView.snp.top)
    //  make.centerX.equalTo(contentView.snp.centerX)
     // make.centerY.equalTo(contentView.snp.centerY)
      make.height.equalTo(100)
    }
  }
  
  private func setEmailConstraints() {
    emailTextField.snp.makeConstraints { (make) in
      make.left.equalTo(mainView.layoutMargins.left)
      make.right.equalTo(mainView.snp.right).offset(-8)
      make.top.equalTo(mainView.safeAreaLayoutGuide.snp.top)
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

extension UIButton {
  func setBackgroundColor(color: UIColor, forState: UIControl.State) {
    self.clipsToBounds = true
    UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
    if let context = UIGraphicsGetCurrentContext() {
      context.setFillColor(color.cgColor)
      context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
      let colorImage = UIGraphicsGetImageFromCurrentImageContext()
      UIGraphicsEndImageContext()
      self.setBackgroundImage(colorImage, for: forState)
    }
  }
}

