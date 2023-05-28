//
//  TimerRunning.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023-05-27.
//

import SwiftUI

struct TimerRunning: View {
	var timer: IntervalTimer
	
    var body: some View {
		VStack {
			Text(timer.title)
		}
    }
}

struct TimerRunning_Previews: PreviewProvider {
    static var previews: some View {
		TimerRunning(timer: IntervalTimer(intervals: [Interval(duration: 5.0), Interval(duration: 5.0), Interval(duration: 5.0)]))
    }
}
