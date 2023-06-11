//
//  CardActiveOrder.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 10/06/2023.
//

import SwiftUI

struct CardActiveOrder: View {
    @State var merN = String()
    @State var status = String()
    @State var orderID = UUID()
//    @State var isJoined = Bool()
    @State var isCreated = Bool()
    @State var showWaiting = false
    @State var showCheckBox = false
    var body: some View {
        VStack {
            Text(merN)
                .font(.system(size: 18, weight: .semibold, design: .default))
            Text("Order Status: \(status)")
            
            if isCreated {
                // go somewhere
                Button {
                    showWaiting = true
                } label: {
                    Text("Show Order")
                }
                .fullScreenCover(isPresented: $showWaiting) {
                    Waiting1()
                }

            } else {
                // somewhere else
                Button {
                    showCheckBox = true
                } label: {
                    Text("Show Order")
                }
                .fullScreenCover(isPresented: $showCheckBox) {
                    checkbox(orderID: orderID)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.1), radius: 10)
        .padding([.trailing, .leading])
    }
}
//
//struct CardActiveOrder_Previews: PreviewProvider {
//    static var previews: some View {
//        CardActiveOrder()
//    }
//}
