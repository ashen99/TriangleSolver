//
//  HistoryView.swift
//  TriangleSolver
//
//  Created by Gunarathna Deshan on 2023-03-18.
//

import SwiftUI

struct HistoryView: View {
    @AppStorage("altitude") private var altitude  = ""
    @AppStorage("base") private var base  = ""
    @AppStorage("hypotenuse") private var hypotenuse  = ""
    
    @AppStorage("area") private var area : String = ""
    @AppStorage("perimeter") private var perimeter : String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    Text("altitude").font(.title2)
                    Spacer()
                    Text("\(altitude)").font(.title2)
                }
                HStack {
                    Text("base").font(.title2)
                    Spacer()
                    Text("\(base)").font(.title2)
                }
                HStack {
                    Text("hypotenuse").font(.title2)
                    Spacer()
                    Text("\(hypotenuse)").font(.title2)
                }
                HStack {
                    Text("area").font(.title2)
                    Spacer()
                    Text("\(area)").font(.title2)
                }
                HStack {
                    Text("perimeter").font(.title2)
                    Spacer()
                    Text("\(perimeter)").font(.title2)
                }
                
                Spacer()
            }
            .navigationTitle("Last Calculation")
            .padding()
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
