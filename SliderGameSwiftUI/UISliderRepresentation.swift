//
//  UISliderRepresentation.swift
//  SliderGameSwiftUI
//
//  Created by Dmitrii Melnikov on 02.05.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    
    @Binding var value: Float
    @Binding var alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueWasChanged),
            for: .allEvents
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        uiView.thumbTintColor = UIColor(
            red: 1,
            green: 0,
            blue: 0,
            alpha: alpha
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

// MARK: - Coordinator
extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Float

        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func valueWasChanged(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct UISliderRepresentation_Previews: PreviewProvider {
    static var previews: some View {
        UISliderRepresentation(
            value: .constant(50),
            alpha: .constant(0.5)
        )
    }
}
