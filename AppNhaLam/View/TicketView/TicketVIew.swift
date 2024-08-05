//
//  TicketVIew.swift
//  AppNhaLam
//
//  Created by TrungTin on 12/5/22.
//

import SwiftUI

struct TicketVIew: View {
    @State var animate = false
    
    var ticket = Ticket(image: "Thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom")
    var body: some View {
        ZStack{
            
            Circle()
                .fill(Color("greenCircle"))
                .blur(radius: animate ? 50 :100)
                .padding()
                .offset(x:animate ? -50 : -130, y:animate ? -30 : -100)
                .task {
                    withAnimation(.easeInOut(duration: 7).repeatForever()) {
                        animate.toggle()
                    }
                }
            Circle()
                .fill(Color("pinkCircle"))
                .blur(radius: 100)
                .padding()
                .offset(x:animate ? 100 : 130, y:animate ? 150 : 100)
            header
            TicketDetail(ticket: ticket,height: .constant(10))
           
        }
        .background(LinearGradient(colors: [Color("backgroundColor"),Color("backgroundColor2")], startPoint: .top, endPoint: .bottom))
    }
}

struct TicketVIew_Previews: PreviewProvider {
    static var previews: some View {
        TicketVIew()
    }
}
extension TicketVIew {
    private var header : some View 	{
        VStack(spacing: 30){
                
            Text("Booking Ticket ")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
            
            
            
        }
        .padding(.horizontal , 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
    
}
