//
//  OrderStatusPage.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 17/05/2023.
//

import SwiftUI

struct OrderStatusPage: View {
    //    @State private var isChecked = false
    //    @State private var isInfoVisible = false
    //    @State private var text: String = ""
    //    @State private var isPresentedFullScreenCover = false
    @State var item_name = ""
    @State var price = ""
    @State var appN = String()
    @State var merN = String()
    @State var delFe = String()
    @State var payMS = String()
    @State var payMB = String()
    @State var cheP = String()
    @State var status = String()
    @State var orderID: UUID
    
    @State var items: [Item] = []
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        
                        Button(action: {
                            
                        }) {
                            NavigationLink(destination: TabBar()) {
                                Image(systemName: "chevron.left")
                                    .padding(.leading, 15)
                                    .foregroundColor(Color("Color1"))
                            }
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text(merN)
                            // .font(.headline)
                                .font(.system(size: 25, weight: .bold, design: .default))
                                .padding(.leading, -15)
                            Text("\(delFe), \(appN), \(payMS)-\(payMB), \(cheP)")
                            //.font(.subheadline)
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .padding(.leading, -15)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                    }
                    Divider()
                    
                    Text("Order Status")
                        .padding(.top, 30)
                        .padding(.trailing, 195)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .font(.title)
                        .padding(.trailing, 55)
                    Spacer()
                        .padding(.bottom,10)
                    
                    //TimelineTrack()
                    Spacer()
                    myOrderSummary()
                    
                    VStack {
                        Spacer()
                        // Card with text
                        RoundedRectangle(cornerRadius: 8)
                        
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 340, height: 52)
                            .overlay(
                                HStack {
                                    Text("Check-in Point")
                                        .font(.system(size: 15, weight: .semibold, design: .default))
                                        .padding(.leading)
                                    
                                    Spacer()
                                    
                                    Text(cheP)
                                        .font(.system(size: 15, weight: .semibold, design: .default))
                                        .foregroundColor(Color.gray)
                                        .padding(.trailing)
                                    
                                })                    }
                    
                    Spacer()
                    Divider()                }
                Text("Abeer’s Payment Info:")
                    .padding(.top, 20)
                    .padding(.trailing, 200)
                    .font(.system(size: 16, weight: .bold, design: .default))
                
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("Color1"), lineWidth: 1)
                    .frame(width: 342, height: 221)
                    .overlay(
                        VStack {
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    Text("Total :")
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                    Text("35 Riyals")
                                        .font(.system(size: 25, weight: .bold, design: .default))
                                        .foregroundColor(Color("Color1"))
                                        .padding(.top, 10)
                                    
                                    
                                    Text("STC Pay")
                                        .padding(.top, 50)
                                    Text("Al rajhi")
                                }
                                .font(.headline)
                                .foregroundColor(.black)
                                // .padding()
                                
                                // Spacer()
                                
                                VStack(alignment: .trailing, spacing: 10) {
                                    HStack {
                                        Text("0593491213")
                                            .font(.system(size: 13, weight: .semibold, design: .default))
                                        copyButton()
                                        
                                    }
                                    .padding(.top, 140)
                                    HStack {
                                        Text("SA144495930005887")
                                            .font(.system(size: 13, weight: .semibold, design: .default))
                                        copyButton()
                                    }
                                }
                                .font(.headline)
                                .foregroundColor(.black)
                                
                            }
                            
                        })
                
            }
        }
        .onAppear{
            WebAPI.getMyActiveOrder { res in
                switch res {
                case .success(let success):
                    print(success)
                    self.merN = success.merchant_name
                    self.appN = success.app_name
                    self.delFe = String(success.delivery_fee)
                    self.cheP = success.checkpoint
                    self.status = success.status ?? "waiting"
                case .failure(let failure):
                    print(failure)
                }
            }
            WebAPI.getItemsInOrder(orderID: orderID) { res in
                switch res {
                case .success(let success):
                    self.items = success
                    print(success)
                    
                case .failure(let failure):
                    print(failure)
                }
            }
        }
        
    }
}
//    struct OrderStatusPage_Previews: PreviewProvider {
//        static var previews: some View {
//            OrderStatusPage()
//        }
//    }
    

