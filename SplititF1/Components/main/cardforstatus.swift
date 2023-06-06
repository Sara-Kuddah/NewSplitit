//
//  cardforstatus.swift
//  SplititF1
//
//  Created by Dina Alhajj Ibrahim on 05/06/2023.
//

import SwiftUI

struct cardforstatus: View {
    var body: some View {
        
        VStack {
            Spacer()
//            timeline2()
            

            //Spacer()
            HStack {
            Spacer()
                NewOrder()
                

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
}

struct cardforstatus_Previews: PreviewProvider {
    static var previews: some View {
        cardforstatus()
    }
}
