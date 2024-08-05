//
//  ProfileVIew.swift
//  AppNhaLam
//
//  Created by TrungTin on 12/5/22.
//

import SwiftUI

struct ProfileVIew: View {
    let dev : Developer
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading)
            {
               header
            }
            .padding()
            
            .frame(maxWidth : .infinity ,alignment: .center)
           
        }
     
                      
    }
}

struct ProfileVIew_Previews: PreviewProvider {
    static var dev  = Developer ( name: "Trung Tin", jobTitle: "iOS Developer", exp: 0, description: "I wiill be a iOS Dev in furture", image: "")
    static var previews: some View {
        ProfileVIew(dev:  dev)
    }
}
extension ProfileVIew {
    private var header : some View {
        HStack() {
            Image ("ComNgu")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .padding(.leading)
            intro
                
        }
  
        .padding(25)
        .frame(maxWidth : .infinity)
        .foregroundColor(.primary)
        .background(.ultraThickMaterial)
        .cornerRadius(10)
        .shadow(radius: 4)

        
        
    }
    private var intro : some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(dev.name)
                .font(.headline)
                .fontWeight(.semibold)
                
            Text(dev.jobTitle)
                .font(.headline)
                .fontWeight(.semibold)
            Text(dev.description)
                .font(.subheadline)
                
            
        }
    }
}
