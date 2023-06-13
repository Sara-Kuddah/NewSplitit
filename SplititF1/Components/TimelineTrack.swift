//
//  TimelineTrack.swift
//  Split it
//
//  Created by Dina Alhajj Ibrahim on 15/05/2023.
//

import SwiftUI

struct TimelineTrack: View {
    @State private var activeIndex: Int?
    
    let circleTexts = ["Waiting ", "Group Completed", "Order Sent", "Order Arrived"]
    
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
                                    .frame(width: min(geometry.size.width / 14.4, 14.4), height: min(geometry.size.height / 5, 40))
                                    .foregroundColor(getCircleColor(index: index))
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Text(circleTexts[index])
                                .font(.system(size: 9, weight: .semibold, design: .default))
                                .foregroundColor(.black)
                                .scaledToFit()
                                .minimumScaleFactor(0.01)
                                .lineLimit(1)
                        }
                        .padding(.horizontal, 8)
                        
                        if index != 3 {
                            Rectangle()
                                .frame(width: min(geometry.size.width / 9, 130), height: 1.5)
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
        
        if let activeIndex = activeIndex, index == activeIndex {
            return Color("Mycolor")
        } else {
            return Color.gray
        }
    }
    
    func getLineColor(index: Int) -> Color {
        // Customize line colors based on index or any other condition
        if let activeIndex = activeIndex, index < activeIndex {
            return Color("Mycolor")
        } else {
            return Color.gray
        }
    }
    
    
    struct TimelineTrack_Previews: PreviewProvider {
        static var previews: some View {
            TimelineTrack()
        }
    }
}
