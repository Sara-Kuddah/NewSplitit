//
//  ContentView2.swift
//  SplititF1
//
//  Created by Dina Alhajj Ibrahim on 03/06/2023.
//

import SwiftUI

struct ContentView2: View {
    @StateObject var locationDataManager = LocationDataManager()
    var body: some View {
        VStack {
            switch locationDataManager.locationManager.authorizationStatus {
            case .authorizedWhenInUse:  // Location services are available.
                // Insert code here of what should happen when Location services are authorized
                Text("Your current location is:")
                
                let longitude = locationDataManager.locationManager.location?.coordinate.longitude ?? 0.0
                let latitude = locationDataManager.locationManager.location?.coordinate.latitude ?? 0.0
                
                
                Text("Latitude: \(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error loading")")
                
                Text("Longitude: \(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error loading")")
                    .onAppear{

                        WebAPI.postLocation(discription: "Alaa",
                                            long: longitude ,
                                            lat: latitude ,
                                            completion: { result in
                            switch result {
                            case .success(_):
//                                self.showLocation(location: location)
                                print("failure cause I'm a failure sorry22")
                            case .failure(_):
                                print("I might be success")
                                }})
                    }
            case .restricted, .denied:  // Location services currently unavailable.
                // Insert code here of what should happen when Location services are NOT authorized
                Text("Current location data was restricted or denied.")
            case .notDetermined:        // Authorization not determined yet.
                Text("Finding your location...")
                ProgressView()
            default:
                ProgressView()
            }
        }
    }
    
    
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}


