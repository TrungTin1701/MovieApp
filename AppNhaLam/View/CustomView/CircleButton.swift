//
//  CircleButton.swift
//  AppNhaLam
//
//  Created by Tin/Perry/ServiceDev on 23/7/24.
//

import SwiftUI

struct CircleButton: View {
    
    var gradientCircle = [Color("cyan"), Color("cyan").opacity(0.1), Color("cyan")]
    var image: String = "arrow.left"
    var action: (()->Void) = {}
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: image)
                .foregroundColor(.black)
                .background() {
                    Circle()
                        .fill(.ultraThinMaterial)
                        .frame(width: 40, height: 40)
                        .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 10)

                        .overlay(
                            Circle()
                                .trim(from: 0, to: CGFloat(0.5))
                                .stroke(
                                    LinearGradient(colors: gradientCircle, startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: 2)
                                )
                                .rotationEffect(.degrees(135))
                                .frame(width: 38, height: 38)
                            
                        )
                }
        })
    }
}

#Preview {
    CircleButton()
}
