//
//  PaymentCard.swift
//  SplititF1
//
//  Created by Abeer on 04/11/1444 AH.
//

import SwiftUI

struct PaymentCard: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white)
                .frame(width: 343, height: 132)
                .shadow(radius: 5)
            VStack {
                HStack (spacing: 50) {
                    Text("STC Pay")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                    Text("0593491213")
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                    HStack{
                        test4()
                            .padding(.leading, 10.0)
                    }
                    
                    
                }
                
                HStack (spacing: 50) {
                    Text("AlRajhi")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                    Text("SA14449590554...")
                        .font(.system(size: 10))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    HStack{
                        test4()
                            .padding(.leading, 0.0)
                    }
                }
                .padding(.top)
        //.padding(.horizontal, 40.0)
                
                
                
                
                
            }
            
        }
        
    }
}

struct PaymentCard_Previews: PreviewProvider {
    static var previews: some View {
        PaymentCard()
    }
}
