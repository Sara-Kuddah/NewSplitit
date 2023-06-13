//
//  FormForAddingOrder.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 14/05/2023.
//

import SwiftUI

struct FormForAddingOrder: View {
    @State private var item_name: String = ""
    @State private var price: String = ""
    @State private var text3: String = ""
    //    @State private var selectedOption: String = ""
    //    @State private var isShowingOptions: Bool = false
    @State private var showOrderIsSent = false
    //    @State private var isPresentedFullScreenCover = false
    @State var appN : String
    @State var merN : String
    @State var delFe : Int
    @State var payMS : String
    @State var payMB : String
    @State var cheP :String
    @State var orderID: UUID
    var body: some View {
        NavigationView {
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
                    VStack(spacing: 2) {
                        Text(merN)
                            .font(.system(size: 25, weight: .bold, design: .default))
                        Text("\(delFe), \(appN), \(payMS)-\(payMB), \(cheP)")
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
                        TextField("Please write your order ", text: $item_name)
                        
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
                            TextField("Price SR", text: $price)
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
                        // call join order and pass order id
                        WebAPI.joinOrder(orderID: orderID) { res in
                            switch res {
                            case .success(let success):
                                print("success", success)
                            case .failure(let failure):
                                print("failure!", failure)
                            }
                        }
                        
                        WebAPI.addItem(orderID: orderID, item_name: item_name, price: Double(price) ?? 0.0) { res in
                            switch res {
                            case .success(let success):
                                print("success", success)
                            case .failure(let failure):
                                print("failure!", failure)
                            }
                        }
                        // call add item and pass order id -- did i do it?
                        showOrderIsSent = true
                    }
                    .fullScreenCover(isPresented: $showOrderIsSent) {
                        checkbox(orderID: orderID)
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
    
}
//    struct FormForAddingOrder_Previews: PreviewProvider {
//        static var previews: some View {
//            FormForAddingOrder()
//        }
//    }

