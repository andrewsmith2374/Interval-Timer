//
//  ContentView.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023-05-27.
//

import SwiftUI

struct ContentView: View {
	var timers: [IntervalTimer]

	var body: some View {
		TimerList(timers: timers)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(timers: [IntervalTimer(intervals: [60.0, 60.0, 60.0]), IntervalTimer(intervals: [60.0, 60.0, 60.0]), IntervalTimer(intervals: [60.0, 60.0, 60.0]), IntervalTimer(intervals: [5, 5, 5]), IntervalTimer(intervals: [5, 5, 5])])
    }
}
