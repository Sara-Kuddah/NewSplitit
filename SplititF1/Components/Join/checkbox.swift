//
//  checkbox.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 16/05/2023.
//

import SwiftUI

struct checkbox: View {
    @State private var isPopoverPresented = false
    @State var orderID = UUID()
        var body: some View {
            ZStack {
                // Background View
                OrderStatusPage(orderID: orderID)
                .blur(radius: isPopoverPresented ? 3 : 0)
                .animation(.easeInOut)
                
                // Checkbox and Popover
                VStack {
                    Spacer()
                    Checkbox2View(isChecked: $isPopoverPresented)
                        .padding()
                   // Spacer()
                    .padding(.leading, -180)
                    .padding(.bottom, 80)
                    
                }
                .onTapGesture {
                    isPopoverPresented.toggle()
                }
                
                if isPopoverPresented {
                    PopoverView(isPopoverPresented: $isPopoverPresented)
                        .frame(width: 343, height: 307)
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        //.offset(x: 70, y: -70) // Adjusted the y-offset
                }
            }
           // .edgesIgnoringSafeArea(.all)
        }
    }

    struct Checkbox2View: View {
        @Binding var isChecked: Bool
        
        var body: some View {
            Button(action: {
                isChecked.toggle()
            }) {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color("Mycolor"))
                Text("Payment Completed")
                    .font(.system(size: 14, weight: .regular, design: .default))
                    .foregroundColor(.black)
            }
        }
    }

    struct PopoverView: View {
        @Binding var isPopoverPresented: Bool
        
        var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        isPopoverPresented = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.title)
                            .padding(5) // Adjusted the padding
                    }
                }
                .padding(.top, 10) // Adjusted the top padding
                
                VStack {
                    Rectangle()
                        //.frame(max)
                        .foregroundColor(.white)
                       // .cornerRadius(8)
                        
                            Text("You have saved")
                                .font(.system(size: 28, weight: .bold, design: .default))
                                //.padding()
                    HStack {
                        Text("15")
                            .foregroundColor(Color("Mycolor"))
                            .font(.system(size: 80, weight: .semibold, design: .default))
                            //.padding()
                        Text("SR").foregroundColor(Color("Mycolor"))
                            .font(.system(size: 24, weight: .semibold, design: .default))
                            //.padding()
                        
                    }
                  Text(" By using Split It ! Keep using the app Keep saving!")
                            .font(.system(size: 13, weight: .regular, design: .default))
                            //.padding()
                }
               Spacer()
                    .padding()

            }
            .padding()
        }
    }


        
        struct checkbox_Previews: PreviewProvider {
            static var previews: some View {
                checkbox()
            }
        }
    
