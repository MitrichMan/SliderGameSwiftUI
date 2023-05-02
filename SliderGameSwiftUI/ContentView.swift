//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Dmitrii Melnikov on 02.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к 26.")
                .padding(.bottom, 16)
            
            Slider(
                value: .constant(0.5),
                minimumValueLabel: Text("0"),
                maximumValueLabel: Text("100")) {
                }
                .padding(.bottom, 16)

            Button("Проверь меня!") {
            }
            .padding()
            
            Button("Начать заново") {
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
