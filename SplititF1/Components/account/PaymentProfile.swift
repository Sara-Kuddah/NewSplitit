//
//  PaymentProfile.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 20/05/2023.
//

import SwiftUI

struct PaymentProfile: View {
    @State private var text: String = ""
    @State private var showTabBar = false
    var body: some View {
        VStack {
            HStack {
                Text("Payment")
                    .font(.system(size: 25, weight: .bold, design: .default))
                
            }
            VStack (spacing: 15)
            {
                Divider()
                Text("Transfer : ")
                    .font(.system(size: 20, weight: .semibold, design: .default))
                Text("Bank Name")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                TextField("Bank Name", text: $text)
                    .frame(width: 340, height: 52)
                    .background(Color.white)
                    .overlay( RoundedRectangle(cornerRadius: 11)
                        .stroke(Color("Color1"))  )
                
                Text("IBAN ")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                TextField("", text: $text)
                    .frame(width: 340, height: 52)
                    .background(Color.white)
                    .overlay( RoundedRectangle(cornerRadius: 11)
                        .stroke(Color("Color1"))  )
                Text("STC pay : ")
                    .font(.system(size: 17, weight: .semibold, design: .default))
                TextField("Enter your number ", text: $text)
                    .frame(width: 340, height: 52)
                    .background(Color.white)
                    .overlay( RoundedRectangle(cornerRadius: 11)
                        .stroke(Color("Color1"))  )
                
               
                LargeButton(title: "Save") {
                    showTabBar = true
                }
                .fullScreenCover(isPresented: $showTabBar) {
                    TabBar()
                }
            }
            
            Spacer()
        }
        
    }
    
    struct PaymentProfile_Previews: PreviewProvider {
        static var previews: some View {
            PaymentProfile()
        }
    }
}
