//
//  Form.swift
//  SplititF1
//
//  Created by Abeer on 20/10/1444 AH.
//

import SwiftUI

struct Form: View {
    @State var appN: String = ""
    @State var restaurantN: String = ""
    @State var DeliveryF: String = ""
    @State var Notes: String = ""
    @State var checkP: String = ""
    @State var note: String = ""
    @State var firstMarked = false
    @State var thirdMarked = false
    @State private var showOrder = false
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        Button(action: {
                            
                        }) {
                            NavigationLink(destination:  TabBar()) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("Color1"))
                                    .padding(.leading)
                            }
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("McDonald's")
                                .font(.system(size: 25, weight: .bold, design: .default))
                            Text("20 SR, Jahez, STC Pay-Al Rajhi, PNU-A4")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    Divider()
                VStack {
                        VStack{
                            AppNamePicker(selection: "Jahez")
                            
                        }
      
                    VStack(alignment: .leading){
                            Text("Restaurant Name")
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                            TextField("", text: $restaurantN)
                            .padding(.leading, 10)
                                .frame(height: 50)
                                .textFieldStyle(PlainTextFieldStyle())
                            
                                .overlay( RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color("Color1"))  )

                        }
                    VStack(alignment: .leading){
                            Text("Delivery Fee")
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                            TextField("", text: $DeliveryF)
                            .padding(.leading, 10)
                            
                                .frame(height: 50)
                                .textFieldStyle(PlainTextFieldStyle())
                                .overlay( RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color("Color1"))  )
                        }
                    VStack(alignment: .leading){
                            Text("Check Point")
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                            TextField("Where others will find the order ? ", text: $checkP)
                            .padding()
                                .font(.system(size: 15))
                                .frame(height: 50)
                                .textFieldStyle(PlainTextFieldStyle())
                            
                                .overlay( RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color("Color1"))  )
                                
                        }
                        
                        VStack{
                            PaymentCard()
                                .padding(.vertical, 10.0)
                        }
                        VStack(alignment: .leading) {
                            Text("Notes")
                                .font(.system(size: 18))
                                .fontWeight(.medium)
                                .padding()
                            inputField(placeholder: "", text: Notes)
                        }
                        
                    }
                    .padding()
                    VStack{
                        LargeButton(title: "Send") {
                            guard !DeliveryF.isEmpty else { return }
                            let deliveryFeeInt = Int(DeliveryF)
                            WebAPI.postOrder(merchantName: restaurantN,
                                             appName: appN,
                                             deliveryFee: deliveryFeeInt ?? 0,
                                             checkpoint: checkP,
                                             notes: Notes,
                                             active: true,
                                             status: "waiting") { result in
                                switch result {
                                case .success(_):
                                    print("order sent")
                                    
                                case .failure(let failure):
                                    print("faill", failure)
                                    showOrder = true
                                }
                            }
                            
                        }
                        .fullScreenCover(isPresented: $showOrder) {
                            Waiting1()
                        }
                        
                    }
                }
                
                    .padding(.top)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        Form()
    }
}
