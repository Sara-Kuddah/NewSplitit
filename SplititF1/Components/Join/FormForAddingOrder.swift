//
//  FormForAddingOrder.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 14/05/2023.
//

import SwiftUI

struct FormForAddingOrder: View {
    @State private var text: String = ""
    @State private var text2: String = ""
    @State private var text3: String = ""
    @State private var selectedOption: String = ""
    @State private var isShowingOptions: Bool = false
    @State private var showOrderIsSent = false
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination:  TabBar()) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("Color1")) // change color of back button
                        }
                    }
                    Spacer()
                    VStack(spacing: 2) {
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
                    Text("Add Your Order")
                        .padding(.top, 20)
                        .padding(.trailing, 160)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .font(.title3)
                        .padding(.trailing, 50)
                    
                    Text("Order Name")
                        .font(.system(size: 14, weight: .semibold, design: .default))
                        .padding(.top, 35)
                        .padding(.trailing, 265)
                    VStack {
                        TextField("Please write your order ", text: $text)
                        
                            .padding()
                        //.border(Color("Color1"))
                            .background(Color.white)
                            .cornerRadius(10)
                        
                            .overlay(
                                RoundedRectangle(cornerRadius: 11)
                                    .stroke(Color("Color1"))
                            )
                    }
                }
                .padding(.horizontal)
                VStack(alignment: .leading) {
                    HStack(spacing: 60)
                    {
                        
                        VStack(alignment: .leading, spacing: 10)
                        {
                            Text("Price")
                                .font(.system(size: 14, weight: .semibold, design: .default))
                            TextField("Price SR", text: $text2)
                                .padding(.leading, 10)
                                .frame(width: 146, height: 52)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("Color1"))                        )}
                        .padding(.trailing, -40)
                        
                        newSizeDropDown()
                        
                    }
                }
                .padding()
                HStack {
                    Button(action: {
                        // Add your code here to handle button press
                    }) {
                        Text("+")
                            .font(.title)
                            .foregroundColor(Color("Color1"))
                            .font(.title)
                            .frame(width: 150, height: 50, alignment: .leading)
                            .padding(.top, 40)
                    }
                    Text("Add New Item")
                        .font(.system(size: 18, weight: .semibold, design: .default))
                        .foregroundColor(Color("Color1"))
                        .frame(width: 150, height: 50, alignment: .leading)
                        .offset(x: -120)
                        .offset(y: 22)
                    
                }
                .padding()
                VStack {
                    Text("Please note: Once you Click Send, you will not be ableto Edit or Cancel your order")
                        .font(.system(size: 12, weight: .regular, design: .default))
                        .foregroundColor(Color.gray)
                        .padding(.top, 50)
                    LargeButton(title: "Send") {
                        showOrderIsSent = true
                    }
                    .fullScreenCover(isPresented: $showOrderIsSent) {
                        OrderIsSent()
                    }
                        .padding(.top, 30)
                }
                
                Spacer()
                
            }
            
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("")
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    
    struct FormForAddingOrder_Previews: PreviewProvider {
        static var previews: some View {
            FormForAddingOrder()
        }
    }
}
