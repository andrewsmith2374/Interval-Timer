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
            ContentView(timers: [IntervalTimer(intervals: [Interval(), Interval(), Interval()]), IntervalTimer(intervals: [Interval(), Interval(), Interval()]), IntervalTimer(intervals: [Interval(), Interval(), Interval()])])
        }
    }
}
