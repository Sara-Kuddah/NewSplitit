//
//  LargeButton.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 25/05/2023.
//

import SwiftUI

struct LargeButton: View {
//    @State private var isPresentedFullScreenCover = false
//    @State var title = ""
    
    typealias actionHandled = () -> Void
    
    let title: String
    let handler: actionHandled
    
    internal init(title: String,
                  handler: @escaping LargeButton.actionHandled) {
        self.title = title
        self.handler = handler
    }
    
    var body: some View {
        
        Button(action: {
            handler()
        }) {
            
//            NavigationLink(destination: TabBar()) {
                Text(title)
                    .foregroundColor(.black)
                    .padding()
//                    .background(
//                        RoundedRectangle(cornerRadius: 5)
//                            .foregroundColor(Color("Color1"))
////                            .frame(width: 365, height: 50)
//                            .frame(maxWidth: .infinity)
//                    )
                    
//            }
        }
        .frame(maxWidth: .infinity)
        .background(Color("Color1"))
        .cornerRadius(8)
        .padding([.trailing, .leading])
    }
}

struct LargeButton_Previews: PreviewProvider {
    static var previews: some View {
        LargeButton(title: "button") {}
    }
}
