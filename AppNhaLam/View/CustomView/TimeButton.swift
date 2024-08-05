//
//  TimeButton.swift
//  AppNhaLam
//
//  Created by Tin/Perry/ServiceDev on 24/7/24.
//

import SwiftUI

struct TimeButton: View {
    var gradientCircle = [Color("cyan").opacity(0.8), Color("cyan"), Color("cyan").opacity(0.8  )]
    
    var gradientCircleIsSelected = [Color("majenta"), Color("majenta").opacity(0.1), Color("majenta")]
    
    var hour: String
    var width: CGFloat = 50
    var height: CGFloat = 30
    @Binding var isSelected: Bool
    var action: (()->Void) = {}
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack {
                Text(hour)
                    .font(.subheadline)
                    .foregroundColor(.white)
                }
            .background() {
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? Color("majenta").opacity(0.9): Color("backgroundColor").opacity(0.9))
                    .frame(width: self.width, height: self.height)
                    .shadow(color: .black.opacity(0.25), radius: 20, x: 0, y: 10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .trim(from: CGFloat(0.2), to: CGFloat(0.8))
                            .stroke(
                                LinearGradient(colors: isSelected ? gradientCircleIsSelected : gradientCircle, startPoint: .top, endPoint: .bottom), style: StrokeStyle(lineWidth: isSelected ? 1 : 2)
                            )


                    }
            }
        })
        .frame(width: self.width, height: self.height)
    }
}

#Preview {
    BookingView()
}
