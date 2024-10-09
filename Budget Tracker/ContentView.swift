//
//  ContentView.swift
//  Budget Tracker
//
//  Created by Agung Ardhiyanda on 08/10/24.
//

import SwiftUI

struct ContentView: View {
    @State var dailyBudget = 30000
    @State var remainingBudget = 100000
    var body: some View {
        ZStack{
            Color(.black)
            VStack {
                ZStack{
                    Color("Custom Gray Color").opacity(0.5)
                    VStack{
                        VStack{
                            HStack{
                                Text("Budget Today: ").bold()
                                Text("Rp\(dailyBudget)")
                                Spacer()
                            }.padding([.leading, .top], 30).foregroundColor(.white)
                            Spacer()
                            HStack{
                                Text("A**** K******* Ardhiyanda").bold()
                                Spacer()
                                HStack(spacing: -10){
                                    Circle().fill(Color("Custom Red")).frame(height: 40)
                                    Circle().fill(Color("Custom Yellow")).frame(height: 40)
                                }
                            }.padding([.leading, .trailing, .bottom], 30).foregroundColor(.white)
                        }
                    }
                }.frame(height: 200).cornerRadius(15)
                ZStack{
                    Color("Custom Gray Color").opacity(0.5)
                    HStack{
                        Text("Budget Output Today:")
                        Spacer()
                        Text("Rp\(remainingBudget)")
                    }.padding([.leading, .trailing], 30)
                }.frame(height: 100).cornerRadius(15).foregroundColor(.white)
                Spacer()
                Text("Button place").foregroundColor(.white)
            }
            .padding()
        }
    }
}

struct DailyBudgetModal: View{
    var body: some View{
        Text("Hello, world!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
