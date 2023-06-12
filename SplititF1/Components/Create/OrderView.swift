//
//  Order.swift
//  SplititF1
//
//  Created by Abeer on 27/10/1444 AH.
//

import SwiftUI

struct OrderView: View {
    @State private var isDropdownExpanded = false


    var body: some View {
           VStack {
               HStack {
                   VStack{
                       Text("Reem")
                           .font(.system(size: 14, weight: .regular, design: .default))
                           .foregroundColor(.gray)
                           .font(.title)
                           .padding(.leading, -47)
                       
                       Text("(123) 456-7890")
                           .font(.system(size: 15, weight: .regular, design: .default))
                           .font(.title)
                           .padding(.leading, 10)
                       
                       Text ("Order Name")
                           .font(.system(size: 15, weight: .semibold, design: .default))
                           .font(.title)
                           .padding(.leading, -10)
                   }
                   
                   Spacer()
                   
                   Image(systemName: isDropdownExpanded ? "chevron.up" : "chevron.down")
                       .font(.system(size: 15, weight: .semibold, design: .default))
                       .padding(.trailing, 10)
                       .foregroundColor(Color("Mycolor"))
                       .onTapGesture {
                           isDropdownExpanded.toggle()
                       }
               }
               .padding(.top, 15)
               
               if isDropdownExpanded{
                   VStack(alignment: .leading, spacing: 8) {
                       Divider();
                       HStack {
                           Text("1 McChicken")
                               .foregroundColor(.gray)
                               .font(.system(size: 13, weight: .medium, design: .default))
                               .padding(.leading, 10)
                               .frame(maxWidth: .infinity, alignment: .leading) // Align additional info text on the left
                           Spacer() // Add spacer
                                                   
                           Text("20 Riyals")
                               .foregroundColor(.gray)
                               .font(.system(size: 13, weight: .medium, design: .default))
                           .padding(.trailing, 10)
                                               

                       }
                       HStack {
                           Text("1 large Fries  ")
                               .foregroundColor(.gray)
                               .font(.system(size: 13, weight: .medium, design: .default))
                               .padding(.leading, 10)
                               .frame(maxWidth: .infinity, alignment: .leading) // Align text 1 on the left
                           
                         
                           
                           Text("20 Riyals ")
                               .foregroundColor(.gray)
                               .font(.system(size: 13, weight: .medium, design: .default))
                               .padding(.trailing, 10)
                               .frame(maxWidth: .infinity, alignment: .trailing) // Align text 2 on the right
                         
                       }
                       Divider();
                       HStack {
                           Text("Total Without Delivery Fee ")
                               .font(.system(size: 10, weight: .medium, design: .default))
                               .padding(.leading, 10)
                               .frame(maxWidth: .infinity, alignment: .leading) // Align text 1 on the left
                           
                         
                           
                           Text("30 Riyals ")
                               .font(.body)
                               .padding(.trailing, 10)
                               .frame(maxWidth: .infinity, alignment: .trailing) // Align text 2 on the right
                         
                       }
                   }
                   .padding(.bottom, 10)
               }
           }
           .frame(width: 340, height:isDropdownExpanded ? nil : 75, alignment: .top)
           .background(Color.white)
           .cornerRadius(8)
           .overlay(
               RoundedRectangle(cornerRadius: 8)
                   .stroke(Color.orange, lineWidth: 1)
           )
           .padding()
       }
   }


struct Order_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
