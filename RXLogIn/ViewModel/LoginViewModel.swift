//
//  LoginViewModel.swift
//  RXLogIn
//
//  Created by Марина Айбулатова on 09.08.2021.
//

import RxSwift
import RxCocoa

struct LoginViewModel {
  static let validPassword: Int = 3
  
  let emailRelay = BehaviorRelay<String>(value: "")
  let passwordRelay = BehaviorRelay<String>(value: "")
  
  private var emailValidation: Observable<Bool> {
    return emailRelay.asObservable().map{$0.validEmail()}
  }
  
  private var passwordValidation: Observable<Bool> {
    return passwordRelay.asObservable().map{$0.count >= LoginViewModel.validPassword}
  }
  
  func validation() -> Observable<Bool> {
    return Observable.combineLatest(self.emailValidation, self.passwordValidation) {
      (email, password) in
      return email && password
    }
  }
  
}

//MARK: - validation email
extension String {
  func validEmail() -> Bool {
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let predicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
    return predicate.evaluate(with: self)
  }
}
