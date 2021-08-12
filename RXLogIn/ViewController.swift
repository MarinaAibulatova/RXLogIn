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
    
    //MARK: - private properties
    private let disposeBag = DisposeBag()
    private var viewModel = LoginViewModel()
    
    private weak var emailTextField: UITextField!
    private weak var passwordTextField: UITextField!
    private weak var logInButton: UIButton!
    private weak var scrollView: UIScrollView!
   
    //MARK: - life cicle
    override func loadView() {
        let view = LoginView()
        self.emailTextField = view.emailTextField
        self.passwordTextField = view.passwordTextField
        self.logInButton = view.logInButton
        self.scrollView = view.scrollView
       
        self.view = view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Log in"
        emailTextField.delegate = self
        emailTextField.becomeFirstResponder()
        
        configureViews()
        configureBinding()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeybordNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterKeybordNotification()
    }
    
    //MARK: - private methods
    private func configureViews() {
        logInButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    private func configureBinding() {
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
    
    private func registerKeybordNotification() {
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
    
    private func unregisterKeybordNotification() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK: - actions
    @objc func buttonTapped(_ sender: UIButton) {
        print("tap here")
    }
    
    //MARK: - keybord scroll
    @objc func keyboardWillShow(_ notification: Notification) {
        setScrollViewInsetForKeyboardShow(notification: notification)
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        setScrollViewInsetForKeyboardUnShow(notification: notification)
    }
    
    func setScrollViewInsetForKeyboardShow(notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else {
            return
        }

        scrollView.contentInset.bottom = (keyboardFrame.cgRectValue.height + 20)
    }
    
    func setScrollViewInsetForKeyboardUnShow(notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else {
            return
        }

        scrollView.contentInset.bottom -= keyboardFrame.cgRectValue.height + 20
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordTextField.becomeFirstResponder()
    }
}
