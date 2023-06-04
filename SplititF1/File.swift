////
////  File.swift
////  SplititF1
////
////  Created by Alaa Alabdullah on 04/06/2023.
////
//
//import SwiftUI
//import AuthenticationServices
//
//struct File: View {
//  @Environment(\.window) var window: UIWindow?
//  @State var appleSignInDelegates: SignInWithAppleDelegates! = nil
//  @State private var showingAlert = false
//  @State private var alertMessage = ""
//  @State private var alertTitle = ""
//
//  var body: some View {
//    ZStack {
//      Color.green.edgesIgnoringSafeArea(.all)
//
//      VStack {
//        Image("razeware")
//          .resizable()
//          .frame(width: 200, height: 200)
//
//        Button(action: showAppleLogin) {
//          Text("Sign in with Apple")
//            .frame(width: 280, height: 60)
//            .background(Color.white)
//            .foregroundColor(.black)
//            .cornerRadius(10)
//        }
//        .padding()
//      }
//      .alert(isPresented: $showingAlert) {
//        Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("Okay!")))
//      }
//    }
//  }
//
//  private func showAppleLogin() {
//    let request = ASAuthorizationAppleIDProvider().createRequest()
//    request.requestedScopes = [.fullName, .email]
//
//    performSignIn(using: [request])
//  }
//
//  private func performSignIn(using requests: [ASAuthorizationRequest]) {
//    appleSignInDelegates = SignInWithAppleDelegates(window: window) { success in
//      switch success {
//      case .success(let profile): self.showProfileAlert(profile: profile)
//      case .failure(let error): self.showErrorAlert(error: error)
//      }
//    }
//
//    let controller = ASAuthorizationController(authorizationRequests: requests)
//    controller.delegate = appleSignInDelegates
//    controller.presentationContextProvider = appleSignInDelegates
//
//    controller.performRequests()
//  }
//
//  private func showErrorAlert(error: Error) {
//    self.showingAlert = true
//    self.alertTitle = "Error 😐"
//    self.alertMessage = error.localizedDescription
//  }
//
//  private func showProfileAlert(profile: UserProfile) {
//    self.showingAlert = true
//    self.alertTitle = "Success 🎉"
//    self.alertMessage = """
//      User ID: \(profile.id)
//      Email: \(profile.email)
//      First name: \(profile.firstName ?? "N/A")
//      Last name: \(profile.lastName ?? "N/A")
//    """
//  }
//}
//
//#if DEBUG
//struct ContentView_Previews: PreviewProvider {
//  static var previews: some View {
//    ContentView()
//  }
//}
//#endif
