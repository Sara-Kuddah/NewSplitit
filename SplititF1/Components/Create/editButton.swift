//
//  test4.swift
//  SplititF1
//
//  Created by Abeer on 04/11/1444 AH.
//

import SwiftUI

struct editButton: View {
    var body: some View {
        
        Button(action: {
            // Add your button action here
            print("Button pressed")
        }) {
            Image(systemName: "square.and.pencil")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(Color("Mycolor"))
        }
    }
}

struct test4_Previews: PreviewProvider {
    static var previews: some View {
        editButton()
    }
}
