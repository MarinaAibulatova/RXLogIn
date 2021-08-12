//
//  LoginView.swift
//  RXLogIn
//
//  Created by Марина Айбулатова on 09.08.2021.
//

import UIKit
import SnapKit

class LoginView: UIView {
    
    //MARK: - public properties
    var scrollView: UIScrollView!
    var contentStackView: UIStackView!
    var emailTextField: UITextField!
    var passwordTextField: UITextField!
    var forgotButton: UIButton!
    var logInButton: UIButton!
    var someView: UIView!
    
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - private methods
    private func setupViews() {
        backgroundColor = .white
        
        scrollView = {
            let i = UIScrollView()
            return i
        }()
        
        contentStackView = {
            let i = UIStackView()
            i.axis = .vertical
            i.spacing = 10
            i.alignment = .fill
            i.distribution = .fill
            i.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
            i.isLayoutMarginsRelativeArrangement = true
            return i
        }()
        
        someView = {
            let i = UIView()
            i.backgroundColor = .white
            
            return i
        }()
        
        emailTextField = {
            let i = UITextField()
            i.font = UIFont.systemFont(ofSize: 14)
            i.placeholder = "Email"
            i.keyboardType = .emailAddress
            i.returnKeyType = .next
            i.autocapitalizationType = .none
            i.borderStyle = .roundedRect
            i.layer.borderColor = UIColor.systemTeal.cgColor
            i.layer.borderWidth = 1
            i.layer.cornerRadius = 10
            i.clipsToBounds = true
            i.backgroundColor = UIColor.systemGray6
            return i
        }()
        
        passwordTextField = {
            let i = UITextField()
            i.font = UIFont.systemFont(ofSize: 14)
            i.isSecureTextEntry = true
            i.placeholder = "Password"
            i.borderStyle = .roundedRect
            i.layer.borderColor = UIColor.systemTeal.cgColor
            i.layer.borderWidth = 1
            i.layer.cornerRadius = 10
            i.clipsToBounds = true
            i.backgroundColor = UIColor.systemGray6
            return i
        }()
        
        forgotButton = {
            let i = UIButton()
            i.backgroundColor = UIColor.white
            i.setTitle("Forgot password", for: .normal)
            i.setTitleColor(.systemTeal, for: .normal)
            i.titleLabel?.font = UIFont.systemFont(ofSize: 10)
            return i
        }()
        
        logInButton = {
            let i = UIButton()
            i.setTitle("Log in", for: .normal)
            i.setTitleColor(UIColor.white, for: .normal)
            i.setTitleColor(UIColor.systemBlue, for: .disabled)
            i.setBackgroundColor(color: UIColor.systemGray6, forState: .disabled)
            i.setBackgroundColor(color: UIColor.systemBlue, forState: .normal)
            i.showsTouchWhenHighlighted = true
            i.layer.cornerRadius = 10
            return i
        }()
        
        addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(someView)
        contentStackView.addArrangedSubview(emailTextField)
        contentStackView.addArrangedSubview(passwordTextField)
        contentStackView.addArrangedSubview(forgotButton)
        contentStackView.addArrangedSubview(logInButton)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.left.bottom.right.equalTo(0)
        }
        
        contentStackView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
            make.width.equalToSuperview()
        }
        
        someView.snp.makeConstraints { (make) in
            make.height.equalTo(400)
            make.width.equalTo(400)
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

