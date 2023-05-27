//
//  OrderArrived.swift
//  SplititF1
//
//  Created by Abeer on 24/10/1444 AH.
//

import SwiftUI

struct OrderArrived: View {
    @State private var showingAlert = false
    @State private var isPresentedFullScreenCover = false
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    
                    Text("Order Status")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .padding(.trailing, 150.0)
                        .padding(.top, 40.0)
                       .padding(.leading, -100)
                    
                }
               
                
                VStack {
                    Text("Once You set Order please click Confirm to let others know you’ve ordered ")
                        .font(.system(size:12))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, -10.0)
                        .padding(.top, -5.0)

                }
                
                VStack{
                    TimelineTrack()
                        .padding(.top, 10.0)
                }
                
                VStack{
                    
                    
                    Button {
                        
                    } label: {
                        NavigationLink(destination: OrderConfirmed__()) {
                            Text("Order Confirmed")
                                .bold()
                                .foregroundColor(.black)
                                .frame(width: 200)
                                .frame(height: 50)
                                .background(Color("Color1"))
                                .cornerRadius(10)
                            
                        }
                        
//                        .navigationBarBackButtonHidden(true)
                    }
                    .padding(.trailing, -170.0)
                    .padding(.top, -350.0)
                    
                    
                    
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
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) { // <3>
                        VStack {
                            Text("McDonald's").font(.title).fontWeight(.bold)
                            Text("20 SR, Jahez, STC Pay-Al Rajhi, PNU-A4 ")
                            Divider()
                            
                            
                            
                        }
                        .padding(.top)
                    }
                    
                }
                
                
                
                
                
                
            }
            .padding(.bottom, 150.0)
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct OrderArrived_Previews: PreviewProvider {
    static var previews: some View {
        OrderArrived()
    }
}