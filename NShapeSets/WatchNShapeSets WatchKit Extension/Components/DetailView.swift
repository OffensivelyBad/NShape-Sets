//
//  DetailView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/23/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(Palette.accentColor2)
                .watchInstructionDetailFont()
            Text(value)
                .foregroundColor(Palette.inputColor)
                .watchInstructionDetailFont()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(title: "Remaining sets:", value: "99")
    }
}
