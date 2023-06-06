//
//  MyAccountP.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 20/05/2023.
//

import SwiftUI

struct MyAccountP: View {
    @State private var Name: String = ""
    @State private var Phone: String = ""
    @State private var Email: String = ""
    @State private var showTabBar = false
    var body: some View {
        VStack {
            NavigationStack {
                HStack(spacing: 8) {
                    
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination: Profile()) {
                            Image(systemName: "chevron.left")
                                .padding(.leading, 15)
                                .foregroundColor(Color("Color1"))
                        }
                    }
                    
                    Text("My Account")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .padding(.leading,90)
                    
                    
                
                Spacer()
                
            }
            Divider()
            VStack(alignment: .leading, spacing: 15) {
                //Divider()
                Text("Name")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                inputField(placeholder: "Enter Your Name", text: Name)
                Text("Phone ")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                inputField(placeholder: "056XXXXXX", text: Phone)
                Text("Email")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                inputField(placeholder: "Enter Your Email", text: Email)
                
            }
            .padding()
            LargeButton(title: "Save"){
                showTabBar = true
            }
            .fullScreenCover(isPresented: $showTabBar) {
                TabBar()
            }
            .padding(.top, 20)
            
            Spacer()
        }
            .navigationBarBackButtonHidden(true)
    }
    
}
    struct MyAccountP_Previews: PreviewProvider {
        static var previews: some View {
            MyAccountP()
        }
    }
}
