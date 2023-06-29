//
//  Interval_TimerApp.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-24.
//

import CoreHaptics
import SwiftUI

@main
struct Interval_TimerApp: App {
    var body: some Scene {
        WindowGroup {
			ContentView(interval: Interval())
        }
    }
}
