//
//  TimerRunning.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023-05-27.
//

import SwiftUI

struct TimerDetail: View {
	@ObservedObject var interface: TimerInterface

	var body: some View {
		ZStack {
			CenterText(interface: interface, interval: interface.timer.getCurrentInterval())
			
			BottomBar(interface: interface, interval: interface.timer.getCurrentInterval())
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
		
		TimerDetail(interface: TimerInterface(timer: timer))
    }
}
