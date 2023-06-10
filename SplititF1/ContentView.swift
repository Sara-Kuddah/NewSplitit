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
    
    @State var orders: [order] = []
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
                        CardNewOrder()
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
