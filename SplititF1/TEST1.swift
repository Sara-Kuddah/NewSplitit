//
//  TEST1.swift
//  SplititF1
//
//  Created by Dina Alhajj Ibrahim on 22/05/2023.
//

import SwiftUI

struct TEST1: View {
    @State private var selectedOption = ""
       @State private var isDropdownExpanded = false
       
       let options = ["Orignal", "Medium", "Large"]
       
       var body: some View {
           VStack {
               ZStack(alignment: .trailing) {
                   VStack {
                       
                       Text("Size")
                           .padding(.leading, -65)
                           .font(.system(size: 14, weight: .semibold, design: .default))
                       Rectangle()
                           .fill(Color.white)
                           .frame(width: 146, height: 52)
                           .overlay( RoundedRectangle(cornerRadius: 11)
                            .stroke(Color("Color1"))  )
                   }
                   
                   HStack {
                       Text(selectedOption)
                           .foregroundColor(.black)
                           .frame(maxWidth: .infinity, alignment: .center)
                           .padding(.top, 20)
                       
                       Image(systemName: "chevron.down")
                           .resizable()
                           .frame(width: 12, height: 6)
                           .padding(.top, 30)
                           .padding(.leading, -30)
                           .foregroundColor(.black)
                   }
               }
               .onTapGesture {
                   isDropdownExpanded.toggle()
               }
               .overlay(
                   VStack {
                       if isDropdownExpanded {
                           ForEach(options, id: \.self) { option in
                               Button(action: {
                                   selectedOption = option
                                   isDropdownExpanded.toggle()
                               }) {
                                   Text(option)
                                       .frame(width: 146, height: 30)
                                       .padding(.vertical, 4)
                                       .background(Color.white)
                               }
                           }
                       }
                   }
                   .frame(width: 146)
                   .border(Color.blue, width: 1) // Customize the border color and thickness here
                   .padding(.top, 2)
                   .opacity(isDropdownExpanded ? 1.0 : 0.0)
                   .animation(.easeInOut)
               )
           }
           .padding()
       }
   }


struct TEST1_Previews: PreviewProvider {
    static var previews: some View {
        TEST1()
    }
}
