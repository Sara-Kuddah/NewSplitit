//
//  Onboarding.swift
//  SplititF1
//
//  Created by Abeer on 27/10/1444 AH.
//
import AuthenticationServices
import SwiftUI

struct Onboarding: View {
    @Environment(\.colorScheme) var colrScheme
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var usertId: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Image("pic")
                Text("Place an order with people nearby.")
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Order with nearby family, friends and other persons.")
                    .multilineTextAlignment(.center)
                
                
                
                SignInWithAppleButton(.continue){ request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    switch result{
                    case .success(let auth):
                       
                        
                        switch auth.credential {
                        case let credential as ASAuthorizationAppleIDCredential:
                            let userId = credential.user
                            let email = credential.email
                            let firstName = credential.fullName?.givenName
                            let lastName = credential.fullName?.familyName
                            
                            self.email = email ?? ""
                           // self.userId = userId
                            self.firstName = firstName ?? ""
                            self.lastName ?? ""
                            
                        default:
                            break
                        }
                        
                        
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                }
//                .signInWithAppleButtonStyle( colorScheme == .dark ? .white : .black
//                )
                .frame(height: 50)
                .padding()
                .cornerRadius(10)
                
                SkipButton()
                
            }
        }
    }
}
struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
