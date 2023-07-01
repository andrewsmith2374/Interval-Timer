//
//  TimerRunning.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023-05-27.
//

import SwiftUI

struct TimerRunning: View {
	var timer: IntervalTimer
	@State private var currentInterval: Int = 0

	var body: some View {
		IntervalDetail(numIntervals: timer.getNumIntervals(), interval: Interval(duration: timer.intervals[currentInterval]), currentInterval: $currentInterval)
    }
}

struct TimerRunning_Previews: PreviewProvider {
    static var previews: some View {
		let timer = IntervalTimer(intervals: [5.0, 5.0, 5.0])
		
		TimerRunning(timer: timer)
    }
}
