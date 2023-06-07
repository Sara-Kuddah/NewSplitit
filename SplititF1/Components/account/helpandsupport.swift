//
//  helpandsupport.swift
//  SplititF1
//
//  Created by Dina Alhajj Ibrahim on 06/06/2023.
//

import SwiftUI

struct helpandsupport: View {
    var body: some View {
        VStack {
            Text("Contacting us")
                .padding(.leading, -180)
                .font(.system(size: 20, weight: .semibold, design: .default))
                //.padding()
            
            
            Text ("If you have any questions, concerns, or complaints regarding this Policy, the information we hold about you, or if you wish to exercise your rights, we encourage you to contact us using the details below:")
                .padding(.leading, 10)
                .font(.system(size: 19, weight: .regular, design: .default))
            //Spacer()
                .padding()
                 Text("splitit.ksa@gmail.com")
                
           Text ("We will attempt to resolve complaints and disputes and make every reasonable effort to honor your wish to exercise your rights as quickly as possible and in any event, within the timescales provided by applicable data protection laws.This document was last updated on June 4, 2023.")
                .padding(.leading, 10)
                .font(.system(size: 19, weight: .regular, design: .default))
                .padding()
        }
    }
            struct helpandsupport_Previews: PreviewProvider {
                static var previews: some View {
                    helpandsupport()
                }
            }
        }
