//
//  SeatsView.swift
//  AppNhaLam
//
//  Created by Tin/Perry/ServiceDev on 24/7/24.
//

import SwiftUI

struct SeatsView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var animate: Bool = false
    @State var showButton: Bool = false
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack {
                CircleButton(image: "arrow.left") {
                    dismiss()
                }
                
                Spacer()
                
                Text("Choose Seats")
                    .fontWeight(.bold)
                    .font(.title3)
                    .foregroundStyle(.white)
                
                Spacer()
                
                CircleButton(image: "calendar") {
                }
            }
            .padding(.top, 66)
            .padding(.horizontal, 20)
            
            Image("frontSeat")
                .padding(.top, 55)
                .glow(color: Color("pink"), radius: 20)
            
            Image("seats")
                .frame(height: 240)
                .padding(.top, 60)
                .padding(.horizontal, 20)
                .onTapGesture {
                    withAnimation(.spring()) {
                        showButton = true
                    }
                }
            
            HStack(spacing: 20) {
                StatusUI()
                StatusUI(status: .reserved)
                StatusUI(status: .selected)
            }
            .padding(.top, 60)
            
            ZStack(alignment: .topLeading){
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color("purple"))
                    .blur(radius: animate ? 70: 100)
                    .offset(x: animate ? -100 : 20, y: animate ? -20 : 20)
                    .task {
                        withAnimation(.easeInOut(duration: 7).repeatForever()) {
                            animate.toggle()
                        }
                    }
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("lightBlue"))
                    .blur(radius: animate ? 50: 100)
                    .offset(x: animate ? 50 : 70, y: animate ? 70 : 30)
                
                Circle()
                    .frame(width: 200, height: 230)
                    .foregroundColor(Color("pink"))
                    .blur(radius: animate ? 70: 100)
                    .offset(x: animate ? 150 : 170, y: animate ? 90 : 100)
                
                VStack(alignment: .leading, spacing: 30.0) {
                    HStack(spacing: 10.0) {
                        Image(systemName: "calendar")
                        Text("16 Oct 2024")
                        Circle()
                            .frame(width: 6, height: 6)
                        Text("7 p m")
                    }
                    
                    HStack(spacing: 10.0) {
                        Image(systemName: "ticket.fill")
                        Text("VIP Section")
                        Circle()
                            .frame(width: 6, height: 6)
                        Text("Seat 9, 10")
                    }
                    
                    HStack(spacing: 10.0) {
                        Image(systemName: "cart.fill")
                        Text("Total: $30")
                    }
                }
                .padding(42)
                .font(.subheadline)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .clipped()
            .foregroundColor(.white)
            .background(.ultraThinMaterial)
            .padding(.top, 50)
            .offset(y: showButton ? 0 : 250)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("backgroundColor"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SeatsView()
}
