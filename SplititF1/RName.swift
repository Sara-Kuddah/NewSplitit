//
//  RName.swift
//  SplititF1
//
//  Created by Abeer on 30/10/1444 AH.
//

import SwiftUI

struct RName: View {
   // @State public var selectedRows = Set<String>()
    // array of selection
    @State public var selection: String = "App Name?"
    let id = ["Jahez", "The Chefz", "The Chefz", "Hunger Station", "Ninja", "Toyou", "Cari", "Shgardi", "Cofe", "Mr.Mandoob", "Mrsool"]
    
    var body: some View {
        
        VStack (alignment: .leading){
            // Picker
            Text("App Name?")
            
                .font(.system(size: 18))
                .fontWeight(.medium)
                .padding(.bottom, 1.0)
            
            Picker("What App Are You Ordering From? ", selection: $selection){
                ForEach(id, id: \.self){
                    Text($0)
                        
                }
            }
            
            .frame(height: 50)
                .frame(width: 350)
                .textFieldStyle(PlainTextFieldStyle())
                .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                .padding(.top, -4.0)
                
        }
        
    }
}

struct RName_Previews: PreviewProvider {
    static var previews: some View {
        RName()
    }
}
