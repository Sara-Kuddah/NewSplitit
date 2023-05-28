//
//  PaymentProfile.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 20/05/2023.
//

import SwiftUI

struct PaymentProfile: View {
    @State private var bankName: String = ""
    @State private var Iban: String = ""
    @State private var STCPay: String = ""

    @State private var showTabBar = false
    var body: some View {
        VStack {
            HStack {
                Text("Payment")
                    .font(.system(size: 25, weight: .bold, design: .default))
                
            }
            VStack (alignment: .leading, spacing: 15)
            {
                Divider()
                Text("Transfer: ")
                    .font(.system(size: 20, weight: .semibold, design: .default))
                Text("Bank Name")
                    .font(.system(size: 17, weight: .semibold, design: .default))
             
                inputField(placeholder: "Bank Name", text: bankName)
                Text("IBAN ")
                    .font(.system(size: 17, weight: .semibold, design: .default))
            
                inputField(placeholder: "SA...", text: Iban)
                
                Text("STC pay ")
                    .font(.system(size: 17, weight: .semibold, design: .default))
             
                inputField(placeholder: "Enter Your Number", text: STCPay)
                
                
            }
            .padding()
                LargeButton(title: "Save") {
                    // add your functions here -- store data --
                    showTabBar = true
                }
                .fullScreenCover(isPresented: $showTabBar) {
                    TabBar()
                }
//            }
            
            Spacer()
        }
        
    }
    
    struct PaymentProfile_Previews: PreviewProvider {
        static var previews: some View {
            PaymentProfile()
        }
    }
}
