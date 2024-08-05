//
//  Developer.swift
//  AppNhaLam
//
//  Created by TrungTin on 12/5/22.
//

import Foundation
struct Developer :  Identifiable,Codable{
    var id : String
    var name :String
    var jobTitle :String
    var exp : Int
    var description : String
    var image : String
    init(id : String = UUID().uuidString,name : String , jobTitle :String , exp : Int , description :String      , image : String ){
        
        self.id = id
        self.name = name
        self.jobTitle = jobTitle
        self.exp = exp
        self.description = description
        self.image = image
    }
    }

