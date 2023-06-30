//
//  BottomBar.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.28.
//

import SwiftUI

struct BottomBar: View {
	var timer: IntervalTimer

	var body: some View {
		HStack(alignment: .center) {
			if interval.isRunning {
				NextIntervalButton(interface: interface)
				
				Spacer()
				
				PauseButton(interval: interface.timer.getCurrentInterval())
			} else {
				PauseButton(interval: interface.timer.getCurrentInterval())
				
				Spacer()

				NextIntervalButton(interface: interface)
			}
		}
		.offset(y: 80)
		.padding()
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
		BottomBar(interface: timerInterface, interval: timerInterface.timer.getCurrentInterval())
    }
}
