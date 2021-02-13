//
//  HapticHelper.swift
//  NShapeSets
//
//  Created by Shawn Roller on 2/27/20.
//  Copyright © 2020 offensively-bad. All rights reserved.
//

import Foundation
import WatchKit

struct HapticHelper {
    
    static func playCountdownHaptic() {
        if UserDefaults.standard.bool(forKey: Defaults.playSoundEffects) {
            WKInterfaceDevice.current().play(.start)
        }
    }
    
    static func playStartHaptic() {
        if UserDefaults.standard.bool(forKey: Defaults.playSoundEffects) {
            WKInterfaceDevice.current().play(.success)
        }
    }
}
