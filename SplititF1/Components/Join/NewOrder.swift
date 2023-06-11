//
//  NewOrder.swift
//  SplititF1
//
//  Created by Dina Alhajj Ibrahim on 25/05/2023.
//

import SwiftUI

struct NewOrder: View {
    var body: some View {
        NavigationStack{
            Button(action: {
                // Handle button action
            }) {
                NavigationLink(destination: Form()) {
                    Text("New Order")
                        .font(.system(size: 13, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .foregroundColor(Color.white)
                                .frame(width: 170, height: 33)
                        )
                }
            }
        }
    }
    
    struct NewOrder_Previews: PreviewProvider {
        static var previews: some View {
            NewOrder()
        }
    }
}
