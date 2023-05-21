//
//  SendButton.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 09/05/2023.
//

import SwiftUI

struct SendButton: View {
    var body: some View {
        Button(action: {
            // Handle button action
        }) {
            Text("Send")
                .foregroundColor(.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("Color1"))
                        .frame(width: 343, height: 61)
                )
        }
    }
    struct SendButton_Previews: PreviewProvider {
        static var previews: some View {
            SendButton()
        }
    }
}
