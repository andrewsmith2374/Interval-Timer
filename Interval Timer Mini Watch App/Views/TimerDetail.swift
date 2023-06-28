//
//  TimerDetail.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.28.
//

import SwiftUI

struct TimerDetail: View {
	@ObservedObject var interface: TimerInterface

	var body: some View {
		if interface.timer.getLastInterval().timeRemaining <= .seconds(0) {
			Text("Hello World")
		} else {
			TimerRunning(interface: interface)
		}
    }
}

struct TimerDetail_Previews: PreviewProvider {
    static var previews: some View {
		let timer = IntervalTimer(intervals: [Interval(duration: 5.0), Interval(duration: 5.0), Interval(duration: 5.0)])
		
		TimerDetail(interface: TimerInterface(timer: timer))
    }
}
