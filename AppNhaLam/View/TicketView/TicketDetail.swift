//
//  TicketDetail.swift
//  AppNhaLam
//
//  Created by TrungTin on 12/10/22.
//

import SwiftUI

struct TicketDetail: View {
    @State  var ticket : Ticket
    @Binding var height : CGFloat
    var gradient = [Color("cyan"),Color("cyan").opacity(0),Color("cyan").opacity(0)]
    var body: some View {
        VStack( spacing: 0.0){
            VStack(spacing:4.0){
                Text (ticket.title)
                    .fontWeight(.bold)
                Text(ticket.subtitle)
            }
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 0, trailing: 30))
            .frame(width: 250, height: 325, alignment: .top)
            .foregroundColor(.white)
            .background(
                Image(ticket.top)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
            )
            .mask {
                Image(ticket.bottom)
                    .resizable()
                    .aspectRatio( contentMode: .fill)
            }
            .overlay{
                RoundedRectangle(cornerRadius: 40)
                    .stroke(LinearGradient(colors: gradient, startPoint: .topLeading, endPoint: .bottomTrailing),style: StrokeStyle(lineWidth:2))
            }
            .cornerRadius(40,corners: [.topLeft,.topRight])
            
            Spacer(minLength: height)
            detailDatetime
            
            
        }
        .frame( height: 460)
        .font(.footnote)
        .shadow(radius: 10)
        
    }
    
}
extension TicketDetail{
    private var detailDatetime: some View {
        VStack(spacing: 10.0){
            Line()
                .stroke(style: StrokeStyle(lineWidth:2,dash: [7]))
                .frame(width: 200, height: 1)
                .opacity(0.6)
            
            HStack(spacing: 20.0){
                HStack(spacing: 4.0){
                    Text("Date ")
                        .fontWeight(.medium)
                        .foregroundColor(Color("lightPurple"))
                    Text("May 20")
                        .foregroundColor(.black)
                }
                HStack(spacing: 4.0){
                    Text("Time : ")
                        .fontWeight(.medium)
                        .foregroundColor(Color("lightPurple"))
                    Text("6.17 p.m ")
                        .foregroundColor(.black)
                }
            }
            seatNumber
            Image("code")
            
        }
        .frame(width: 250, height: 135)
        .background(.ultraThinMaterial)
        .background(
            Image(ticket.bottom)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .mask {
            Image(ticket.bottom)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
    }
// VIew of Seat
    private var seatNumber : some View{
        HStack(spacing: 20.0){
            HStack(spacing: 4.0){
                Text("Row : ")
                    .fontWeight(.medium)
                    .foregroundColor(Color("lightPurple"))
                Text("D")
                    .foregroundColor(.black)
            }
            HStack(spacing: 4.0){
                Text("Seat: ")
                    .fontWeight(.medium)
                    .foregroundColor(Color("lightPurple"))
                Text("6 , 7")
                    .foregroundColor(.black)
            }
        }
    }
    
}

struct TicketDetail_Previews: PreviewProvider {
    static var previews: some View {
        TicketDetail(ticket: Ticket(image: "Thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom"),height: .constant(0))
    }
    
}

