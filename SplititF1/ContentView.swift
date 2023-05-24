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
        
       
            NavigationView {
               
                VStack(spacing: 0) {
                    HStack {
                        
                        Text("Street 1")
                            .fontWeight(.bold)
                            .font(.title3)
                            .padding(.trailing, 1)
                           
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .foregroundColor(Color("Color1"))                             .onTapGesture {
                                self.isExpanded.toggle()
                            }
                        
                    }
                    .padding(.bottom, 5)
                    .padding(.leading, -160)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color.gray.opacity(0.5))
                    //Spacer()
                        .padding(.top, 5)
                    ScrollView {
                        Text("My Orders")
                            .padding(.top, 15)
                            .padding(.trailing, 130)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .font(.title3)
                            .padding(.trailing, 130)
                        .padding(.top, 20)
                        
                            .padding(.bottom, -10)
                        VStack {
                            CardNewOrder()
                               // .padding(.bottom, 25)
                            Text("Active Orders Near Me")
                            
                                .padding(.trailing, 150)
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .font(.title3)
                            // Spacer()
                            //.padding(.bottom, 480)
                            
                            VStack(spacing: 30) {
                                
                                joinCard()
                                    .padding(.top, 3)
                                joinCard()
                                    .padding(.top, -20)
                                joinCard()
                                    .padding(.top, -20)
                                joinCard()
                               
                            }
                           
                            
                        }
                        
                        
                        
                     .offset(y: 20)
                       Spacer()
                        
                    }
                    
                  
                }
               
                //.ignoresSafeArea(.container)
            }
        
        }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

    }
