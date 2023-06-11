//
//  AppNamePicker.swift
//  SplititF1
//
//  Created by Abeer on 25/05/2023.
//

import SwiftUI

struct AppNamePicker: View {
    @State public var selection: String
    let id = ["Jahez", "The Chefz", "Hunger Station", "Ninja", "Toyou", "Cari", "Shgardi", "Cofe", "Mr.Mandoob", "Mrsool"]
    
    var body: some View {
        
        VStack (alignment: .leading){
            // Picker
            Text("App Name")
                .font(.system(size: 18))
                .fontWeight(.medium)
            
            Picker("What App Are You Ordering From? ", selection: $selection){
                ForEach(id, id: \.self){
                    Text($0).tag(id)
                }
            } .pickerStyle(.automatic)
                .accentColor(.black)
                .onTapGesture {
                 print("$selection \($selection)")
                                                        }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
                .textFieldStyle(PlainTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))

            
        }
    }
}

struct AppNamePicker_Previews: PreviewProvider {
    static var previews: some View {
        AppNamePicker(selection: "Jahez")
    }
}
