//
//  ContentView.swift
//  QuadraticEquation
//
//  Created by Abishan Parameswaran on 2023-02-28.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("firstField") private var firstTerm = ""
    @AppStorage("secondField") private var secondTerm = ""
    @AppStorage("thirdField") private var thirdTerm = ""
    @AppStorage("firstValue") private var valueOfPositiveX = "0.0"
    @AppStorage("secondValue") private var valueOfNegativeX = "0.0"
    
    var body: some View {
        ZStack {
            Color(hue: 0.656, saturation: 0.431, brightness: 0.547).ignoresSafeArea()
            ScrollView{
                VStack(spacing: 20){
                    Text("Quadratic Solver")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
    
                    Image("quadraticForm")
                        .resizable()
                        .scaledToFit()
                    
                    VStack(){
                        HStack(spacing: 20)
                        {
                            Image(systemName: "a.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(Color.white)
                            
                            
                            Text("Enter the First Term")
                                .font(.system(size: 20))
                                .foregroundColor(Color.white)
                        }
                        .frame(maxWidth: 300, maxHeight: 30)
                        
                        TextField("Enter the First Term", text: $firstTerm)
                            .frame(width: 300,height: 20,alignment: .leading)
                            .fontWeight(.medium)
                            .padding()
                                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.white, style: StrokeStyle(lineWidth: 1.0)))
                                        .padding()
                        
                        HStack(spacing: 20)
                        {
                            Image(systemName: "b.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(Color.white)
                            
                            
                            Text("Enter the Second Term")
                                .font(.system(size: 20))
                                .foregroundColor(Color.white)
                        }
                        .frame(maxWidth: 300, maxHeight: 30)
//                        .background(Color.white)
                        
                        TextField("Enter the Second Term", text: $secondTerm)
                            .frame(width: 300,height: 20,alignment: .leading)
                            .fontWeight(.medium)
                            .padding()
                                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.white, style: StrokeStyle(lineWidth: 1.0)))
                                        .padding()
                        
                        HStack(spacing: 20)
                        {
                            Image(systemName: "c.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(Color.white)
                            
                            
                            Text("Enter the Third Term")
                                .font(.system(size: 20))
                                .foregroundColor(Color.white)
                        }
                        .frame(maxWidth: 300, maxHeight: 30)
                        
                        TextField("Enter the Third Term", text: $thirdTerm)
                            .frame(width: 300,height: 20,alignment: .leading)
                            .fontWeight(.medium)
                            .padding()
                                        .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.white, style: StrokeStyle(lineWidth: 1.0)))
                                        .padding()
                    }
                    
                    VStack{
                        Button {
                            solverForX()
                            
                        } label: {
                            Text("Solve for X")
                                .font(.headline)
                                .modifier(customViewModifier(roundedCornes: 30, startColor: Color.white,
                                                             endColor:
                                                                Color.white,
                                                             textColor: Color.white))
                                
                        }
                    }
                    
                    Text(" X = \(valueOfPositiveX) or X = \(valueOfNegativeX)")
                        .font(.system(size: 18))
                        .foregroundColor(Color.white)
                    
                    
                }
            }
            .padding()
        }
    }
    func solverForX(){
        
        guard let firstTerm = Double(firstTerm),
              let secondTerm = Double(secondTerm),
              let thirdTerm = Double(thirdTerm)
        else {
            return
        }
        
        let bSquared = secondTerm * secondTerm
        let descriminant = bSquared - (4 * firstTerm * thirdTerm)
        let descriminatSqrt =  sqrt(fabs(descriminant))
        
        
        let topFormulaOne = -secondTerm + descriminatSqrt
        let topFormulaTwo =  -secondTerm - descriminatSqrt
        
        let topFormulaOneDivideTwo = topFormulaOne / 2 * firstTerm
        let topFormulaTwoDivideOne = topFormulaTwo / 2 * firstTerm
        
        valueOfPositiveX = String(format: "%.2f", topFormulaOneDivideTwo)
        print(valueOfPositiveX)
        valueOfNegativeX = String(format: "%.2f", topFormulaTwoDivideOne)
        print(valueOfNegativeX)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
