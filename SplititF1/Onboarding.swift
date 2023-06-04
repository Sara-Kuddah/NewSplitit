//
//  Onboarding.swift
//  SplititF1
//
//  Created by Abeer on 27/10/1444 AH.
//
//import UIKit
import AuthenticationServices
import SwiftUI

struct Onboarding: View {
    @Environment(\.colorScheme) var colrScheme
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var usertId: String = ""
    
    @State private var showTabBar = false
    @Environment var window: UIWindow?
    @State var appleSignInDelegates: SignInWithAppleDelegates! = nil
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var alertTitle = ""
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Image("pic")
                Text("Place an order with people nearby.")
                    .font(.system(size: 20, weight: .bold, design: .default))
                   
                Text("Order with nearby family, friends and others")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 15, weight: .medium, design: .default))
                    .foregroundColor(.gray)
                   
                Spacer()
                VStack{
                    
//                    SignInWithAppleButton(.continue){ request in
//                        request.requestedScopes = [.email, .fullName]
//                    } onCompletion: { result in
//                        switch result{
//                        case .success(let auth):
//
//
//                            switch auth.credential {
//                            case let credential as ASAuthorizationAppleIDCredential:
//                                let userId = credential.user
//                                let email = credential.email
//                                let firstName = credential.fullName?.givenName
//                                let lastName = credential.fullName?.familyName
//
////                                self.userId = userId ?? ""
//                                self.email = email ?? ""
//                                self.firstName = firstName ?? ""
//                                self.lastName = lastName ?? ""
//
//                            default:
//                                break
//                            }
//
//                        case .failure(let error):
//                            print(error)
//                        }
//
//                    }
//                    //                .signInWithAppleButtonStyle( colorScheme == .dark ? .white : .black
//                    //                )
//                    .frame(height: 50)
//                    .padding()
//                    .cornerRadius(10)
//
                    
                    SignInWithApple()
                      .frame(width: 280, height: 60)
                      .onTapGesture(perform: showAppleLogin)
                    
                    LargeButton(title: "Skip") {
                        showTabBar = true
                    }
                    .fullScreenCover(isPresented: $showTabBar) {
                        TabBar()
                    }
                }
                Spacer()
            }
        }
    }
    private func showAppleLogin() {
      let request = ASAuthorizationAppleIDProvider().createRequest()
      request.requestedScopes = [.fullName, .email]

      performSignIn(using: [request])
    }

    private func performSignIn(using requests: [ASAuthorizationRequest]) {
      appleSignInDelegates = SignInWithAppleDelegates(window: window) { success in
        switch success {
        case .success(let profile): self.showProfileAlert(profile: profile)
        case .failure(let error): self.showErrorAlert(error: error)
        }
      }

      let controller = ASAuthorizationController(authorizationRequests: requests)
      controller.delegate = appleSignInDelegates
      controller.presentationContextProvider = appleSignInDelegates

      controller.performRequests()
    }

    private func showErrorAlert(error: Error) {
      self.showingAlert = true
      self.alertTitle = "Error 😐"
      self.alertMessage = error.localizedDescription
    }

    private func showProfileAlert(profile: UserProfile) {
      self.showingAlert = true
      self.alertTitle = "Success 🎉"
      self.alertMessage = """
        User ID: \(profile.id)
        Email: \(profile.email)
        First name: \(profile.firstName ?? "N/A")
        Last name: \(profile.lastName ?? "N/A")
      """
    }
  }

//struct Onboarding_Previews: PreviewProvider {
//    static var previews: some View {
//        Onboarding(window: window)
//    }
//}
