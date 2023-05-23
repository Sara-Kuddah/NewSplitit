//
//  Form.swift
//  SplititF1
//
//  Created by Abeer on 20/10/1444 AH.
//

import SwiftUI

struct Form: View {
    @State var appN: String = ""
    @State var restaurantN: String = ""
    @State var DeliveryF: String = ""
    @State var Notes: String = ""
    @State var checkP: String = ""
    @State var note: String = ""
    @State var firstMarked = false
    //   @State var secondMarked = true
    @State var thirdMarked = false
    
    var body: some View {
        NavigationView {
            VStack //(alignment: .leading)
            {
                VStack{
                    RName()
                  
                }
                
                
                VStack{
                    Text("Restaurant Name")
                        .font(.system(size: 20))
                    // .font(.title)
                        .fontWeight(.semibold)
                        .font(.headline)
                        .padding(.leading, -165.0)
                    TextField("", text: $restaurantN)
                    
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 4)
                    
                        .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                        .padding([.horizontal], 24)
                }
                VStack{
                    Text("Delivery Fee")
                        .font(.system(size: 20))
                    
                        .fontWeight(.semibold)
                        .font(.headline)
                        .padding(.leading, -165.0)
                    TextField("", text: $DeliveryF)
                    
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 4)
                    
                        .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                        .padding([.horizontal], 24)
                }
                VStack{
                    Text("Check Point Fee")
                        .font(.system(size: 20))
                    
                        .fontWeight(.semibold)
                        .font(.headline)
                        .padding(.leading, -165.0)
                    TextField("Where others will find the order ? ", text: $checkP)
                        .font(.system(size: 15))
                    
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 4)
                    
                        .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                        .padding([.horizontal], 24)
                }
//                VStack{
//                    Text("Please choose how people can pay you  ")
//
//                        .font(.system(size: 20))
//                        .fontWeight(.semibold)
//                        .multilineTextAlignment(.leading)
//                        .padding(/*@START_MENU_TOKEN@*/.horizontal/*@END_MENU_TOKEN@*/)
//                    Text("*Based On Your Payment Options in Your profile")
//                        .font(.callout)
//                        .fontWeight(.thin)
//                        .padding(/*@START_MENU_TOKEN@*/.trailing, 35.0/*@END_MENU_TOKEN@*/)
//
//                }
                
//                HStack {
//                    Spacer(minLength: 8)
//                    CheckP()
//                    Spacer(minLength: 8)
//                    CheckT()
//                    Spacer(minLength: 8)
//
//
//                }
//                .padding(.top, -10.0)
//               
                
                VStack {
                    Text("Notes")
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .padding(.leading, -165.0)
                    TextField("", text: $note)
                        .font(.system(size: 15))
                    
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 4)
                    
                        .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                        .padding([.horizontal], 24)
                }
                .padding(.top, 10.0)
                
                VStack{
                    SendButton()
                    
                }
                .padding(.top)
            }
            .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) { // <3>
                        VStack {
                            Text("Create Order").font(.title).fontWeight(.bold)
                            Divider()
                            
                            
                            
                        }
                        .padding(.top)
                    }
                }
        }
    }
    
}


struct Form_Previews: PreviewProvider {
    static var previews: some View {
        Form()
    }
}
