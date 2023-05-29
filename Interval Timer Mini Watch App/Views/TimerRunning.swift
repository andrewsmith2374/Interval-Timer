//
//  TimerRunning.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023-05-27.
//

import SwiftUI

struct TimerRunning: View {
	var interface: TimerInterface
	
    var body: some View {
		VStack {
			Text(interface.timer.title)
			
			IntervalView(interval: interface.timer.getCurrentInterval())
			
			Button("Skip", action: nextInterval)
			
			Button("Reset", action: interface.resetTimer)
		}
    }
	
	func nextInterval() {
		// Move the timer to the next interval
	}
}

struct TimerRunning_Previews: PreviewProvider {
    static var previews: some View {
		let timer = IntervalTimer(intervals: [Interval(duration: 5.0), Interval(duration: 5.0), Interval(duration: 5.0)])
		
		TimerRunning(interface: TimerInterface(timer: timer))
    }
}
