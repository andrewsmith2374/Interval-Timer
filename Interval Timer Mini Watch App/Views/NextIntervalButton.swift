//
//  NextIntervalButton.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-06-07.
//

import SwiftUI

struct NextIntervalButton: View {
	@ObservedObject var interface: TimerInterface

    var body: some View {
		Button("Next", action: nextInterval)
    }
	
	func nextInterval() {
		// Move the timer to the next interval
		interface.nextInterval()
		if interface.timer.autoContinue {
			interface.timer.getCurrentInterval().start()
		}
	}
}

struct NextIntervalButton_Previews: PreviewProvider {
    static var previews: some View {
		NextIntervalButton(interface: TimerInterface(timer: IntervalTimer(intervals: [Interval(), Interval()])))
    }
}
