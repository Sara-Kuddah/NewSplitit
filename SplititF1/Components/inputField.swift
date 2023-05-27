//
//  inputField.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 26/05/2023.
//

import SwiftUI

struct inputField: View {
    @State var placeholder = ""
    @State var text = ""
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .font(.system(size: 15))
            .frame(height: 50)
//            .textFieldStyle(PlainTextFieldStyle())
//            .padding(.horizontal, 4)
        
            .overlay( RoundedRectangle(cornerRadius: 11)
                .stroke(Color("Color1"))  )
//            .padding([.horizontal], 24)
//            .padding(.top, -6.0)
//            .padding(.horizontal)
    }
}

struct inputField_Previews: PreviewProvider {
    static var previews: some View {
        inputField()
    }
}
