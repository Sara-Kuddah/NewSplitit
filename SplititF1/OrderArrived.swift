//
//  OrderArrived.swift
//  SplititF1
//
//  Created by Abeer on 24/10/1444 AH.
//

import SwiftUI

struct OrderArrived: View {
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    
                    Text("Order Status")
                        .font(.system(size:28))
                        .fontWeight(.bold)
                        .padding(.trailing, 100.0)
                        .padding(.top, 30.0)
                       .padding(.leading, -100)
                    
                }
               
                
                VStack {
                    Text("Once You set Order please click Confirm to let others know you’ve ordered ")
                        .multilineTextAlignment(.leading)
                        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                        .padding(.top, 00.1)
                }
                
                VStack{
                    TimelineTrack()
                        .padding(.top, 10.0)
                }
                
                HStack{
                    
                    Button {
                        showingAlert = true
                        
                    } label: {
                        Text("Order Confirmed")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 200)
                            .frame(height: 50)
                            .background(.orange)
                            .cornerRadius(10)
                            .alert("Please Confirm who have payed you ", isPresented: $showingAlert) {
                                
                                VStack{
                                    
                                    Button("OK", role: .cancel) { }
                                }
                            }
                    }
                    .padding(.trailing, -170.0)
                    .padding(.top, -300.0)
                }
               
                Divider()
                    .padding(.top, -240.0)
                
                
                Text("Orders Summary:")
                    .font(.system(size:23))
                    .fontWeight(.bold)
                    .padding(.trailing, 180.0)
                    .padding(.top, -230.0)
                
                VStack{
                    VStack{
                        Order()
                            .padding(.top, -210.0)
                        
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
        
    }
}

struct OrderArrived_Previews: PreviewProvider {
    static var previews: some View {
        OrderArrived()
    }
}
