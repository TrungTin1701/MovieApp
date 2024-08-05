//
//  StatusUI.swift
//  AppNhaLam
//
//  Created by Tin/Perry/ServiceDev on 24/7/24.
//

import SwiftUI

struct StatusUI: View {
    
    enum Status {
         case available
         case reserved
         case selected
    }
    
    var status: Status = .available
    
    var title: String {
        switch status {
        case .available:
            return "Available"
        case .reserved:
            return "Reserved"
        case .selected:
            return "Selected"
        }
    }
    
    var color: Color {
        switch status {
        case .available:
            return .gray
        case .reserved:
            return Color("majenta")
        case .selected:
            return Color("cyan")
        }
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .frame(width: 10, height: 10)
                    .foregroundColor(color)
                
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    StatusUI()
}
