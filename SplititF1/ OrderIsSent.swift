//
//  PageWaiting.swift
//  SplititF1
//
//  Created by Abeer on 20/10/1444 AH.
//

import SwiftUI

struct  OrderIsSent: View {
    @State var timeRemaining = 900
    
    let timer = Timer.publish(every:1, on: .main,
                              in:
            .common)
        .autoconnect ()
    
    func convertSecondsToTime(timeInSeconds : Int) ->
    String {
        
        let minutes = timeInSeconds / 60
        
        let seconds = timeInSeconds % 60
        
        return String(format: "%02i:%02i" , minutes,
                      seconds)
    }
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    VStack{
                        
                        Text("Order Status")
                            .font(.system(size:28))
                            .fontWeight(.bold)
                            .padding(.trailing, 90.0)
                        
                        
                    }
                    .padding(.top, 290.0)
                    HStack{
                        Text(convertSecondsToTime(timeInSeconds : timeRemaining))
                            .padding()
                            .font(.system(size:25))
                            .fontWeight(.bold)
                            .onReceive(timer) {
                                _ in
                                timeRemaining -= 1
                            }
                    }
                    .padding(.top, 290.0)
                    
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.top, -250.0/*@END_MENU_TOKEN@*/)
                
                VStack{
                    Text("You can Close Group to continue with current orders only  ")
                        .multilineTextAlignment(.leading)
                       
                    
                }
                
                VStack{
                    TimelineTrack()
                    
                }
                .padding(.top, 20.0)
                
                VStack{
                    
                    
                    Button {
                        
                    } label: {
                        NavigationLink(destination: OrderArrived()) {
                            Text("Close Group")
                                .bold()
                                .foregroundColor(.black)
                                .frame(width: 200)
                                .frame(height: 50)
                                .background(Color("Color1"))
                                .cornerRadius(10)
                            
                        }.navigationBarBackButtonHidden(true)
                    }
                    .padding(.trailing, -170.0)
                    .padding(.top, -420.0)
                    
                    
                    
                }
                
                Divider()
                    .padding(.top, -350.0)
                
                VStack{
                    
                    Text("Orders Summary:")
                        .font(.system(size:23))
                        .fontWeight(.semibold)
                        .padding(.trailing, 200.0)
                    .padding(.top, -340.0)
                }
                    
                        VStack{
                            Order()
                                .padding(.top, -310.0)
                            
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
                
            }
            
        }
    }

struct  OrderIsSent_Previews: PreviewProvider {
    static var previews: some View {
        OrderIsSent()
    }
}
