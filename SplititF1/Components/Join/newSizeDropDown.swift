//
//  newSizeDropDown.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 27/05/2023.
//

import SwiftUI

struct newSizeDropDown: View {
    @State private var selectedOption = "Original"
    @State private var isDropdownExpanded = false
    
    let options = ["Small", "Original", "Medium", "Large"]
    var body: some View {
        VStack (alignment: .leading){
            // Picker
            Text("Size")
                .font(.system(size: 14, weight: .semibold, design: .default))
//                .fontWeight(.medium)
            
            Picker("What App Are You Ordering From? ", selection: $selectedOption){
                ForEach(options, id: \.self){
                    Text($0)
                }
            } .pickerStyle(.automatic)
                .accentColor(.black)
            
                .frame(width: 146, height: 52)
//                .frame(maxWidth: .infinity)
                .textFieldStyle(PlainTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color("Color1")))
        }
    }
}

struct newSizeDropDown_Previews: PreviewProvider {
    static var previews: some View {
        newSizeDropDown()
    }
}
