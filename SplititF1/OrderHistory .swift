//
//  OrderHistory .swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 19/05/2023.
//

import SwiftUI

struct OrderHistory: View {
    // mer name, createdat, active
    @State var merN = String()
    @State var crAt = String()
    @State var active = Bool()
    @State var orders: [Order] = []
    var body: some View {
            VStack(alignment: .leading) {
                        Text("My Orders")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                        Divider()
                // for each
                ForEach(orders, id: \.id) { order in
                    
                
                    VStack{
                        HStack {
                            VStack(alignment: .leading, spacing: 4.0) {
                                
                                Text(order.merchant_name)
                                    .font(.system(size: 18, weight: .semibold, design: .default))
                                
                                Text(order.createdAt ?? "")
                                    .font(.system(size:12, weight: .regular, design: .default))
                                
                                Text(order.active! ? "Active Order" : "inactive")
                                    .font(.system(size: 15, weight: .semibold, design: .default))
                                    .foregroundColor(Color("ourgreen"))
                                
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                // Button action here
                            }) {
                                Image(systemName: "chevron.right")
                                    .font(.system(size: 20))
                                    .foregroundColor(.gray)
                                    .font(.title)
                            }
                        }
                        
                        Divider()
                    }
                }
                
                Spacer()
                    }
                    .padding()
        // on appear get all my orders
                    .onAppear {
                        WebAPI.getAllMyOrders { res in
                            switch res {
                            case .success(let success):
                                self.orders = success
                                print("get all mine succ", success)
                            case .failure(let failure):
                                print("get all my orders", failure)
                            }
                        }
                    }
                }
            }

struct OrderHistory__Previews: PreviewProvider {
    static var previews: some View {
        OrderHistory()
    }
}
