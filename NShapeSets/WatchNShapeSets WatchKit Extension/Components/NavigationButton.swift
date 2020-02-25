//
//  PrimaryButtonView.swift
//  NShapeSets
//
//  Created by Shawn on 2/17/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct NavigationButton: View {
    var title: String
    var destination: ActiveWorkoutView
    
    var body: some View {
        NavigationLink(destination: destination) {
            Text(title)
                .watchTitleFont()
                .accentColor(Palette.accentColor1)
        }
        
    }
}

struct PrimaryButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButton(title: "Start", destination: ActiveWorkoutView(workout: Workout.example))
    }
}
