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
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color("Color1"))
                        .frame(width: 342, height: 150)
                    
                        .edgesIgnoringSafeArea(.top)
                        .navigationBarTitleDisplayMode(.inline)
                    //.shadow(radius: 30)
                    VStack {
                        Text("Couldn’t find what you look for ? Start new order now!")
                            .padding(.leading, -10)
                            .foregroundColor(.black)
                        
                            .font(.system(size: 17, weight: .semibold, design: .default))
                            .frame(width: 305, alignment: .topLeading)
                            .lineSpacing(0)
                        
                        
                        Button(action: {
                            // Button action here
                        }) {
                           
                                Text("New Order")
                                    .font(.system(size: 13, weight: .semibold, design: .default))
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 7)
                                            .foregroundColor(Color.white)
                                            .frame(width: 170, height: 33))
                                    .padding(.leading, 130)
                                    .padding(.top, 10)
                            }
                            
                        }
                    }
                    
                    
                
                
                
            
        }
    }
    struct CardNewOrder_Previews: PreviewProvider {
        static var previews: some View {
            CardNewOrder()
        }
    }
}
