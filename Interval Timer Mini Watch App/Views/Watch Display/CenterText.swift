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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CenterText_Previews: PreviewProvider {
    static var previews: some View {
		let timerInterface: TimerInterface = TimerInterface(timer: IntervalTimer(intervals: [Interval(), Interval()]))

		CenterText(interface: timerInterface, interval: timerInterface.timer.getCurrentInterval())
    }
}
