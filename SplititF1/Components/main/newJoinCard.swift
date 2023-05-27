//
//  newJoinCard.swift
//  SplititF1
//
//  Created by Alaa Alabdullah on 26/05/2023.
//

import SwiftUI

struct newJoinCard: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("McDonald's")
                        .font(.system(size: 18, weight: .semibold, design: .default))
                    
                    Spacer()
                    
                    Text("15 minutes")
                        .foregroundColor(Color("ourgreen"))
                        .fontWeight(.semibold)
                        .font(.system(size: 11, weight: .bold, design: .default))
                }
                
                Text("Note: I only have 55 Riyals")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 11, weight: .semibold, design: .default))
                Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        VStack{ //row 1 col 1
                            HStack(spacing: 8) {
                                
                                Image(systemName: "car")
                                    .foregroundColor(Color("Color1"))
                                Text("20 Riyals")
                                    .font(.caption)
                                    .frame(width: 80, height: 30)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(1)
                                Image(systemName: "apps.iphone")
                                    .foregroundColor(Color("Color1"))
                                Text("Hungerstation")
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
                                Text("STC pay, Alrajhi")
                                    .font(.caption)
                                    .frame(width: 90, height: 30)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(1)
                                Image(systemName: "location")
                                    .foregroundColor(Color("Color1"))
                                Text("PNU-A4")
                                    .font(.caption)
                                    .frame(width: 80, height: 30)
                                    .scaledToFit()
                                    .minimumScaleFactor(0.01)
                                    .lineLimit(1)
                            }
                        }
                    }
                    Spacer()
                    VStack{ // col 2
                        JoinButton()
                    }
                }
                .padding()
                
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

struct newJoinCard_Previews: PreviewProvider {
    static var previews: some View {
        newJoinCard()
    }
}
