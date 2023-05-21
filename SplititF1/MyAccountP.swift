//
//  MyAccountP.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 20/05/2023.
//

import SwiftUI

struct MyAccountP: View {
    @State private var text: String = ""
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                Text("My Account")
                
                    .padding(.leading, -18)
                
                    .font(.system(size: 25, weight: .bold, design: .default))
                Spacer()
                
                
            }
            
            VStack(spacing: 25) {
                Divider()
                    .padding(.bottom, 10)
                
                Text("Name")
                    .padding(.leading, -165)
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .padding(.bottom, -10)
                TextField("Enter Name", text: $text)
                    .padding(.leading, 5)
                    .frame(width: 340, height: 52)
                //.cornerRadius(11)
                //.border(Color.gray, width: 1)
                    .background(Color.white)
                //.cornerRadius(8)
                    .overlay( RoundedRectangle(cornerRadius: 11)
                        .stroke(Color("Color1"))  )
                
                Text("Phone ")
                    .padding(.leading, -165)
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .padding(.bottom, -10)
                TextField("056XXXXXX", text: $text)
                    .padding(.leading, 5)
                    .frame(width: 340, height: 52)
                //.cornerRadius(11)
                //.border(Color.gray, width: 1)
                    .background(Color.white)
                //.cornerRadius(8)
                    .overlay( RoundedRectangle(cornerRadius: 11)
                        .stroke(Color("Color1"))  )
                Text("Email")
                    .padding(.leading, -165)
                    .font(.system(size: 17, weight: .semibold, design: .default))
                    .padding(.bottom, -10)
                TextField("Enter Your Email ", text: $text)
                    .padding(.leading, 5)
                    .frame(width: 340, height: 52)
                //.cornerRadius(11)
                //.border(Color.gray, width: 1)
                    .background(Color.white)
                //.cornerRadius(8)
                    .overlay( RoundedRectangle(cornerRadius: 11)
                        .stroke(Color("Color1"))  )
                
                
                
                
                Button(action: {
                    // Handle button action
                }) {
                    Text("Save")
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color("Color1"))
                                .frame(width: 343, height: 61))
                    
                        .padding(.top, 30)
                }
            }
            
            Spacer()
        }
        
        
        
        
        
        
    }
    
    struct MyAccountP_Previews: PreviewProvider {
        static var previews: some View {
            MyAccountP()
        }
    }
}
