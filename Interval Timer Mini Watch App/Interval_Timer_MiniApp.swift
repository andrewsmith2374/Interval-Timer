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
			ContentView(timers: [IntervalTimer(intervals: [Interval(duration: 2700), Interval(duration: 1800), Interval(duration: 2700)], title: "Soccer Full Length"), IntervalTimer(intervals: [Interval(duration: 2400), Interval(duration: 600), Interval(duration: 2400)], title: "40 Minute Halves"), IntervalTimer(intervals: [Interval(duration: 2100), Interval(duration: 600), Interval(duration: 2100)], title: "35 Minute Halves"), IntervalTimer(intervals: [Interval(duration: 1500), Interval(duration: 300), Interval(duration: 1500)], title: "25 Minute Halves")])
        }
    }
}
