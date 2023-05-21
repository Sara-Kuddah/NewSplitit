//
//  TimelineTrack.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 15/05/2023.
//

import SwiftUI

struct TimelineTrack: View {
    @State private var activeIndex: Int?
        
        let circleTexts = ["Waiting", "Group Completed", "Order Sent", "Order Arrived"]
        
        var body: some View {
            VStack {
                Spacer()
                
                GeometryReader { geometry in
                    HStack(spacing: 0) {
                        ForEach(0..<4) { index in
                            VStack {
                                Button(action: {
                                    activeIndex = index
                                }) {
                                    Circle()
                                        .frame(width: min(geometry.size.width / 14.4, 14.4), height: min(geometry.size.width / 10, 30))
                                        .foregroundColor(getCircleColor(index: index))
                                       
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                                Text(circleTexts[index])
                                    .font(.system(size: 9, weight: .semibold, design: .default))
                                    .foregroundColor(.black)
                            }
                            .padding(.horizontal, 8)
                            
                            if index != 3 {
                                Rectangle()
                                    .frame(width: min(geometry.size.width / 5, 30), height: 2)
                                    .foregroundColor(getLineColor(index: index))
                            }
                        }
                    }
                    .padding(.vertical, -18)
                }
                .frame(maxWidth: .infinity)
            }
        }
        
        func getCircleColor(index: Int) -> Color {
            // Customize circle colors based on index or any other condition
            if let activeIndex = activeIndex, index == activeIndex {
                return Color("Color1")
            } else {
                return Color.gray
            }
        }
        
        func getLineColor(index: Int) -> Color {
            // Customize line colors based on index or any other condition
            if let activeIndex = activeIndex, index < activeIndex {
                return Color("Color1")
            } else {
                return Color.gray
            }
        }
    }

struct TimelineTrack_Previews: PreviewProvider {
    static var previews: some View {
        TimelineTrack()
    }
}
