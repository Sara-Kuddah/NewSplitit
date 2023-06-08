//
//  OrderConfirmed  .swift
//  SplititF1
//
//  Created by Abeer on 04/11/1444 AH.
//

import SwiftUI

struct OrderConfirmed__: View {
    @State private var showingAlert = false
    @State var isPresented = false
    var body: some View {
        NavigationView {
            VStack{
                HStack(spacing: 8) {
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination:  TabBar()) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("Color1"))
                                .padding(.leading)
                        }
                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 2) {
                        Text("McDonald's")
                            .font(.system(size: 25, weight: .bold, design: .default))
                        Text("20 SR, Jahez, STC Pay-Al Rajhi, PNU-A4")
                            .font(.system(size: 13, weight: .regular, design: .default))
                            .foregroundColor(.secondary)
                        
                    }
                    .padding(.trailing)
                    Spacer()
                }
                Divider()
                VStack{
                    
                    Text("Order Status")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .padding(.trailing, 150.0)
                        .padding(.top,10.0)
                       .padding(.leading, -90)
                    
                }
               
                
                VStack {
                    Text("Please click Order Arrived once the order arrive so other’s can go to pick their items")
                        .font(.system(size:12))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                        .padding(.top, -5.0)

                }
                
                VStack{
                    TimelineTrack()
                        .padding(.top, 10.0)
                }
                
//                ZStack {
////                    Color.white.ignoresSafeArea()
//
//                    Button("OrderArrived") {
//                        isPresented = true
//                    }//.bold()
//                        .foregroundColor(.black)
//                        .frame(width: 200)
//                        .frame(height: 50)
//                        .background(Color(.orange))
//                        .cornerRadius(10)
//                }
//                .padding(.trailing, -170.0)
//                                    .padding(.top, -330.0)
//                .popup(isPresented: $isPresented) {
//                    BottomPopupView {
//                        NamePopupView(isPresented: $isPresented)
//                    }
//                }
                HStack{

                    Button {
                        //showingAlert = true

                    } label: {
                        NavigationLink(destination: TabBar()) {
                            Text("Order Arrived")
                            
                                .bold()
                                .foregroundColor(.black)
                                .frame(width: 200)
                                .frame(height: 50)
                                .background(Color("Color1"))
                                .cornerRadius(10)
                        }
//                            .alert("Please Confirm who have payed you ", isPresented: $showingAlert) {
//
//                                VStack{
//
//                                    Button("OK", role: .cancel) { }
//                                }
//                            }
                    }
                    .padding(.trailing, -170.0)
                    .padding(.top, -330.0)
                }
               
                Divider()
                    .padding(.top, -280.0)
                
                
                Text("Orders Summary:")
                    .font(.system(size:20))
                    .fontWeight(.bold)
                    .padding(.trailing, 200.0)
                    .padding(.top, -280.0)
                
                VStack{
                    VStack{
                        Order()
                            .padding(.top, -270.0)
                        
                    }
                    
                    
                    
                    
                }
//                .navigationBarTitleDisplayMode(.inline)
//                .toolbar {
//                    ToolbarItem(placement: .principal) { // <3>
//                        VStack {
//                            Text("McDonald's").font(.title).fontWeight(.bold)
//                            Text("20 SR, Jahez, STC Pay-Al Rajhi, PNU-A4 ")
//                            Divider()
//
//
//
//                        }
//                        .padding(.top)
//                    }
//
//                }
                
                
                
                
                
                
            }
            .padding(.bottom, 150.0)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct OrderConfirmed___Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OrderConfirmed__()
            OrderConfirmed__(isPresented: true)
        }
    }
}
