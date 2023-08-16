//
//  CalculatorView.swift
//  TriangleSolver
//
//  Created by Gunarathna Deshan on 2023-03-18.
//

import SwiftUI

struct CalculatorView: View {
    @State private var selectEdge : Int = 1
    @State private var selectedEdgeName  : String = ""
    @State private var unknownValue : String = ""
    @State private var altitudeTextField : String = ""
    @State private var baseTextField : String = ""
    @State private var hypotenuseTextField  : String = ""
    
    @AppStorage("altitude") private var altitude  = ""
    @AppStorage("base") private var base  = ""
    @AppStorage("hypotenuse") private var hypotenuse  = ""
    
    @AppStorage("area") private var area : String = ""
    @AppStorage("perimeter") private var perimeter : String = ""
    
    @State private var isShow : Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Image("right_triangle")
                    
                HStack {
                    Text("Choose the unkwons edge").bold()
                    Picker(selection: $selectEdge, label: Text("")) {
                        Text("Base").tag(1)
                        Text("Altitude").tag(2)
                        Text("Hypotenuse").tag(3)
                    }
                    .pickerStyle(.wheel)
                    .onChange(of: selectEdge) { _ in
                        isShow = false
                        altitudeTextField = ""
                        baseTextField = ""
                        hypotenuseTextField = ""
                    }
                    
                }
                    
                VStack(alignment : .leading) {
                    Text("Enter the known values").bold()
                    
                    if selectEdge == 1 {
                        TextField("Altitude Value", text: $altitudeTextField)
                            .textFieldStyle(.roundedBorder)
                        TextField("Hypotenuse Value", text: $hypotenuseTextField)
                            .textFieldStyle(.roundedBorder)
                    }else if selectEdge == 2 {
                        TextField("Base Value", text: $baseTextField)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Hypotenuse Value", text: $hypotenuseTextField)
                            .textFieldStyle(.roundedBorder)
                    } else {
                        TextField("Base Value", text: $baseTextField)
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Altitude Value", text: $altitudeTextField)
                            .textFieldStyle(.roundedBorder)
                    }

                }
                
                Button {
                    calculateUnknow()
                    isShow = true
                } label: {
                    Text("Calculate")
                        .font(.subheadline.bold())
                        .padding()
                        .foregroundColor(.white)
                        .background(.green)
                        .cornerRadius(15)
                }.padding()
                
                if isShow {
                    VStack(spacing : 20){
                        HStack {
                            Text("\(selectedEdgeName)")
                            Spacer()
                            Text("\(unknownValue)")
                        }
                        HStack {
                            Text("Area")
                            Spacer()
                            Text("\(area)")
                        }
                        HStack {
                            Text("Perimeter")
                            Spacer()
                            Text("\(perimeter)")
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Triangle Solver")
        }
    }
    
    func calculateUnknow() {
        switch selectEdge {
        case 1:
            guard let a = Double(altitudeTextField) , let c = Double(hypotenuseTextField) else { return }
            let b = (pow(c,2) - pow(a,2)).squareRoot()
            unknownValue = String(format:"%.2f" , b)
            calculateArea(altitude: a, base: b)
            calculatePerimeter(altitude: a, base: b)
            altitude = String(a)
            base = String(b)
            hypotenuse = String(c)
            selectedEdgeName = "base"
            unknownValue = String(b)
        case 2:
            guard let b = Double(baseTextField) , let c = Double(hypotenuseTextField) else { return }
            let a = (pow(c,2) - pow(b,2)).squareRoot()
            unknownValue = String(format:"%.2f" , a)
            calculateArea(altitude: a, base: b)
            calculatePerimeter(altitude: a, base: b)
            altitude = String(a)
            base = String(b)
            hypotenuse = String(c)
            selectedEdgeName = "altitude"
        default:
            guard let a = Double(altitudeTextField) , let b = Double(baseTextField) else { return }
            let c = (pow(a,2) + pow(b,2)).squareRoot()
            unknownValue = String(format:"%.2f" , c)
            calculateArea(altitude: a, base: b)
            calculatePerimeter(altitude: a, base: b)
            altitude = String(a)
            base = String(b)
            hypotenuse = String(c)
            selectedEdgeName = "hypotenuse"
        }
    }
    func calculateArea(altitude: Double , base : Double) {
        let areaValue = (altitude * base) / 2
        area = String(format: "%.2f", areaValue)
        }
    
    func calculatePerimeter(altitude : Double , base: Double) {
        let perimeterValue = altitude + base + (pow(altitude, 2) + pow(base, 2)).squareRoot()
        perimeter = String(format: "%.2f", perimeterValue)
        }
    }

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
