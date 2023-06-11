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
//    @State private var isPresentedFullScreenCover = false
    @State var appN = String()
    @State var merN = String()
    @State var delFe = String()
    @State var payMS = String()
    @State var payMB = String()
    @State var cheP = String()
    @State var status = String()
    var body: some View {
        NavigationView {
            VStack {
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
                        Text(!merN.isEmpty ? "\(merN)" : "McDonald's")
                            .font(.system(size: 25, weight: .bold, design: .default))
                        HStack {
                            Text(!delFe.isEmpty ? "\(delFe)SR" : "20SR")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                            
                            Text(!appN.isEmpty ? "\(appN)" : "Jahez")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                            
                            Text(!payMB.isEmpty ? "\(payMB)" : "Al rajhi")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                            
                            Text(payMS.isEmpty ? "" : "STC Pay")
//                            Text("20 SR, Jahez, STC Pay-Al Rajhi, PNU-A4")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                            Text(!cheP.isEmpty ? "\(cheP)" : "PNU A4")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.trailing)
                    Spacer()
                }
                Divider()
                VStack{
                    HStack{
                        HStack{
                            Text("Order Status")
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .padding(.trailing, 150.0)
                                .padding(.top, -29)
                        }
                        .padding(.top)
                        HStack{
                            Text(convertSecondsToTime(timeInSeconds : timeRemaining))
                                .padding()
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .onReceive(timer) {
                                    _ in
                                    timeRemaining -= 1
                                }
                            
                            
                        }
                        .padding(.top, -20)
                    } //.padding(.top, -120.0)
                
                    Text("You only can cancel announcement when no one  joined yet")
                        .font(.system(size:12))
                        .fontWeight(.semibold)
                        .padding(.leading, -10.0)
                        
                       
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
                        
                        
                    }
                    
                    
//                    .navigationBarBackButtonHidden(true)
                    
                .padding(.trailing, -170.0)
                   .padding(.top, -70.0)
                   
                        Divider()
                   
                    Text(status == "waiting" ? "Waiting for others to join :" : "Completed")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .padding(.leading, -130.0)
                        .padding(.top, 10.0)
                    
                    
                    
                    
                }
                .padding(.top, 10.0)
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
            .padding(.bottom, 400.0)
            .onAppear{
                WebAPI.getMyActiveOrder { res in
                    switch res {
                    case .success(let success):
                        self.merN = success.merchant_name
                        self.appN = success.app_name
                        self.delFe = String(success.delivery_fee)
                        self.cheP = success.checkpoint
                        self.status = success.status ?? "waiting"
                        print("waiting works!")
                    case .failure(let failure):
                        print("couldn't get my active order", failure)
                    }
                }
                WebAPI.getstcpayments { res in
                    switch res {
                    case .success(let success):
                        self.payMS = success.phone ?? ""
                    case .failure(let failure):
                        print("couldn't get stc info", failure)
                    }
                }
                WebAPI.getbankpayments { res in
                    switch res {
                    case .success(let success):
                        self.payMB = success.bname
                    case .failure(let failure):
                        print("couldn't get bank info", failure)
                    }
                }
            }
        }
//        .navigationBarBackButtonHidden(true)
    }
}

struct Waiting1_Previews: PreviewProvider {
    static var previews: some View {
        Waiting1()
    }
}
