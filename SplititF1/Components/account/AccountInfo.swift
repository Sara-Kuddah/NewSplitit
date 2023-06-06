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
    @State private var showTabBar = false
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading) {
                    Spacer()
                    VStack{
                        Text("Complete Your account informations")
                            .font(.system(size:20))
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                        
                    }
                    VStack{
                        Text("Those Informations will be provided for user’s in shared order, to contact you and pay you ")
                            .fontWeight(.regular)
                            .font(.system(size: 12))
                            .foregroundColor(Color.gray)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom)
                    }
                    VStack(alignment: .leading){
                        Text("Phone Number")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                        TextField("What App Are You Ordering From?", text: $PhoneN)
                            .padding(.horizontal)
                            .font(.system(size: 15))
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                        CheckP()
                    }
                    
                    VStack(alignment: .leading){
                        Text("Add How you want others to pay you")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                            .padding(.bottom)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Bank Name")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                        TextField("Bank name", text: $BankN)
                            .padding(.horizontal)
                            .font(.system(size: 15))
                        
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                            .padding(.bottom)
                    }
                    VStack(alignment: .leading){
                        Text("IBAN")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                        TextField("Enter your IBAN", text: $IBAN)
                            .padding(.horizontal)
                            .font(.system(size: 15))
                        
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                        
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                            .padding(.bottom)
                    }
                    VStack(alignment: .leading) {
                        Text("Account Number")
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                        TextField("Enter your Account Number", text: $AccountN)
                            .padding(.horizontal)
                            .font(.system(size: 15))
                        
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                            .padding(.bottom)
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
                            Text("STC PAY ")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                            Text("(Optional)")
                                .font(.system(size: 15))
                                .fontWeight(.semibold)
                            
                                .foregroundColor(Color.gray)
                        }
                        .fontWeight(.medium)
                        TextField("Enter your number", text: $STCp)
                            .padding(.leading)
                            .font(.system(size: 15))
                        
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                        
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Color1"))  )
                    }
                }
                .padding()
                    VStack{
                        
                        LargeButton(title: "Save") {
                            showTabBar = true
                        }
                        .fullScreenCover(isPresented: $showTabBar) {
                            TabBar()
                        }
                            .padding(.top, 20)
                    }
//                }
                
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) { 
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
                                
                            }.navigationBarBackButtonHidden(true)

                        }
                    }
                }
                
            }

        }
    }
}
struct AccountInfo_Previews: PreviewProvider {
    static var previews: some View {
        AccountInfo()
    }
}
