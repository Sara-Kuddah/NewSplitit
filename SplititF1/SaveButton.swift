//
//  SaveButton.swift
//  SplititF1
//
//  Created by Abeer on 03/11/1444 AH.
//

import SwiftUI

struct SaveButton: View {
    var body: some View {
        Button(action: {
            // Handle button action
        }) {
            Text("Save")
                .foregroundColor(.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("Color1"))
                        .frame(width: 343, height: 61)
                )
        }
    }
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton()
    }
}
