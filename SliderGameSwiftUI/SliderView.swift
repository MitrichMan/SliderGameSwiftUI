//
//  SliderView.swift
//  SliderGameSwiftUI
//
//  Created by Dmitrii Melnikov on 02.05.2023.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Float
    @Binding var alpha: CGFloat
    
    var body: some View {
        HStack {
            Text("0")
            UISliderRepresentation(
                value: $value,
                alpha: $alpha
            )
            Text("100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(50), alpha: .constant(1))
    }
}
