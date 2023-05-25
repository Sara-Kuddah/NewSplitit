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
    @State private var isPresentedFullScreenCover = false
    var body: some View {
        NavigationView {
            VStack {
                
                VStack{
                    HStack{
                        HStack{
                            Text("Order Status")
                                .font(.system(size:28))
                                .fontWeight(.bold)
                                .padding(.trailing, 90.0)
                            
                        }
                        .padding(.top)
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
                        .padding(.top)
                    } //.padding(.top, -120.0)
                
                    Text("You only can cancel announcement when no one  joined yet")
                        .padding(.leading, 20.0)
                        
                       
                    VStack{
                        TimelineTrack()
                            .padding(.top, 10.0)
                    }
                    
                    NavigationLink(destination: TabBar()) {
                        Text("Cancel")
                            .padding(.all)
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 200)
                            .frame(height: 50)
                            .background(Color("Color1"))
                            .cornerRadius(10)
                        
                        
                            .offset(x:1 ,y:1)
                    }.navigationBarBackButtonHidden(true)
                    
                .padding(.trailing, -170.0)
                   .padding(.top, -50.0)
                    
                    Divider()
                    
                    Text("Waiting for others to join :")
                        .font(.system(size:25))
                        .fontWeight(.semibold)
                        .padding(.leading, -90.0)
                    
                    
                    
                    
                    
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
            .padding(.bottom, 400.0)
        }
    }
}

struct Waiting1_Previews: PreviewProvider {
    static var previews: some View {
        Waiting1()
    }
}
