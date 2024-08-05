//
//  LargeButton.swift
//  AppNhaLam
//
//  Created by Tin/Perry/ServiceDev on 24/7/24.
//

import SwiftUI

struct LargeButton: View {
    let gradientButton = [Color("majenta"), Color("lightPurple")]
    var title: String = "Button"
    var action: (()->Void) = {}
    var body: some View {
        Button(action: {
            action()
        }, label: {
            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                .font(.headline)
                .foregroundColor(.white)
        })
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background() {
            LinearGradient(colors: gradientButton, startPoint: .leading, endPoint: .trailing)        }
        .cornerRadius(10)
        .padding(.horizontal, 30)

    }
}

#Preview {
    LargeButton()
}
