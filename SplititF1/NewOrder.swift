//
//  NewOrder.swift
//  SplititF1
//
//  Created by Abeer on 01/11/1444 AH.
//

import SwiftUI

struct NewOrder: View {
    @State private var isPresentedFullScreenCover = false
    var body: some View {
        
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
