//
//  Waiting1.swift
//  SplititF1
//
//  Created by Abeer on 23/10/1444 AH.
//

import SwiftUI

struct Waiting1: View {
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
            VStack {
                
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
                    } .padding(.top, -120.0)
                
                    Text("You only can cancel announcement when no one  joined yet ")
                        .multilineTextAlignment(.leading)
                        .padding(/*@START_MENU_TOKEN@*/.horizontal, 1.0/*@END_MENU_TOKEN@*/)
                        .padding(.top, -80.0)
                    
                    
                    
                    
                    Button {
                        
                    } label: {
                        Text("Cancel")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 200)
                            .frame(height: 50)
                            .background(.orange)
                            .cornerRadius(10)
                        
                    }
                    .padding(.trailing, -170.0)
                    .padding(.top, -50.0)
                    
                    Divider()
                    
                    Text("Waiting for others to join :")
                        .font(.system(size:25))
                        .fontWeight(.semibold)
                        .padding(.leading, -100.0)
                    
                    //                    VStack
                    //                    .padding(/*@START_MENU_TOKEN@*/.leading, -150.0/*@END_MENU_TOKEN@*/)
                    //                    .foregroundColor(.black)
                    //                    .frame(width: 350)
                    //                    .frame(height: 210)
                    
                    //                    .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                    //  .cornerRadius(1)
                    
                    //
                    
                    
                    
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
            .padding(.bottom, 250.0)
        }
    }
}

struct Waiting1_Previews: PreviewProvider {
    static var previews: some View {
        Waiting1()
    }
}
