//
//  test2.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 15/05/2023.
//

import SwiftUI

struct test2: View {
    @State private var isDropdownExpanded = false
        
        var body: some View {
            VStack {
                HStack {
                    Text("McDonald's")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .font(.title)
                        .padding(.leading, 10)
                    
                    Spacer()
                    
                    Image(systemName: isDropdownExpanded ? "chevron.up" : "chevron.down")
                        .font(.system(size: 15, weight: .semibold, design: .default))
                        .padding(.trailing, 10)
                        .foregroundColor(.black)
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
            .frame(width: 340, height:isDropdownExpanded ? nil : 52, alignment: .top)
            .background(Color.white)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding()
        }
    }

struct test2_Previews: PreviewProvider {
    static var previews: some View {
        test2()
    }
}
