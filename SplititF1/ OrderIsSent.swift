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
                    HStack{
                        
                        Text("Order Status")
                            .font(.system(size:28))
                            .fontWeight(.bold)
                            .padding(.trailing, 100.0)
                        
                        
                    }
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
                    
                }
                .padding(/*@START_MENU_TOKEN@*/.top, -250.0/*@END_MENU_TOKEN@*/)
                
                Text("You can Close Group to continue with current orders only  ")
                    .multilineTextAlignment(.leading)
                    .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
                    .padding(.top, -200.0)
                
                
                HStack{
                            
                    Button {
                        
                    } label: {
                        Text("Close Group")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 200)
                            .frame(height: 50)
                            .background(.orange)
                            .cornerRadius(10)
                        
                    }
                    .padding(.trailing, -170.0)
                    .padding(.top, -180.0)
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Divider()
                    .padding(.top, -120.0)
                VStack{
                    
                    Text("Orders Summary:")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .padding(.trailing, 200.0)
                        .padding(.top, -100.0)
                    
                    VStack{
                        VStack{
                            Order()
                                .padding(.top, -90.0)
                            
                        }
//                        VStack{
//                            Order()
//                                .padding(.top, -20.0)
//                            
//                        }
                      
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
            //  .padding(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/)
        }
    }
}
struct  OrderIsSent_Previews: PreviewProvider {
    static var previews: some View {
        OrderIsSent()
    }
}
