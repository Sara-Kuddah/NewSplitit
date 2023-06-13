//
//  newJoinCard.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 26/05/2023.
//

import SwiftUI

struct newJoinCard: View {
    // published or state or binding
    @State var appN : String
    @State var merN : String
    @State var delFe : Int
    @State var payMS : String
    @State var payMB : String
    @State var cheP :String
    @State var status: String
    @State var notes : String
    
    @State var orderID: UUID
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(merN)
                        .font(.system(size: 18, weight: .semibold, design: .default))
                    
                    Spacer()
                    
                    Text("15 minutes")
                        .foregroundColor(Color("ourgreen"))
                        .fontWeight(.semibold)
                        .font(.system(size: 11, weight: .bold, design: .default))
                }
                
                Text(notes)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 11, weight: .semibold, design: .default))
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        VStack{ //row 1 col 1
                            HStack(spacing: 8) {
                                
                                Image(systemName: "car")
                                    .foregroundColor(Color("Color1"))
                                Text("\(delFe)")
                                    .font(.caption)
                                    .frame(width: 80, height: 30)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(1)
                                Image(systemName: "apps.iphone")
                                    .foregroundColor(Color("Color1"))
                                Text(appN)
                                    .font(.caption)
                                    .frame(width: 80, height: 30)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(1)
                            }
                        }
                        VStack{ // row 2 col 1
                            HStack(spacing: 8) {
                                Image(systemName: "dollarsign")
                                    .foregroundColor(Color("Color1"))
                                Text("STC pay, Alrajhi") // now is just for show
                                    .font(.caption)
                                    .frame(width: 90, height: 30)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(1)
                                Image(systemName: "location")
                                    .foregroundColor(Color("Color1"))
                                Text(cheP)
                                    .font(.caption)
                                    .frame(width: 80, height: 30)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(1)
                            }
                        }
                    }
                    Spacer()
                    VStack{ // col 2 -- 1st bring the whole navigation link here!
                            // 2nd  pass order id
                        NavigationLink(destination: FormForAddingOrder(appN: appN, merN: merN, delFe: delFe, payMS: payMS, payMB: payMB, cheP: cheP, orderID: orderID)) {
                            Text("Join")
                                .font(.system(size: 14, weight: .semibold, design: .default))
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 7)
                                        .foregroundColor(Color("Color1"))
                                        .frame(width:70, height: 33)
                                )
                        }
//                        JoinButton()
                    }
                }
            }
        }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 150)
            .background(Color.white)
            .cornerRadius(14)
            .shadow(color: .black.opacity(0.1), radius: 10)
            .padding([.trailing, .leading])
    }
}

//struct newJoinCard_Previews: PreviewProvider {
//    static var previews: some View {
//        newJoinCard( merN: Binding<String>)
//    }
//}
