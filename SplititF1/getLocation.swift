//
//  getLocation.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 06/06/2023.
//

import SwiftUI


struct getLocation : View {
    
    
    @StateObject var locationDataManager = LocationDataManager()
    var body: some View{
        VStack {
            
        }
    }
    func getLocationCoordinates() {
//        let latitude = locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error loading"
//        let longitude = locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error loading"
        
        switch locationDataManager.locationManager.authorizationStatus {
        case .authorizedWhenInUse:  // Location services are available.
            // Insert code here of what should happen when Location services are authorized
            
            
            guard let latitude = locationDataManager.locationManager.location?.coordinate.latitude
            else {
                print("wrong lat")
                return
            }
            guard let longitude = locationDataManager.locationManager.location?.coordinate.longitude
            else {
                print("wrong long")
                return
            }
//            WebAPI.postLocation(description: "Alaa",
//                                long: longitude,
//                                lat: latitude,
//                                completion: { result in
//                switch result {
//                case .success(let success):
//                    print("success") // get location
//                case .failure(let failure):
//                    print("failure cause I'm a failure sorry")
//                }
//            }
//            )
//            Text("Latitude: \(locationDataManager.locationManager.location?.coordinate.latitude.description ?? "Error loading")")
            
//            Text("Longitude: \(locationDataManager.locationManager.location?.coordinate.longitude.description ?? "Error loading")")
            
        case .restricted, .denied:  // Location services currently unavailable.
            // Insert code here of what should happen when Location services are NOT authorized
            print("Current location data was restricted or denied.")
        case .notDetermined:        // Authorization not determined yet.
            print("Finding your location...")
//            ProgressView()
        default:
//            ProgressView()
            break
        }
    }
}
