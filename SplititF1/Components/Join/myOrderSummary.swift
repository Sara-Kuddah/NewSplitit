//
//  test2.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 15/05/2023.
//

import SwiftUI

struct myOrderSummary: View {
    @State private var isDropdownExpanded = false
    @State var orderID: UUID
    @State var items: [Item] = []
    @State var totalPrice = 0.0
        var body: some View {
            VStack {
                HStack {
                    Text("My Order")
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
                        Divider()
                        // i think i should start for loop here
                        ForEach(items, id: \.item_name) { item in
                            
                        
                            HStack {
                                Text(item.item_name)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .medium, design: .default))
                                    .padding(.leading, 10)
                                    .frame(maxWidth: .infinity, alignment: .leading) // Align additional info text on the left
                                Spacer() // Add spacer
                                
                                Text("\(String(format: "%.1f", item.price)) Riyals")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 13, weight: .medium, design: .default))
                                    .padding(.trailing, 10)
                            }

                        }
//                        HStack {
//                            Text("1 large Fries  ")
//                                .foregroundColor(.gray)
//                                .font(.system(size: 13, weight: .medium, design: .default))
//                                .padding(.leading, 10)
//                                .frame(maxWidth: .infinity, alignment: .leading)
//                            // Align text 1 on the left
//                            
//                            Text("20 Riyals ")
//                                .foregroundColor(.gray)
//                                .font(.system(size: 13, weight: .medium, design: .default))
//                                .padding(.trailing, 10)
//                                .frame(maxWidth: .infinity, alignment: .trailing)
//                            // Align text 2 on the right
//                          
//                        }
                        Divider()
                        HStack {
                            Text("Total Without Delivery Fee ")
                                .font(.system(size: 10, weight: .medium, design: .default))
                                .padding(.leading, 10)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            // Align text 1 on the left
                            
                            Text("\(String(format: "%.1f",totalPrice)) Riyals ")
                                .font(.body)
                                .padding(.trailing, 10)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            // Align text 2 on the right
                          
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
            .onAppear{
                WebAPI.getMyItemsInOrder(orderID: orderID) { res in
                    switch res {
                    case .success(let success):
                        self.items = success
                        print("?",success)
    //                    print(orderID.uuid)
                        for i in success {
                            self.totalPrice = totalPrice + i.price
                        }
                        print("here")
                    case .failure(let failure):
                        print(failure)
                    }
                }
            }
        }
    }

//struct test2_Previews: PreviewProvider {
//    static var previews: some View {
//        myOrderSummary()
//    }
//}
