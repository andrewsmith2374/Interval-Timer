//
//  TimerList.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-31.
//

import SwiftUI

struct TimerList: View {
	var timers: Array<IntervalTimer>

    var body: some View {
		VStack {
			ForEach(timers) {
				timer in NavigationLink {
					IntervalView(interval: Interval())
				} label: {
					PauseButton(interval: Interval())
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
