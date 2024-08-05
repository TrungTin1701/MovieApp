//
//  TicketViewModel.swift
//  AppNhaLam
//
//  Created by TrungTin on 12/10/22.
//

import Foundation
class TicketViewModel : ObservableObject{
    @Published var tickets  : [Ticket]
    init (){
        self.tickets=[Ticket(image: "Thor", title: "Thor", subtitle: "Love and Thunder", top: "thor-top", bottom: "thor-bottom"),
                      Ticket(image: "panther", title: "Black Panther", subtitle: "Wakanda Forever", top: "panther-top", bottom: "panther-bottom"),
                      Ticket(image: "scarlet", title: "Doctor Strange", subtitle: "in the Multiverse of Madness", top: "scarlet-top", bottom: "scarlet-bottom")
        ]
    }
    
}
