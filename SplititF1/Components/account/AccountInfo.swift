//
//  AccountInfo.swift
//  SplititF1
//
//  Created by Abeer on 27/10/1444 AH.
//

import SwiftUI

struct AccountInfo: View {
    @StateObject var locationDataManager = LocationDataManager()
    @State var PhoneN: String = ""
    @State var BankN: String = ""
    @State var IBAN: String = ""
    @State var STCp: String = ""
    @State var AccountN: String = ""
//    @State var firstMarked = false
//
//    @State var thirdMarked = false
    @AppStorage("showTabBar") var showTabBar: Bool = false
    @AppStorage("showForm") var showForm: Bool = false
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
                        TextField("Enter your Phone Number", text: $PhoneN)
                            .padding(.horizontal)
                            .font(.system(size: 15))
                            .frame(height: 50)
                            .textFieldStyle(PlainTextFieldStyle())
                            .overlay( RoundedRectangle(cornerRadius: 11)
                                .stroke(Color("Mycolor"))  )
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
                                .stroke(Color("Mycolor"))  )
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
                                .stroke(Color("Mycolor"))  )
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
                                .stroke(Color("Mycolor"))  )
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
                                .stroke(Color("Mycolor"))  )
                    }
                }
                .padding()
                    VStack{
                        
                        LargeButton(title: "Save") {
                            switch locationDataManager.locationManager.authorizationStatus {
                            case .authorizedWhenInUse:  // Location services are available.
                                // Insert code here of what should happen when Location services are authorized
                                
                                let longitude = locationDataManager.locationManager.location?.coordinate.longitude ?? 0.0
                                let latitude = locationDataManager.locationManager.location?.coordinate.latitude ?? 0.0
                                
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
                                    
                            case .restricted, .denied:  // Location services currently unavailable.
                                // Insert code here of what should happen when Location services are NOT authorized
                               print("restricted")
                                break
                            case .notDetermined:        // Authorization not determined yet.
                                print("not determined")
                               break
                            default:
                                break
                            }
                            
                            if !STCp.isEmpty {
                                WebAPI.postStcPayments(phone: STCp) { result in
                                    switch result {
                                    case .success(let success):
                                        print("posted stc", success)
                                    case .failure(let failure):
                                        print("error stc", failure)
                                    }
                                }
                            }
                            
                            if !BankN.isEmpty && !IBAN.isEmpty {
                                WebAPI.postbankpayments(phone: PhoneN, bname: BankN, iban: IBAN, account: AccountN) { result in
                                    switch result {
                                    case .success(let success):
                                        print("posted bank", success)
                                    case .failure(let failure):
                                        print("error bank", failure)
                                    }
                                }
                            }
                            showForm = false
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
