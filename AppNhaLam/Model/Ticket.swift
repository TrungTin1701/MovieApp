//
//  Ticket.swift
//  AppNhaLam
//
//  Created by TrungTin on 12/10/22.
//

import Foundation
struct Ticket : Identifiable{
    var id  =  UUID().uuidString
    var image :String
    var title :String
    var subtitle :String
    var top :String
    var bottom :String
    
}
