//
//  TimerRunning.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023-05-27.
//

import SwiftUI

struct TimerRunning: View {
	@ObservedObject var interface: TimerInterface

	var body: some View {
		VStack {
			IntervalView(interval: interface.timer.getCurrentInterval())
			
			NextIntervalButton(interface: interface)
			
			PauseButton(interval: interface.timer.getCurrentInterval())
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
		let timer = IntervalTimer(autoContinue: false, intervals: [Interval(duration: 5.0), Interval(duration: 5.0), Interval(duration: 5.0)])
		
		TimerRunning(interface: TimerInterface(timer: timer))
    }
}
