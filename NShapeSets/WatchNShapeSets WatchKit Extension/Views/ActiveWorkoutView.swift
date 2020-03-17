//
//  ActiveWorkoutView.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/22/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import SwiftUI
import HealthKit

struct ActiveWorkoutView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var workoutState: ScreenState = .active
    @State private var showingAlert = false
    @ObservedObject var timer: TimerWrapper
    var workout: Workout
    
    var hkHelper: HealthKitHelper
    
    private var healthStore = HKHealthStore()
    
    init(workout: Workout, hkHelper: HealthKitHelper) {
        self.workout = workout
        self.timer = TimerWrapper.example
        self.hkHelper = hkHelper
        self.startWorkout()
    }
    
    func startWorkout() {
        self.hkHelper.setupWorkout()
        self.hkHelper.startWorkoutSession()
    }
    
    func endWorkout() {
        self.hkHelper.endWorkout()
    }
    
    var body: some View {
        VStack {
            getViewForState(workoutState)
        }
        .onDisappear() {
            self.endWorkout()
        }
        .alert(isPresented: $showingAlert) {
            self.endWorkout()
            return Alert(title: Text("Workout complete!"), message: Text("You completed all sets!"), dismissButton: .default(Text("OK"), action: {
                self.goBack()
            }))
        }
    }
    
    func getViewForState(_ state: ScreenState) -> some View {
        return Group {
            if timer.isActive {
                RestView(workout: workout, timer: timer) {
                    self.onSkip()
                }
            }
            else {
                ActiveView(workout: workout, timer: timer) {
                    self.onRest()
                }
            }
        }
    }
    
    func countdown() {
        if 1...3 ~= timer.remainingRest {
            HapticHelper.playCountdownHaptic()
        }
    }
    
    func onRestEnd() {
        print("rest is over")
        workoutState = workoutState == .active ? .rest : .active
        timer.restComplete()
    }
    
    func goBack() {
        presentationMode.wrappedValue.dismiss()
    }
    
    func onRest() {
        if timer.currentRound == timer.rounds {
            showingAlert = true
        }
        else {
            workoutState = workoutState == .active ? .rest : .active
            timer.start()
        }
    }
    
    func onSkip() {
        onRestEnd()
    }
}

struct ActiveWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ActiveWorkoutView(workout: Workout.example, hkHelper: HealthKitHelper())
    }
}
