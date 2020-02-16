//
//  ButtonView.swift
//  NShapeSets
//
//  Created by Shawn on 2/16/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    @Binding var value: Double
    var iconName: String
    var onButtonTap: () -> Void
    
    var body: some View {
        Button(action: {
            self.value -= 1
        }, label: {
            Image(systemName: iconName)
                .foregroundColor(Palette.button1Color)
                .header2Font()
        })
            .buttonStyle(PlainButtonStyle())
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(value: .constant(5), iconName: "minus.square.fill", onButtonTap: {})
    }
}
