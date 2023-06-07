//
//  Splash.swift
//  SplititF1
//
//  Created by Abeer on 27/10/1444 AH.
//

import SwiftUI

struct Splash: View {
    static let Mycolor = Color("Mycolor")
    @State var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @AppStorage("isUserOnboarded") var isUserOnboarded: Bool = false
    @AppStorage("showMap") var showMap: Bool = false
    @AppStorage("showTabBar") var showTabBar: Bool = false
    var body: some View {
        ZStack{
            Text("one Shahad")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .foregroundColor(Splash.Mycolor)
                    .font(.system(size: 100))
                    .background(Splash.Mycolor)
            if isActive {
                if !isUserOnboarded {
                    Onboarding()
                } else {
                    if showMap {
//                        TabBar()
                        ContentView2()
                    } else {
                        TabBar()
                    }
                }
                
            }
            else{
                VStack {
                    VStack {
                        Image("Group")
                            .font(.system(size: 80))
                            .foregroundColor(.blue)
                        
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.00
                        }
                    }
                    
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
            
            
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
