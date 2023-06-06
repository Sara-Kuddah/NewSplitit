//
//  TabBar.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 09/05/2023.
//

import SwiftUI

struct TabBar: View {
    @State private var selection = 0
    @ObservedObject var locationDataManager = LocationDataManager()
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                ContentView().tabItem {
                    Image(uiImage: UIImage(named: "image2")!)
                    Text("Discover")
                }.tag(0)
                
                OrderHistory().tabItem {
                    Image(uiImage: UIImage(named: "image3")!)
                    Text("My Orders")
                }.tag(1)
                
                Profile().tabItem {
                    Image(uiImage: UIImage(named: "image1")!)
                    Text("My Account")
                }.tag(2)
            }
            .accentColor(Color("Color1"))
            //        .ignoresSafeArea()
            .onAppear {
                let tabBarAppearance = UITabBarAppearance()
                tabBarAppearance.configureWithDefaultBackground()
                UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
                
            }
           // .navigationBarBackButtonHidden(true)
            
        }
        .onAppear{
            getLocation().getLocationCoordinates()
        }
        .navigationBarBackButtonHidden(true)
       
    }
}
struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

