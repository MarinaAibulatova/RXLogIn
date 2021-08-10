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
  
  private func emailValidation() -> Bool {
    return emailRelay.value.validEmail()
  }
  
  private func passwordValidation() -> Bool {
    return passwordRelay.value.count >= LoginViewModel.validPassword
  }
  
  func validation() -> Observable<Bool> {
    
    return Observable.combineLatest(self.emailRelay.asObservable(), self.passwordRelay.asObservable()) {
      (email, password) in
      
      return self.emailValidation() && passwordValidation()
    }
    .startWith(false)
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
