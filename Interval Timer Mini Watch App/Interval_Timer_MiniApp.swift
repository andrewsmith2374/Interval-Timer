//
//  Interval_Timer_MiniApp.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023-05-27.
//

import SwiftUI

@main
struct Interval_Timer_Mini_Watch_AppApp: App {
    var body: some Scene {
        WindowGroup {
			ContentView(timers: [/*IntervalTimer(intervals: [5, 10, 20], title: "Test"), */IntervalTimer(intervals: [2700, 900, 2700], title: "Soccer Full Length"), IntervalTimer(intervals: [2400, 600, 2400], title: "40 Minute Halves"), IntervalTimer(intervals: [2100, 600, 2100], title: "35 Minute Halves"), IntervalTimer(intervals: [1500, 300, 1500], title: "25 Minute Halves")])
        }
    }
}
