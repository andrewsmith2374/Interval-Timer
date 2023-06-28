//
//  TimerList.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-31.
//

import SwiftUI

struct TimerList: View {
	var timers: [IntervalTimer]

    var body: some View {
		NavigationStack {
			ForEach(timers) {
				timer in NavigationLink {
					TimerDetail(interface: TimerInterface(timer: timer), lastInterval: timer.getLastInterval())
				} label: {
					TimerRow(timer: timer)
				}
			}
		}
    }
}

struct TimerList_Previews: PreviewProvider {
    static var previews: some View {
		TimerList(timers: [IntervalTimer(intervals: [Interval(), Interval(), Interval()]), IntervalTimer(intervals: [Interval(), Interval(), Interval()]), IntervalTimer(intervals: [Interval(), Interval(), Interval()])])
    }
}
