//
//  checkbox.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 16/05/2023.
//

import SwiftUI

struct checkbox: View {
    @State private var isChecked = false
        
        var body: some View {
            //Spacer()
            Button(action: {
                isChecked.toggle()
            }) {
                HStack {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("Color1"))
                       
                    Text("Payment Completed")
                        .font(.system(size: 14, weight: .regular, design: .default))
                        .foregroundColor(.black)
                }
            }
            .padding()
            
        }
    }

struct checkbox_Previews: PreviewProvider {
    static var previews: some View {
        checkbox()
    }
}
