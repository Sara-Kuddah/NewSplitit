//
//  OrderConfirmed  .swift
//  SplititF1
//
//  Created by Abeer on 04/11/1444 AH.
//

import SwiftUI

struct OrderConfirmed__: View {
    @State private var showingAlert = false
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    
                    Text("Order Status")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .padding(.trailing, 150.0)
                        .padding(.top, 40.0)
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
                
                HStack{
                    
                    Button {
                        showingAlert = true
                        
                    } label: {
                        Text("Order Arrived")
                        
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 200)
                            .frame(height: 50)
                            .background(Color("Color1"))
                            .cornerRadius(10)
                            .alert("Please Confirm who have payed you ", isPresented: $showingAlert) {
                                
                                VStack{
                                    
                                    Button("OK", role: .cancel) { }
                                }
                            }
                    }
                    .padding(.trailing, -170.0)
                    .padding(.top, -340.0)
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

struct OrderConfirmed___Previews: PreviewProvider {
    static var previews: some View {
        OrderConfirmed__()
    }
}
