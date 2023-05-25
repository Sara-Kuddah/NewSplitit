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
    @State var AccountN: String = ""
    @State var firstMarked = false
    
    @State var thirdMarked = false
    @State private var isPresentedFullScreenCover = false
    var body: some View {
        NavigationView {
            ScrollView{
                VStack{
                    Spacer()
                    VStack{
                        Text("Complete Your account informations")
                            .font(.title3)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .padding(.leading, -27.0)
                            .padding(.top, 20.0)
                    }
                    .padding(.bottom, 1.0)
                    //.padding(.trailing, 85.0)
                    VStack{
                        Text("Those Informations will be provided for user’s in shared order, to contact you and pay you ")
                            .fontWeight(.regular)
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 1.0)
                            .padding(.trailing, -0.5)
                        
                    }
                    VStack{
                        Text("Phone Number")
                            .fontWeight(.semibold)
                            .padding(.leading, -165.0)
                        TextField("What App Are You Ordering From?", text: $PhoneN)
                            .font(.system(size: 15))
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 20)
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                            .padding([.horizontal], 24)
                        
                        CheckP()
                            .padding(.trailing, 100.0)
                            .padding(.vertical, -10.0)
                    }
                    .padding(.top, -1.0)
                    
                    
                    
                    VStack{
                        Text("Add How you want others to pay you")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        //.padding(.leading, -40.0)
                        
                    }
                    .padding(.bottom, 2.0)
                    VStack{
                        Text("Bank Name")
                            .fontWeight(.semibold)
                            .padding(.leading, -165.0)
                        TextField("Bank name", text: $BankN)
                            .font(.system(size: 15))
                        
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 20)
                            .padding(.horizontal, 4)
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
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
                            .padding(.horizontal, 20)
                            .padding(.horizontal, 4)
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                            .padding([.horizontal], 24)
                    }
                    
                VStack {
                        Text("Account Number")
                    
                            .fontWeight(.semibold)
                            .padding(.leading, -165.0)
                        TextField("Enter your Account Number", text: $AccountN)
                            .font(.system(size: 15))
                        
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 20)
                            .padding(.horizontal, 4)
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
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
                            .padding(.horizontal, 20)
                            .padding(.horizontal, 4)
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                            .padding([.horizontal], 24)
                    }
                    
                    
                    VStack{
                        
                        SaveButton()
                            .padding(.top, 20)
                    }
                }
                
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) { // <3>
                        HStack{
                            VStack {
                                Text("Account Info")
                                    .font(.title).fontWeight(.bold)
                                    .padding(.leading, 50.0)
                                Divider()
                                    
                                
                                
                                
                            }
                            .padding(.top)
                            
                            NavigationLink(destination: TabBar()) {
                                Text("Skip")
                                    .foregroundColor(Color.gray)
                                    .padding(.all)
                                
                                
                                
                                //.offset(x:1 ,y:1)
                            }.navigationBarBackButtonHidden(true)
//                            Text("Skip")
//                                .foregroundColor(Color.gray)
                        }
                    }
                }
                
            }
           // .padding(.bottom, 110.0)
        }
    }
}
struct AccountInfo_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfo()
    }
}
