//
//  Check1.swift
//  SplititF1
//
//  Created by Abeer on 18/11/1444 AH.
//

import SwiftUI

struct Check1: View {
    
        @State private var isChecked = false
        
        var body: some View {
            Button(action: {
                isChecked.toggle()
            }) {
                HStack {
                    HStack{
                        Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                            .resizable()
                            .frame(width: 20, height: 20)
    //                        .foregroundColor(Color(""))
                            .foregroundColor(.orange)
                        Text("")
                            .font(.system(size: 14, weight: .regular, design: .default))
                            .foregroundColor(.black)
                    }
                    .padding()
                }
            }
        }
    }
    


struct Check1_Previews: PreviewProvider {
    static var previews: some View {
        Check1()
    }
}
