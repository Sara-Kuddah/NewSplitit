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
    //   @State var secondMarked = true
    @State var thirdMarked = false
    @State private var showOrder = false
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        Button(action: {
                            
                        }) {
                            NavigationLink(destination:  TabBar()) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("Color1")) // change color of back button
                                    .padding(.leading, 10.0)
                            }
                           
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("McDonald's")
                            // .font(.headline)
                                .font(.system(size: 25, weight: .bold, design: .default))
                                .padding(.trailing, 40.0)
                            Text("20 SR, Jahez, STC Pay-Al Rajhi, PNU-A4")
                            //.font(.subheadline)
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                                .padding(.trailing, 40.0)
                        }
                        Spacer()                    }
                    Divider()
                VStack //(alignment: .leading)
                {
                    VStack{
                        RName()
                        
                    }
                    
                    .padding(.vertical, 5.0)
                    VStack{
                        Text("Restaurant Name")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .padding(.leading, -165.0)
                            .padding(.bottom, 1.0)
                        TextField("", text: $restaurantN)
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 4)
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                            .padding([.horizontal], 24)
                            .padding(.top, -6.0)
                    }
                    .padding(.vertical,5.0)
                    VStack{
                        Text("Delivery Fee")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .padding(.leading, -165.0)
                            .padding(.bottom, 1.0)
                        TextField("", text: $DeliveryF)
                        
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 4)
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                            .padding([.horizontal], 24)
                            .padding(.top, -6.0)
                    }
                    .padding(.vertical, 5.0)
                    VStack{
                        Text("Check Point Fee")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .padding(.leading, -165.0)
                            .padding(.bottom, 1.0)
                        TextField("Where others will find the order ? ", text: $checkP)
                            .font(.system(size: 15))
                        
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 4)
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                            .padding([.horizontal], 24)
                            .padding(.top, -6.0)
                    }
                    .padding(.vertical, 5.0)
                    //
                    VStack{
                        PaymentCard()
                            .padding(.vertical, 10.0)
                    }
                    .padding(.vertical, 5.0)
                    VStack {
                        Text("Notes")
                            .font(.system(size: 18))
                            .fontWeight(.medium)
                            .padding(.leading, -165.0)
                            .padding(.bottom, 1.0)
                        TextField("", text: $note)
                            .font(.system(size: 15))
                        
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 4)
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                            .padding([.horizontal], 24)
                            .padding(.top, -6.0)
                    }
                    .padding(.top, 10.0)
                    
                    VStack{
                        LargeButton(title: "Send") {
                            showOrder = true
                        }
                        .fullScreenCover(isPresented: $showOrder) {
                            Waiting1()
                        }
                        
                    }
                    .padding(.top, 45.0)
                }
                .padding(.top, 25.0)
                
              
                }
                
                
                
                
                
                
                
                
               // Divider()
                
                    .padding(.top)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
        //.navigationBarBackButtonHidden(true)
    
}

struct Form_Previews: PreviewProvider {
    static var previews: some View {
        Form()
    }
}
