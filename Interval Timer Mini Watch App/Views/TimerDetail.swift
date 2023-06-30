//
//  TimerRunning.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023-05-27.
//

import SwiftUI

struct TimerDetail: View {
	var timer: IntervalTimer
	var currentInterval = 0

	var body: some View {
		ZStack {
			CenterText(interval: Interval(duration: timer.intervals[currentInterval]))
			
			BottomBar(interval)
		}
		.onAppear(perform: interface.timer.getCurrentInterval().start)
		.onDisappear(perform: interface.resetTimer)
    }
	
	func nextInterval() {
		// Move the timer to the next interval
		interface.nextInterval()
		if interface.timer.autoContinue {
			interface.timer.getCurrentInterval().start()
		}
	}
}

struct TimerRunning_Previews: PreviewProvider {
    static var previews: some View {
		let timer = IntervalTimer(intervals: [Interval(duration: 5.0), Interval(duration: 5.0), Interval(duration: 5.0)])
		
		TimerDetail(timer: timer)
    }
}
