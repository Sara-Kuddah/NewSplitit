//
//  JoinButton.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 09/05/2023.
//

import SwiftUI

struct JoinButton: View {
//    @State private var isPresentedFullScreenCover = false
    var body: some View {
        NavigationStack {
          
                NavigationLink(destination: FormForAddingOrder()) {
                    Text("Join")
                        .font(.system(size: 14, weight: .semibold, design: .default))
                        .foregroundColor(.black)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .foregroundColor(Color("Color1"))
                                .frame(width:70, height: 33)
                        )
                }
            
        }
    }
    struct JoinButton_Previews: PreviewProvider {
        static var previews: some View {
            JoinButton()
        }
    }
}
