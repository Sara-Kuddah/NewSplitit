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
            //NavigationStack {
                HStack(spacing: 8) {
                    
//                    Button(action: {
//
//                    }) {
//                        NavigationLink(destination: Profile()) {
//                            Image(systemName: "chevron.left")
//                                .padding(.leading, 15)
//                                .foregroundColor(Color("Color1"))
//                        }
//                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 2) {
                        Text("Payment")
                        // .font(.headline)
                            .font(.system(size: 25, weight: .bold, design: .default))
                            .padding(.leading, -40)
                       
                    }
                    Spacer()
                    
                }
                Divider()
                
                VStack (alignment: .leading, spacing: 15)
                {
                   // Divider()
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
                    //patch bankName
                    showTabBar = true
                    if !bankName.isEmpty {
                        WebAPI.PatchBankpaymentsBname(bname: bankName) { result in
                            switch result {
                            case .success(let success):
                                print("Done patch bankName", success)
                            case .failure(let failure):
                                print("error patch bankName", failure)
                            }
                        }
                    }
                    //patch Iban
                    if !Iban.isEmpty {
                        WebAPI.PatchBankpaymentsIban(iban: Iban) { result in
                            switch result {
                            case .success(let success):
                                print("Done patch Iban", success)
                            case .failure(let failure):
                                print("error patch Iban", failure)
                            }
                        }
                    }

                    //patch STCPay
                    if !STCPay.isEmpty {
                        WebAPI.PatchStcpayments(phone: STCPay) { result in
                            switch result {
                            case .success(let success):
                                print("Done patch STCPay", success)
                            case .failure(let failure):
                                print("error patch STCPay", failure)
                            }
                        }
                    }

                    

                }
                .fullScreenCover(isPresented: $showTabBar) {
                    TabBar()
                }
                //            }
                
                Spacer()
            }
           // .navigationBarBackButtonHidden(true)
            
        }
    }
    
    struct PaymentProfile_Previews: PreviewProvider {
        static var previews: some View {
            PaymentProfile()
        }
    }

