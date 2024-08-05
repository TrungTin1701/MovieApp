//
//  HomeView.swift
//  AppNhaLam
//
//  Created by Tin/Perry/ServiceDev on 23/7/24.
//

import SwiftUI

struct HomeView: View {
    @State var poster: [String] = ["poster1", "poster2", "poster3", "poster4", "poster5", "poster6"]
    @State var poster2: [String] = ["poster7", "poster8", "poster9", "poster10", "poster11", "poster12"]
    @State var poster3: [String] = ["poster13", "poster14", "poster15", "poster16", "poster17", "poster18"]
    
    @State var animate: Bool = false
    
    var body: some View {
        ZStack {
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
                
                VStack(spacing: 0.0) {
                    Text("Choosing Movie")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    CustomSearchBar()
                        .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(spacing: 20.0) {
                            ScrollSection(title: "Now Playing", poster: poster)
                            ScrollSection(title: "Coming Soon", poster: poster2)
                            ScrollSection(title: "Top Movies", poster: poster3)
                            ScrollSection(title: "Favorite", poster: poster)
                        }
                        .padding(.bottom, 90)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
            .background(
                LinearGradient(colors: [Color("backgroundColor"), Color("backgroundColor2")],startPoint: .top, endPoint: .bottom))
        }
}

#Preview {
    HomeView()
}
