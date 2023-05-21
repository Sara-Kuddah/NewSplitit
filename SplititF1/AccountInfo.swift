//
//  AccountInfo.swift
//  SplititF1
//
//  Created by Abeer on 27/10/1444 AH.
//

import SwiftUI

struct AccountInfo: View {
    @State var PhoneN: String = ""
    @State var BankN: String = ""
    @State var IBAN: String = ""
    @State var STCp: String = ""
    @State var checkP: String = ""
    @State var note: String = ""
    @State var firstMarked = false
   
    @State var thirdMarked = false
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                Text("Complete Your account informations")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .padding(.leading, 0.0)
                    
                    //.padding(.trailing, 85.0)
                    
                Text("Those Informations will be provided for user’s in shared order, to contact you and pay you ")
                    .fontWeight(.regular)
                    .foregroundColor(Color.gray)
                    .padding(.top, 1.0)
                   // .padding(.trailing)
                   // .padding(.leading, 10.0)
                
                VStack{
                    Text("Phone Number")
                        .fontWeight(.semibold)
                        .padding(.leading, -185.0)
                    TextField("What App Are You Ordering From?", text: $PhoneN)
                        .font(.system(size: 15))
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 20)
                        .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                        .padding([.horizontal], 24)
                }
                .padding(.top, -1.0)
                
                

                VStack{
                    Text("Add How you want others to pay you")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    //.padding(.leading, -40.0)
                    
                }
                VStack{
                    Text("Bank Name")
                       
                    
                        .fontWeight(.semibold)
                        .padding(.leading, -165.0)
                    TextField("Bank name", text: $BankN)
                        .font(.system(size: 15))
                    
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 4)
                    
                        .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                        .padding([.horizontal], 24)
                }
                
                VStack{
                    Text("IBAN")
                        
                    
                        .fontWeight(.semibold)
                        .padding(.leading, -165.0)
                    TextField("Enter your IBAN", text: $IBAN)
                        .font(.system(size: 15))
                    
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 4)
                    
                        .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                        .padding([.horizontal], 24)
                }
                VStack{
                    HStack{
                        Text("STC PAY ")
                            
                        Text("(Optional)")
                            .fontWeight(.regular)
                            .foregroundColor(Color.gray)
                    }
                        .fontWeight(.semibold)
                        .padding(.leading, -165.0)
                    TextField("Enter your number", text: $STCp)
                        .font(.system(size: 15))
                    
                        .frame(height: 50)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.horizontal, 4)
                    
                        .overlay(RoundedRectangle(cornerRadius: 11).stroke(Color.orange))
                        .padding([.horizontal], 24)
                }
                Button {

                } label: {
                    Text("Save")
                        .bold()
                        .foregroundColor(.black)
                        .frame(width: 350, height: 350)
                        .frame(height: 50)
                        .background(.orange)
                        .cornerRadius(10)
                        
                }
                
                
                
                
                
                
            }
            
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) { // <3>
                        HStack{
                            VStack {
                                Text("Account Info").font(.title).fontWeight(.bold)
                                
                                Divider()
                                
                                
                                
                            }
                            .padding(.top)
                            
                            Text("Skip")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
            
        }
        .padding(.bottom, 110.0)
    }
}
struct AccountInfo_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfo()
    }
}
