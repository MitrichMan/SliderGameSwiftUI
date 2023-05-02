//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Dmitrii Melnikov on 02.05.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var value: Float = 50
    @State private var target = Float.random(in: 0...100)
    @State private var alpha: CGFloat = 0.5
    @State private var alertPresented = false
    
    private var score: Int {
        computeScore()
    }
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(target.rounded().formatted())")
                .padding(.bottom, 16)
            SliderView(
                value: $value,
                alpha: $alpha
            )
            .padding()
            Button("Проверь меня!") {
                alertPresented.toggle()
            }
            .alert("Your score:", isPresented: $alertPresented, actions: {}) {
                Text(score.formatted())
            }
            .padding()
            
            Button("Начать заново") {
                target = Float.random(in: 0...100)
                value = 50
                getAlpha()
            }
        }
        .onAppear {
            getAlpha()
        }
        .onChange(of: value) { _ in
            getAlpha()
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(target - value)
        return Int(100 - difference)
    }
    
    private func getAlpha() {
        alpha = CGFloat(1 - abs(value - target) / 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
