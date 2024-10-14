import SwiftUI

struct ContentView: View {
    @State var dailyBudget = 30000
    @State var remainingBudget = 100000
    @State var buyList = ["Makanan": 30000, "Susu Kucing": 15000]
    @State private var budgetIntactModal = false
    @State private var addListModal = false
    @State var path = NavigationPath()

    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                ZStack {
                    Color("Custom Gray Color").opacity(0.5)
                    VStack {
                        HStack {
                            Text("Budget Intact: ").bold()
                            Text("Rp\(dailyBudget)")
                            Spacer()
                        }
                        .padding([.leading, .top], 30)
                        .foregroundColor(.white)

                        Spacer()

                        HStack {
                            Text("A**** K******* Ardhiyanda").bold()
                            Spacer()
                            HStack(spacing: -10) {
                                Circle().fill(Color("Custom Red")).frame(height: 40)
                                Circle().fill(Color("Custom Yellow")).frame(height: 40)
                            }
                        }
                        .padding([.leading, .trailing, .bottom], 30)
                        .foregroundColor(.white)
                    }
                }
                .frame(height: 200)
                .cornerRadius(15)

                ZStack {
                    Color("Custom Gray Color").opacity(0.5)
                    HStack {
                        Text("Budget Output Today:")
                        Spacer()
                        Text("Rp\(remainingBudget)")
                    }
                    .padding([.leading, .trailing], 30)
                }
                .frame(height: 100)
                .cornerRadius(15)
                .foregroundColor(.white)

                Spacer()

                ZStack {
                    Color("Custom Gray Color").opacity(0.5)
                    VStack {
                        Text("Buy List Today")
                        ForEach(Array(buyList.keys), id: \.self) { key in
                            if let price = buyList[key] {
                                Text("\(key): Rp\(price)")
                            }
                        }
                        Spacer()
                    }
                    .padding()
                }
                .cornerRadius(15)
                .foregroundColor(.white)

                HStack {
                    Button(action: {
                        addListModal = true
                    }) {
                        Text("Add List")
                    }
                    .sheet(isPresented: $addListModal) {
                        AddListModal(itemList: $buyList)  // Pass buyList as a binding
                            .presentationDetents([.medium])
                    }

                    Spacer()

                    Button(action: {
                        budgetIntactModal = true
                    }) {
                        Text("Add Budget Intact")
                    }
                    .sheet(isPresented: $budgetIntactModal) {
                        BudgetIntactModal()
                            .presentationDetents([.medium])
                    }
                }
                .buttonStyle(.bordered)
            }
            .padding()
        }
    }
}

struct AddListModal: View {
    @State private var key: String = ""
    @State private var value: Int = 0
    @Binding var itemList: [String: Int]
    var body: some View {
        VStack {
            Text("Add to Buy List").bold()
            TextField("Item Name", text: $key)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Price", value: $value, format: .number)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add Item") {
                if !key.isEmpty {
                    itemList[key] = value
                    key = ""
                    value = 0
                }
            }
            .padding()
        }
        .padding()
    }
}

struct BudgetIntactModal: View {
    var body: some View {
        Text("Budget Intact Modal")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

