//
//  LoginViewModel.swift
//  RXLogIn
//
//  Created by Марина Айбулатова on 09.08.2021.
//

import RxSwift
import RxCocoa

struct LoginViewModel {
  static let validPassword: Int = 8
 
  func validation(email: Observable<String>, password: Observable<String>) -> Observable<Bool> {
    
    return Observable.combineLatest(email, password) {
      (email, password) in
      
      return email.validEmail() && password.count >= LoginViewModel.validPassword
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
