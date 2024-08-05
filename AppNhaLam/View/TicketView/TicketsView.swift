//
//  Tickets.swift
//  AppNhaLam
//
//  Created by TrungTin on 2/15/23.
//

import SwiftUI

struct TicketsView: View {
    @EnvironmentObject private var ticketsVM: TicketViewModel
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            ForEach(ticketsVM.tickets) { ticket in
                InfiniteStackView(tickets: bindingForTickets, ticket: ticket)
            }
        }
        .frame(width: .infinity, height: .infinity, alignment: .center)
    }
    
    private var bindingForTickets: Binding<[Ticket]> {
        $ticketsVM.tickets
    }
}

struct Tickets_Previews: PreviewProvider {
    static var previews: some View {
        TicketsView()
            .environmentObject(TicketViewModel())
    }
        
}

struct InfiniteStackView : View {
   	
    
    @Binding var tickets  : [Ticket]
    var ticket : Ticket
    @GestureState var isDragging  : Bool = false
    @State var offset : CGFloat = .zero
    
    @State var height : CGFloat = 0
    var body: some View{
        VStack{
            TicketDetail(ticket: ticket,height:$height)
        }
        .frame(width: .infinity, height: .infinity, alignment: .center)
        .zIndex(getIndex() == 0  && offset  > 100 ? Double(CGFloat(tickets.count)-getIndex()) - 1 : Double(CGFloat(tickets.count)-getIndex()) )
        .rotationEffect(.init(degrees: getRotation(angle: 10)))
        .rotationEffect(getIndex() == 1 ?  .degrees(-6):.degrees(0))
        .rotationEffect(getIndex() == 2 ?  .degrees(6) : .degrees(0))
        .scaleEffect(getIndex() == 0 ?  1  :  0.9)
        .offset(x : getIndex() == 1 ? -40 : 0)
        .offset(x : getIndex() == 2 ? 40 : 0)
        .offset(x:offset)
        .gesture(
        DragGesture()
            .updating($isDragging, body: {_,out , _ in
                out  = true
            })
            .onChanged({
                value in var translation  = value.translation.width
                translation = tickets.first?.id  == ticket.id ? translation : 0
                translation  = isDragging ? translation: 0
                withAnimation (.easeInOut(duration: 0.37)){
                    offset = translation
                    height = -offset / 5
                }
            })
            .onEnded({
                value in
                let width = UIScreen.main.bounds.width
                let swipeRight = offset > (width / 2)
                let swipeLeft = -offset > (width / 2)
                
                withAnimation (.easeInOut(duration: 0.5)){
                    if swipeLeft {
                        offset =  -width
                        removeTicket()
                    }else {
                        if swipeRight {
                            offset = width
                            removeAndAdd()
                        } else {
                            offset = .zero
                        }
                    }
                }
            })
    )
    }
    func getIndex() -> CGFloat{
        let index = tickets.firstIndex { ticket in
            return self.ticket.id == ticket.id
        } ?? 0
        return CGFloat(index)
    }
    func getRotation(angle :Double )->Double{
        let width  = UIScreen.main.bounds.width
        let progress =  offset / width
        return Double(progress * angle)
        
    }
    func removeAndAdd(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            var updateTicket = ticket
            updateTicket.id = UUID().uuidString
            
            tickets.append(updateTicket)
            withAnimation(.spring()) {
                tickets.removeFirst()
            }
            
        }
    }
    func removeTicket(){
        withAnimation(.spring()) {
            tickets.removeFirst()
        }
    }
    }
   


