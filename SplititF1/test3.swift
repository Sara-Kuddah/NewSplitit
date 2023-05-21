//
//  test3.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 15/05/2023.
//

import SwiftUI

struct test3: View {
    var body: some View {
       
                Button(action: {
                    // Add your button action here
                    print("Button pressed")
                }) {
                    Image(systemName: "doc.on.doc")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color("Color1"))
                }
            }
        
struct test3_Previews: PreviewProvider {
    static var previews: some View {
        test3()
    }
}
            }
