//
//  test4.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 17/05/2023.
//

import SwiftUI

struct test4: View {
    @State private var selectedOption: String = ""
        @State private var isShowingOptions: Bool = false
        
        var body: some View {
            VStack {
                HStack {
                    TextField("Select Option", text: $selectedOption)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding()
                        .background(Color.white)
                     
                        .frame(width: 146, height: 52)
                        .overlay( RoundedRectangle(cornerRadius: 11)
                            .stroke(Color("Color1"))  )

                    
                    Button(action: {
                        isShowingOptions.toggle()
                    }) {
                        Image(systemName: "chevron.down")
                            .padding(.bottom)
                            .foregroundColor(.black)
                    }
                   
                }
                
                if isShowingOptions {
                    Picker(selection: $selectedOption, label: Text("")) {
                        Text("Original").tag("Original")
                        Text("Medium").tag("Medium")
                        Text("Large").tag("Large")
                    }
                }
                
               
            }
        }
    

   

    
    struct test4_Previews: PreviewProvider {
        static var previews: some View {
            test4()
        }
    }
}
