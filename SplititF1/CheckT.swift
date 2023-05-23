//
//  CheckT.swift
//  SplititF1
//
//  Created by Abeer on 03/11/1444 AH.
//

import SwiftUI

struct CheckT: View {
    @State private var isChecked = false
    
    var body: some View {
        //Spacer()
        Button(action: {
            isChecked.toggle()
        }) {
            HStack {
                HStack{
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("Color1"))
                    
                    Text("Transfer")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(.black)
                }
                
                
                .padding()
                
            }
        }
    }
}

struct CheckT_Previews: PreviewProvider {
    static var previews: some View {
        CheckT()
    }
}
