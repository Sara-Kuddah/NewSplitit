//
//  joinCard.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 10/05/2023.
//

import SwiftUI

struct joinCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .frame(width: 343, height: 132)
                .shadow(radius: 5)
            VStack {
                HStack {
                    VStack {
                        Text("McDonald's")
                            .font(.system(size: 18, weight: .semibold, design: .default))
                         // .padding(.trailing, 5)
                          .padding(.trailing, 32)
                        Text("Note: I only have 55 Riyals")
                            .padding(.leading, 10)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 11, weight: .semibold, design: .default))
                           // .padding(.trailing, 5)
                    }
                    .padding(.top, 20)
                        .padding(.trailing, 110)
                    Text("15 minutes")
                        .foregroundColor(Color("ourgreen"))
                        .fontWeight(.semibold)
                        .font(.system(size: 11, weight: .bold, design: .default))
                    //.offset(y: -40)
                    
                    
                }
               
                
                HStack(spacing: 8) {
                    Image(systemName: "car")
                        .foregroundColor(Color("Color1"))
                    Text("20 Riyals")
                        .font(.caption)
                    Image(systemName: "apps.iphone")
                        .foregroundColor(Color("Color1"))
                    Text("Jahez")
                        .font(.caption)
                    Image(systemName: "dollarsign")
                        .foregroundColor(Color("Color1"))
                    Text("STC pay")
                        .font(.caption)
                    Image(systemName: "location")
                        .foregroundColor(Color("Color1"))
                    Text("PNU-A4")
                        .font(.caption)
                        .padding(.vertical, 1)
                }
                
//                JoinButton()
//                    .padding(.leading, 10)
//                    .padding(.bottom, 10)
                
            }
            
        }
        
    }
    
    
    struct joinCard_Previews: PreviewProvider {
        static var previews: some View {
            joinCard()
        }
    }
}
