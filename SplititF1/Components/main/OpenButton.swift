//
//  OpenButton.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 09/05/2023.
//

import SwiftUI

struct OpenButton: View {
    var body: some View {
        Button(action: {
            // Handle button action
        }) {
            Text("Open")
                .foregroundColor(.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("Mycolor"))
                        .frame(width: 210, height: 33)
                )
        }
    }
    struct OpenButton_Previews: PreviewProvider {
        static var previews: some View {
            OpenButton()
        }
    }
}
