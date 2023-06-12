//
//  ContentView.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 09/05/2023.
//

import SwiftUI
struct ContentView: View {
    @State var userSignedIn = false
    @State private var isExpanded = false
    // order stuff
    @State var appN = String()
    @State var merN = String()
    @State var delFe = Int()
    @State var payMS = String()
    @State var payMB = String()
    @State var cheP = String()
    @State var status = String()
    @State var notes = String()
    @State var createdAt = String()
    @State var orderID = UUID()
    @State var active = Bool()
    
    @State var orders: [Order] = []
    @State var userHasActiveOrder = false
    
    @State var isCreated = Bool()
    init() {
        UIScrollView.appearance().bounces = false
    }
       
    var body: some View {
        
        
        NavigationStack {
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    
                    Text("Princess Nora University, A4")
                        .fontWeight(.bold)
                        .font(.title3)
                        .padding(.trailing, 1)
                    
                    Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                        .foregroundColor(Color("Color1"))
                        .onTapGesture {
                            self.isExpanded.toggle()
                        }
                    
                }
                .padding()
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(Color.gray.opacity(0.5))
                
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("My Orders")
                        
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .font(.title3)
                            .padding()
                        // if i don't have active order
                        if userHasActiveOrder{
                            CardActiveOrder(merN: merN, status: status, orderID: orderID, isCreated: $isCreated)
                        } else {
                            CardNewOrder()
                        }
                        // else show my order
                        
                        Text("Active Orders Near Me")
                        
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .font(.title3)
                            .padding(.horizontal)
                        VStack(spacing: 15) {
                            ForEach(orders, id: \.id) { order in
                                
                                newJoinCard(appN: order.app_name, merN: order.merchant_name, delFe: order.delivery_fee, payMS: "STC", payMB: "Alrajhi", cheP: order.checkpoint, status: order.status ?? "waiting", notes: order.notes ?? "", orderID: order.id)
                                
                            }
                        }
                    }
                }
            }
            .onAppear{
                if WebAPI.userSignedIn() == true {
                    userSignedIn = true
                    
                    WebAPI.getOrdersAroundMe { res in
                        switch res {
                        case .success(let success):
                            self.orders = success
                        case .failure(let failure):
                            print("failure orders around me",failure)
                        }
                    }
//                    WebAPI.getMyActiveOrder { res in
//                        switch res {
//                        case .success(let success):
//                            print(success)
//                            self.userHasActiveOrder = true
//                            self.status = success.status ?? "waiting"
//                            self.merN = success.merchant_name
//                            self.orderID = success.id
////                            if success. == "created" {
////                                self.isCreated = true
////                            }
//                            // if joined go to checkbox
//                            // if created go to waiting1
//                        case .failure(let failure):
//                            print("mine ",failure)
//                            self.userHasActiveOrder = false
//                        }
//                    }
//                    WebAPI.getMyActiveOrder2 { res in
//                        switch res {
//                        case .success(let success):
////                            self.merN = success.order.merchant_name
//                            print("try 2 success",success)
////                            print(merN)
//                        case .failure(let failure):
//                            print("try 2 failure",failure)
//
//                        }
//                    }
                    WebAPI.getMyActiveOrder3 { res in
                        switch res {
                        case .success(let success):
                            self.userHasActiveOrder = true
                            self.status = success.order.status ?? "waiting"
                            self.merN = success.order.merchant_name
                            self.orderID = success.order.id
                            if success.type == "created"{
                                self.isCreated = true
                            } else {
                                self.isCreated = false
                            }
                            print("try 3 success",success)
//                            print(merN)
                        case .failure(let failure):
                            print("try 3 failure",failure)
                            self.userHasActiveOrder = false
                        }
                    }
                } else { // unsigned user -- fix this function
                    
//                    WebAPI.getRandomOrders { res in
//                        switch res {
//                        case .success(let success):
//                            self.orders = success
//                        case .failure(let failure):
//                            print(failure)
//                        }
//                    }
                }
            }
           
        }
        .navigationBarBackButtonHidden(true)
        
    }
       
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

    }
