//
//  test1.swift
//  SplititF1
//
//  Created by Dina Alhajj Ibrahim on 21/05/2023.
//

import SwiftUI

struct test1: View {
    var body: some View {
            NavigationView {
             
                    // Arrow button
                    NavigationLink(destination:   MyAccountP()) {
                       
                            Image(systemName: "chevron.right")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                .font(.title)
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
                
            }
        
    

struct test1_Previews: PreviewProvider {
    static var previews: some View {
        test1()
    }
}
