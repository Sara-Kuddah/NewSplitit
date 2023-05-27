//
//  ContentView.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 09/05/2023.
//

import SwiftUI
struct ContentView: View {
    @State private var isExpanded = false
    @State var showTabBar: Bool = false
    init() {
        UIScrollView.appearance().bounces = false
    }
       
    var body: some View {
        
       
//            NavigationView {
               
        VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        
                        Text("Princess Nora University, A4")
                            .fontWeight(.bold)
                            .font(.title3)
                            .padding(.trailing, 1)
                           
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .foregroundColor(Color("Color1"))                             .onTapGesture {
                                self.isExpanded.toggle()
                            }
                        
                    }
                    .padding()
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.5))
                    
                    ScrollView {
                        VStack(alignment: .leading) {
                        Text("My Orders")
                        
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .font(.title3)
                            .padding()
                        
                            CardNewOrder()
                               
                            Text("Active Orders Near Me")
                            
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .font(.title3)
                                .padding(.horizontal)
                            VStack(spacing: 15) {
                                
                                newJoinCard()
                                newJoinCard()
                                newJoinCard()
                                newJoinCard()
                                newJoinCard()
                               
                            }
                           
                            
                        }
//
                    }
                    
                }
               
                .navigationBarBackButtonHidden(true)
        }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

    }
