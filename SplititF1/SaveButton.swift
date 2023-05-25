//
//  SaveButton.swift
//  SplititF1
//
//  Created by Abeer on 03/11/1444 AH.
//

import SwiftUI

struct SaveButton: View {
    @State private var isPresentedFullScreenCover = false
    var body: some View {
        
        Button(action: {
            // Handle button action
        }) {
            NavigationLink(destination: TabBar()) {
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
}

struct SaveButton_Previews: PreviewProvider {
    static var previews: some View {
        SaveButton()
    }
}
