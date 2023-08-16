//
//  ContentView.swift
//  TriangleSolver
//
//  Created by Gunarathna Deshan on 2023-03-18.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                CalculatorView().tabItem
                {
                    Image(systemName: "sum")
                    Text("Calculation")
                }
                
                HistoryView().tabItem
                {
                    Image(systemName: "list.dash")
                    Text("History")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
