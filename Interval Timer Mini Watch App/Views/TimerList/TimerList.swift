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
					TimerDetail(timer: timer)
				} label: {
					TimerRow(timer: timer)
				}
			}
		}
    }
}

struct TimerList_Previews: PreviewProvider {
    static var previews: some View {
		TimerList(timers: [IntervalTimer(intervals: [60.0, 60.0, 60.0]), IntervalTimer(intervals: [60.0, 60.0, 60.0]), IntervalTimer(intervals: [60.0, 60.0, 60.0])])
    }
}
