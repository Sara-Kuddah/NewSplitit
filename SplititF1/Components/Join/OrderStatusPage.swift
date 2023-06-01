//
//  OrderStatusPage.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 17/05/2023.
//

import SwiftUI

struct OrderStatusPage: View {
    @State private var isChecked = false
    @State private var isInfoVisible = false
    @State private var text: String = ""
    @State private var isPresentedFullScreenCover = false
    var body: some View {
        NavigationStack {
            ScrollView {
                
                VStack(spacing: 8) {
                    HStack(spacing: 8) {
                        
                        Button(action: {
                            
                        }) {
                            NavigationLink(destination: TabBar()) {
                                Image(systemName: "chevron.left")
                                    .padding(.leading, 15)
                                    .foregroundColor(Color("Color1"))
                            }
                        }
                        Spacer()
                        VStack(alignment: .center, spacing: 2) {
                            Text("McDonald's")
                            // .font(.headline)
                                .font(.system(size: 25, weight: .bold, design: .default))
                                .padding(.leading, -15)
                            Text("20 SR, Jahez, STC Pay-Al Rajhi, PNU-A4")
                            //.font(.subheadline)
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .padding(.leading, -15)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                    }
                    Divider()
                    
                    Text("Order Status")
                        .padding(.top, 20)
                        .padding(.trailing, 195)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .font(.title)
                        .padding(.trailing, 50)
                    Spacer()
                    
                  
                    TimelineTrack()
                    Spacer()
                    myOrderSummary()
                    
                    
                    
                    
                    VStack {
                        Spacer()
                        // Card with text
                        RoundedRectangle(cornerRadius: 8)
                        
                            .stroke(Color.gray, lineWidth: 1)
                            .frame(width: 340, height: 52)
                            .overlay(
                                HStack {
                                    Text("Check-in Point")
                                        .font(.system(size: 15, weight: .semibold, design: .default))
                                        .padding(.leading)
                                    
                                    Spacer()
                                    
                                    Text("PNU-A4")
                                        .font(.system(size: 15, weight: .semibold, design: .default))
                                        .foregroundColor(Color.gray)
                                        .padding(.trailing)
                                    
                                })
                        
                        
                    }
                    
                    Spacer()
                    Divider()
                    
                    
                   
                }
                Text("Abeer’s Payment Info:")
                    .padding(.top, 20)
                    .padding(.trailing, 200)
                    .font(.system(size: 16, weight: .bold, design: .default))
                
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("Color1"), lineWidth: 1)
                    .frame(width: 342, height: 221)
                    .overlay(
                        VStack {
                            HStack {
                                VStack(alignment: .leading, spacing: 10) {
                                    
                                    Text("Total :")
                                        .font(.system(size: 14, weight: .bold, design: .default))
                                    Text("35 Riyals")
                                        .font(.system(size: 25, weight: .bold, design: .default))
                                        .foregroundColor(Color("Color1"))
                                        .padding(.top, 10)
                                    
                                   
                                    Text("STC Pay")
                                        .padding(.top, 50)
                                    Text("Al rajhi")
                                }
                                .font(.headline)
                                .foregroundColor(.black)
                                // .padding()
                                
                                // Spacer()
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack {
                                        Text("                   0593491213")
                                            .font(.system(size: 13, weight: .semibold, design: .default))
                                        copyButton()
                                        
                                    }
                                    .padding(.top, 140)
                                    HStack {
                                        Text("SA144495930005887")
                                            .font(.system(size: 13, weight: .semibold, design: .default))
                                        copyButton()
                                    }
                                }
                                .font(.headline)
                                .foregroundColor(.black)
                                
                            }
                        })
                checkbox()
                    .padding(.leading, -180)
                
            }
        }
        
    }
    struct OrderStatusPage_Previews: PreviewProvider {
        static var previews: some View {
            OrderStatusPage()
        }
    }
}
