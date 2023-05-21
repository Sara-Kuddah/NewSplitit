//
//  ContentView.swift
//  Places
//
//  Created by Mohammad Azam on 7/29/22.
//

import SwiftUI
import MapKit

struct Mapp: View {
    
    @EnvironmentObject var localSearchService: LocalSearchService
    @State private var search: String = ""
    @State var Hint: String = ""
    var body: some View {
        NavigationView {
            
            VStack {
                
                TextField("Search", text: $search)
                    .textFieldStyle(.roundedBorder)
                    .onSubmit {
                        localSearchService.search(query: search)
                    }.padding()
                
                if localSearchService.landmarks.isEmpty {
                    //                Text("Delicious places awaits you!")
                    //                    .padding()
                    //                    .overlay(
                    //                            RoundedRectangle(cornerRadius: 16)
                    //                                .stroke(.gray, lineWidth: 2)
                    //                        )
                } else {
                    LandmarkListView()
                }
                
                Map(coordinateRegion: $localSearchService.region, showsUserLocation: true, annotationItems: localSearchService.landmarks) { landmark in
                    
                    MapAnnotation(coordinate: landmark.coordinate) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(localSearchService.landmark == landmark ? .purple: .red)
                            .scaleEffect(localSearchService.landmark == landmark ? 2: 1)
                    }
                    
                }
                VStack{
                    Text("Location Name")
                        .font(.system(size: 20))
                    // .font(.title)
                        .fontWeight(.semibold)
                        .font(.headline)
                        .padding(.leading, -165.0)
                    TextField("Apt./office/floor", text: $Hint)
                    
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 4)
                    
                        .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                        .padding([.horizontal], 24)
                }
                Button {

                } label: {
                    Text("Confirm Location")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 350, height: 350)
                        .frame(height: 50)
                        .background(.orange)
                        .cornerRadius(10)
                        
                }
                Spacer()
                
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) { // <3>
                            VStack {
                                Text("Pick Location").font(.title).fontWeight(.bold)
                                Divider()
                                
                            }
                        }
                    }
            }
        }
    }
}
struct Mapp_Previews: PreviewProvider {
    static var previews: some View {
        Mapp().environmentObject(LocalSearchService())
    }
}
