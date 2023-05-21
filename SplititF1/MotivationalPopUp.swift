//
//  MotivationalPopUp.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 17/05/2023.
//

import SwiftUI

struct MotivationalPopUp: View {
    @State private var isAuthenticating = false
        @State private var username = ""
        @State private var password = ""

        var body: some View {
            Button("Press Me") {
                isAuthenticating.toggle()
            }
            .alert("Log in", isPresented: $isAuthenticating) {
                TextField("Username", text: $username)
                    .textInputAutocapitalization(.never)
                SecureField("Password", text: $password)
                Button("OK", action: authenticate)
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Please enter your username and password.")
            }
        }

        func authenticate() {
            if username == "twostraws" && password == "sekrit" {
                print("You're in!")
            } else {
                print("Who are you?")
            }
        }
    }
struct MotivationalPopUp_Previews: PreviewProvider {
    static var previews: some View {
        MotivationalPopUp()
    }
}
