//
//  LoginModel.swift
//  RXLogIn
//
//  Created by Марина Айбулатова on 09.08.2021.
//

import Foundation

class LoginModel {
  var email: String = ""
  var password: String = ""
  
  init(email: String, password: String) {
    self.email = email
    self.password = password
  }
}
