//
//  SkipButton.swift
//  SplititF1
//
//  Created by Abeer on 03/11/1444 AH.
//

import SwiftUI

struct SkipButton: View {
    var body: some View {
        Button(action: {
            // Handle button action
        }) {
            Text("Skip")
                .foregroundColor(.black)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(Color("Color1"))
                        .frame(width: 365, height: 50)
                )
        }
    }
}

struct SkipButton_Previews: PreviewProvider {
    static var previews: some View {
        SkipButton()
    }
}
