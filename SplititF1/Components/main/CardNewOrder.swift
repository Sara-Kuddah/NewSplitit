//
//  CardNewOrder.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 09/05/2023.
//

import SwiftUI

struct CardNewOrder: View {
   
    var body: some View {
       

        VStack {
            Text("Couldn’t find what you look for ? Start new order now!")
                .foregroundColor(.white)
                .font(.system(size: 17, weight: .semibold, design: .default))
                .padding(.top, 5)
            Spacer()
            HStack {
                Spacer()
                
                Button(action: {
                    // Button action here
                        }) {
                   
                        Text("New Order")
                            .font(.system(size: 13, weight: .semibold, design: .default))
                            .foregroundColor(.black)
//                            .padding()
//                            .background(
//                            RoundedRectangle(cornerRadius: 7)
//                                .foregroundColor(Color.white)
//                                .frame(width: 170, height: 33))

                    }
                        .frame(width: 170, height: 40)
                        .background(Color.white)
                        .cornerRadius(7)
                        }
                        
                            
                        }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 150)
                    .background(Color("Color1"))
                    .cornerRadius(14)
                    .padding([.trailing, .leading])
                    
                    
                
                
                
            
        
    }
    struct CardNewOrder_Previews: PreviewProvider {
        static var previews: some View {
            CardNewOrder()
        }
    }
}