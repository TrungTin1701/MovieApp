//
//  BookingView.swift
//  AppNhaLam
//
//  Created by Tin/Perry/ServiceDev on 23/7/24.
//

import SwiftUI

struct BookingView: View {
    @State var gradient = [Color("backgroundColor2").opacity(0), Color("backgroundColor2"), Color("backgroundColor2")]
    
    @State var selectedDate = false
    @State var bindingSelection = false
    @State var selectedHour = false
    var body: some View {
        NavigationView {
            ZStack {
                Image("booking")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: .infinity, alignment: .top)
                
                VStack(spacing: 0.0) {
                    LinearGradient(colors: gradient, startPoint: .top, endPoint: .bottom)
                        .frame(height: 600)
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                VStack(spacing: 0.0){
                    HStack {
                        CircleButton (image: "arrow.left") {}
                        
                        Spacer()
                        
                        CircleButton(image: "ellipsis") {}
                    }
                    .padding(EdgeInsets(top: 46, leading: 20, bottom: 0, trailing: 20))
                    
                    Text("Doctor Strange")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 200)
                    
                    Text("in the Multiverse of Madness")
                        .font(.title3)
                        .foregroundColor(.white)
                    
                    Text("Dr. Stephen Strange casts a forbidden spell that opens the dooraway to the multiverse, including alternate versions of... ")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .padding(30)
                    
                    Text("Selected date and time")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                    
                    HStack(alignment: .top, spacing: 20) {
                        DateButton(weekDay: "Mon", numDay: 22, isSelected: $bindingSelection )
                            .padding(.top, 90)
                        
                        DateButton(weekDay: "Tue", numDay: 23, isSelected: $bindingSelection)
                            .padding(.top, 70)
                        
                        DateButton(weekDay: "Wed", numDay: 24,width: 70, height: 100, isSelected: $selectedDate, action: {
                            withAnimation(.spring()) {
                                selectedDate.toggle()
                            }
                        })
                        .padding(.top, 30)
                        
                        DateButton(weekDay: "Thu", numDay: 25, isSelected: $bindingSelection )
                            .padding(.top, 70)
                        
                        DateButton(weekDay: "Fri", numDay: 26, isSelected: $bindingSelection )
                            .padding(.top, 90)
                    }
                    .padding()
                    
                    HStack(alignment: .top,spacing: 20) {
                        TimeButton(hour: "16:10", isSelected: $bindingSelection)
                            .padding(.top, 20)
                        
                        TimeButton(hour: "16:10",isSelected: $bindingSelection)
                            .padding(.top, 10)
                        
                        TimeButton(hour: "16:10",width: 70, height: 40, isSelected: $selectedHour) {
                            withAnimation(.spring()) {
                                selectedHour.toggle()
                            }
                        }
                        .padding(.top, -20)
                        
                        TimeButton(hour: "16:10", isSelected: $bindingSelection)
                            .padding(.top, 10)
                        TimeButton(hour: "16:10", isSelected: $bindingSelection)
                            .padding(.top, 20)
                    }
                    
                    NavigationLink {
                        Text("Booking Seat")
                    } label: {
                        LargeButton(title: "Booking Seat") {
                            
                        }
                        .padding(.top, 10)
                        .offset(y: selectedDate && selectedHour ? 0 : 200)
                        .disabled((selectedDate && selectedHour))
                    }

                    
                }
                .frame(maxHeight: .infinity, alignment: .top)
                
            }
            .background(Color("backgroundColor2"))
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    BookingView()
}
