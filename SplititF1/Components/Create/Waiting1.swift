//
//  Waiting1.swift
//  SplititF1
//
//  Created by Abeer on 23/10/1444 AH.
//

import SwiftUI

struct Waiting1: View {
    // add presentation mode
    // delivery fee updates? calculattions
    @State var timeRemaining = 900
    
    let timer = Timer.publish(every:1, on: .main,
                              in:
            .common)
        .autoconnect ()
    
    func convertSecondsToTime(timeInSeconds : Int) ->
    String {
        
        let minutes = timeInSeconds / 60
        
        let seconds = timeInSeconds % 60
        
        return String(format: "%02i:%02i" , minutes,
                      seconds)
    }

    @State var appN = String()
    @State var merN = String()
    @State var delFe = String()
    @State var payMS = String()
    @State var payMB = String()
    @State var cheP = String()
    @State var status = String()
    @State var orderID : UUID
    @State var items: [Item] = []
    @State var allItems: [allItem] = []
    @State var userID = UUID()
    @State var firstName = ""
    @State var phone = ""
    @State var itemViews: [itemView] = []
    @State var item_name = ""
    @State var price = ""
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 8) {
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination:  TabBar()) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color("Color1"))
                                .padding(.leading)
                        }
                    }
                    Spacer()
                    VStack(alignment: .center, spacing: 2) {
                        Text(!merN.isEmpty ? "\(merN)" : "Resturant Name")
                            .font(.system(size: 25, weight: .bold, design: .default))
                        HStack {
                            Text(!delFe.isEmpty ? "\(delFe)SR" : "Riyal")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                            
                            Text(!appN.isEmpty ? "\(appN)" : "App Name")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                            
                            Text(!payMB.isEmpty ? "\(payMB)" : "Bank Name")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                            
                            Text(payMS.isEmpty ? "" : "STC Pay")

                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                            Text(!cheP.isEmpty ? "\(cheP)" : "Checkpoint")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.trailing)
                    Spacer()
                }
                Divider()
                VStack{
                    HStack{
                        HStack{
                            Text("Order Status")
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .padding(.trailing, 150.0)
                                .padding(.top, -29)
                        }
                        .padding(.top)
                        HStack{
                            Text(convertSecondsToTime(timeInSeconds : timeRemaining))
                                .padding()
                                .font(.system(size:20))
                                .fontWeight(.bold)
                                .onReceive(timer) {
                                    _ in
                                    timeRemaining -= 1
                                }
                        }
                        .padding(.top, -20)
                    }
                    
                    Text("You only can cancel announcement when no one  joined yet")
                        .font(.system(size:12))
                        .fontWeight(.semibold)
                        .padding(.leading, -10.0)
                    VStack{
                        TimelineTrack()
                            .padding(.top, 10.0)
                    }
                    HStack {
                        // add button to change status
                        Button {
                            // update -- change to get joined?
                            WebAPI.getAllItemsInOrder(orderID: orderID) { res in
                                print("order id in items", orderID)
                                print("items in items", items)
                                switch res {
                                case .success(let success):
                                    print("success get items", success.self)
                                    self.items = success
                                    print("iiii",items)
                                    print("order id in view",orderID)
                                case .failure(let failure):
                                    print("fail in items", failure.localizedDescription)
                                }
                            }
                        } label: {
                            Text("update")
                                .padding(.all)
                                .bold()
                                .foregroundColor(.black)
                                .frame(width: 200)
                                .frame(height: 50)
                                .background(Color("Mycolor"))
                                .cornerRadius(10)
                        }

                        // change to button - add dismiss
                        NavigationLink(destination: TabBar()) {
                            Text("Cancel")
                                .padding(.all)
                                .bold()
                                .foregroundColor(.black)
                                .frame(width: 200)
                                .frame(height: 50)
                                .background(Color("Mycolor"))
                                .cornerRadius(10)
                            
                        }
                    }
//                    OrderView(items: $items, allItems: $allItems)
                    OrderView(items: $items, firstName: firstName, phone: phone, allItems: $allItems)
                    .padding(.top, 10.0)
                }

            }
            .padding(.bottom, 400.0)
            .onAppear{
                print("on appear",userID)
                WebAPI.getstcpayments { res in
                    switch res {
                    case .success(let success):
                        self.payMS = success.phone ?? ""
                    case .failure(let failure):
                        print("couldn't get stc info", failure)
                    }
                }
                WebAPI.getbankpayments { res in
                    switch res {
                    case .success(let success):
                        self.payMB = success.bname
                    case .failure(let failure):
                        print("couldn't get bank info", failure)
                    }
                }
                WebAPI.getMyActiveOrder3 { res in
                    switch res {
                    case .success(let success):
                        self.merN = success.order.merchant_name
                        self.appN = success.order.app_name
                        self.delFe = String(success.order.delivery_fee)
                        self.cheP = success.order.checkpoint
                        self.status = success.order.status ?? "waiting"
                        self.orderID = success.order.id
//                        print("get my function",orderID)
                    case .failure(let failure):
                        print("couldn't get my active order", failure)
                    }
                }
                // get joined users ?? do we have anything for it?
                // get joined items
                WebAPI.getAllItemsInOrder(orderID: orderID) { res in
//                    print("order id in items", orderID)
//                    print("items in items", items)
                    switch res {
                    case .success(let success):
//                        print("success get items", success.self)
                        self.items = success
                        print("oold items", success)
//                        print("iiii",items)
//                        print("order id in view",orderID)
                    case .failure(let failure):
                        print("fail in items", failure.localizedDescription)
                    }
                }
                WebAPI.getAllItemsWithJoined(orderID: orderID) { res in
                    switch res {
                    case .success(let success):
                        self.allItems = success
                        print("all",success)
                        for i in success {
                            self.userID = i.joined_user.id
                            
//                            print("user in loop",userID)
       print("self.itemViews :==========" , self.itemViews)
                            print("i : ======" , i)
                            print("success ")
                            WebAPI.getUserByID(userID: i.joined_user.id) { res in
                                print("user in another function", userID)
                                switch res {
                                case .success(let success):
        //                        print("success get items", success.self)
                                    self.firstName = success.firstName ?? ""
                                    print("first try 2", success.firstName ?? "")
                                    print("ss",success)
                                    print(i.joined_user.id, success.firstName, success.phone)
                                    // add it to item view??
//                                    itemViews += [success.firstName, success.phone, [allItems]]
                                    //                        print("iiii",items)
                                    //                        print("order id in view",orderID)
//    =====
//                                    itemViews = [(success.firstName, success.phone,(item_name, price))]
                                case .failure(let failure):
                                    print("fail in items12", failure.localizedDescription)
                                }
                            }
                        }
                                            case .failure(let failure):
                                                print("all items",failure)
                                            }
                    }
            }
        }
//        .navigationBarBackButtonHidden(true)
    }
}

//struct Waiting1_Previews: PreviewProvider {
//    static var previews: some View {
//        Waiting1()
//    }
//}

struct itemView: Codable {
    let firstName: String?
    let phone: String?
    let item: [allItem]
}
