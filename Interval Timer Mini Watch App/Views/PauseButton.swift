//
//  PauseButton.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-30.
//

import SwiftUI

struct PauseButton: View {
	@ObservedObject var interval: Interval
	
	
    var body: some View {
		if interval.timeRemaining == .seconds(0) {
			// Nothing
		} else if interval.isRunning {
			Button("Pause", action: interval.stop)
		} else if interval.timeRemaining == interval.duration {
			Button("Start", action: interval.start)
		} else {
			Button("Resume", action: interval.start)
		}
    }
}

struct PauseButton_Previews: PreviewProvider {
    static var previews: some View {
		PauseButton(interval: Interval())
    }
}
