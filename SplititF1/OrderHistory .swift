//
//  OrderHistory .swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 19/05/2023.
//

import SwiftUI

struct OrderHistory: View {
    var body: some View {
            VStack(alignment: .leading) {
                        Text("My Orders")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .frame(maxWidth: .infinity, alignment: .center)
                        Divider()
                VStack{
                    HStack {
                        VStack(alignment: .leading, spacing: 4.0) {
                            
                            Text("McDonald's")
                                .font(.system(size: 18, weight: .semibold, design: .default))
                            
                            Text("13/04/2023")
                                .font(.system(size:12, weight: .regular, design: .default))
                            
                            Text("Active Order")
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .foregroundColor(Color("ourgreen"))
                            
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Button action here
                        }) {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                .font(.title)
                        }
                    }
                    
                    Divider()
                }
                VStack{
                    HStack {
                        VStack {
                            Text("McDonald's")
                                .font(.system(size: 18, weight: .semibold, design: .default))
                            
                            Text("13/04/2023")
                                .font(.system(size:12, weight: .regular, design: .default))
                            
                            Text("Inactive Order")
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .foregroundColor(Color.black.opacity(0.5))
                            
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Button action here
                        }) {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                .font(.title)
                        }
                    }
                    
                    Divider()
                }
                Spacer()
                    }
                    .padding()
                }
            }

struct OrderHistory__Previews: PreviewProvider {
    static var previews: some View {
        OrderHistory()
    }
}
