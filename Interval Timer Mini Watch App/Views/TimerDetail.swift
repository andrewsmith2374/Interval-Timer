//
//  TimerDetail.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.28.
//

import SwiftUI

struct TimerDetail: View {
	@ObservedObject var interface: TimerInterface
	@ObservedObject var lastInterval: Interval

	var body: some View {
		if lastInterval.timeRemaining == .seconds(0) {
			Text("Hello World")
		} else {
			VStack {
				TimerRunning(interface: interface)
				
				Text(String(describing: lastInterval.timeRemaining))
			}
		}
    }
}

struct TimerDetail_Previews: PreviewProvider {
    static var previews: some View {
		let timer = IntervalTimer(autoContinue: true, intervals: [Interval(duration: 5.0), Interval(duration: 5.0), Interval(duration: 5.0)])
		
		TimerDetail(interface: TimerInterface(timer: timer), lastInterval: timer.intervals[2])
    }
}
