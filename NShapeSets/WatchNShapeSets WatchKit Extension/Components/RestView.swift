//
//  RestView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/23/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI

struct RestView: View {
    var workout: Workout
    @ObservedObject var timer: TimerWrapper
    var onButtonTap: () -> Void
    
    var body: some View {
        VStack {
            DetailView(title: "Total time:", value: "\(TimeHelper.getTimeFromSeconds(timer.totalTime))", smallText: true)
            InstructionView(title: "Resting...", value: "\(timer.remainingRest)", countdownTotal: timer.rest, currentCountdown: timer.remainingRest)
            Spacer()
            DetailView(title: "Next set:", value: "\(timer.nextSetString)", smallText: true)
            Spacer().frame(height: 0)
            PrimaryButton(title: "Skip", buttonColor: Palette.button1Color) {
                self.onButtonTap()
            }
        }
    }
}

struct RestView_Previews: PreviewProvider {
    static var previews: some View {
        RestView(workout: Workout.example, timer: TimerWrapper.example, onButtonTap: {})
    }
}
