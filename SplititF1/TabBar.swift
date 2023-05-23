//
//  TabBar.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 09/05/2023.
//

import SwiftUI

struct TabBar: View {
    @State private var selection = 0
    
//    init() {
//            let appearance = UITabBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = .blue
//            UITabBar.appearance().scrollEdgeAppearance = appearance
//            UITabBar.appearance().standardAppearance = appearance
//        }
//
    var body: some View {
        TabView(selection: $selection) {
//            NavigationView {
//                // View for the first tab
//                //Text("First Tab")
//
//            }
            
            ContentView()
               
            .tabItem {
                Image(uiImage: UIImage(named: "image2")!)
                   
                Text("Discover")
                
            }
            
            .tag(0)
            
            
            NavigationView {
                // View for the second tab
               // Text("Second Tab")
            }
            OrderHistory_()
            .tabItem {
                Image(uiImage: UIImage(named: "image3")!)
                Text("Order History")
            }
            .tag(1)
            
            NavigationView {
                // View for the third tab
                //Text("Third Tab")
            }
            Profile_()
            .tabItem {
                Image(uiImage: UIImage(named: "image1")!)
                Text("My Account")
            }
            .tag(2)
        }

        .accentColor(Color("Color1"))
        .cornerRadius(30)
        //.padding()
        .ignoresSafeArea()
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
            
            //
               
            
        }
       
    }
  
    
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
