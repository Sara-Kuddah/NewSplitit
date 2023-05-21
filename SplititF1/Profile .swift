//
//  Profile .swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 20/05/2023.
//

import SwiftUI

struct Profile_: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("My Account")
                .padding(.leading, 20)
                .font(.system(size: 24, weight: .semibold, design: .default))
            
            
            
            Divider()
            // Spacer()
            
            VStack {
                HStack {
                    Image("Image4")
                        .resizable()
                        .frame(width: 20, height: 20)
                    //.padding(.leading, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("My Account")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                        Text("Make changes to your account")
                            .font(.system(size: 12, weight: .regular, design: .default))
                    }
                    
                    .padding(.leading, 10)
                    Spacer()
                    
                    Button(action: {
                        // Button action here
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                }
                .padding()
                
                Divider()
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                
                // Spacer()
            }
            VStack {
                HStack {
                    Image("Image8")
                        .resizable()
                        .frame(width: 20, height: 20)
                    //.padding(.leading, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Payment ")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                        Text("Manage How People Can Pay You")
                            .font(.system(size: 12, weight: .regular, design: .default))
                    }
                    
                    .padding(.leading, 10)
                    Spacer()
                    
                    Button(action: {
                        // Button action here
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                }
                .padding()
                
                Divider()
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                
                // Spacer()
            }
            VStack {
                HStack {
                    Image("Image6")
                        .resizable()
                        .frame(width: 20, height: 20)
                    //.padding(.leading, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Privacy and Policy")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                        
                    }
                    
                    .padding(.leading, 10)
                    Spacer()
                    
                    Button(action: {
                        // Button action here
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                }
                .padding()
                
                Divider()
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                
                //Spacer()
            }
            VStack {
                HStack {
                    Image("Image5")
                        .resizable()
                        .frame(width: 20, height: 20)
                    //.padding(.leading, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("About Split it")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                        
                    }
                    
                    .padding(.leading, 10)
                    Spacer()
                    
                    Button(action: {
                        // Button action here
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                }
                .padding()
                
                Divider()
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                
                //Spacer()
            }
            VStack {
                HStack {
                    Image("Image7")
                        .resizable()
                        .frame(width: 20, height: 20)
                    //.padding(.leading, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Help And Support")
                            .font(.system(size: 15, weight: .semibold, design: .default))
                        
                    }
                    
                    .padding(.leading, 10)
                    Spacer()
                    
                    Button(action: {
                        // Button action here
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                }
                .padding()
                
                Divider()
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                
                //Spacer()
            }
            VStack {
                HStack {
                    Image("Image7")
                        .resizable()
                        .frame(width: 20, height: 20)
                    //.padding(.leading, 10)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Logout")
                            .foregroundColor(.red)
                            .font(.system(size: 15, weight: .semibold, design: .default))
                        
                    }
                    
                    .padding(.leading, 10)
                    Spacer()
                    
                    
                }
                .padding()
                
                Divider()
                    .frame(height: 1)
                    .padding(.horizontal, 20)
                
                Spacer()
            }
        }
        
    }
    
    struct Profile__Previews: PreviewProvider {
        static var previews: some View {
            Profile_()
        }
    }
}
