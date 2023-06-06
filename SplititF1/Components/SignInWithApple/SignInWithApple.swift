//
//  SignInWithApple.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 04/06/2023.
//

import SwiftUI
import AuthenticationServices

struct SignInWithApple: UIViewRepresentable {
     func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {

    return ASAuthorizationAppleIDButton()
  }
  
  func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
  }
}
