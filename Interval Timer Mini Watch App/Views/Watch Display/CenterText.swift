//
//  CenterText.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.28.
//

import SwiftUI

struct CenterText: View {
	@ObservedObject var interface: TimerInterface
	@ObservedObject var interval: Interval
	
    var body: some View {
		ZStack {
			if interval.timeRemaining == .zero {
				Text("Interval Finished")
					.font(.headline)
					.onAppear(perform: intervalFinished)
			} else {
				IntervalView(interval: interface.timer.getCurrentInterval())
			}
			
			ProgressBar(interval: interface.timer.getCurrentInterval())
		}
		.offset(y: 5)
    }
	
	func intervalFinished() {
		// Play alarm
	}
}

struct CenterText_Previews: PreviewProvider {
    static var previews: some View {
		let timerInterface: TimerInterface = TimerInterface(timer: IntervalTimer(intervals: [Interval(), Interval()]))

		CenterText(interface: timerInterface, interval: timerInterface.timer.getCurrentInterval())
    }
}
