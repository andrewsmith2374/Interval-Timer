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
		VStack {
			if interval.timeRemaining == .seconds(0) {
				// Nothing
			} else if interval.isRunning {
				Button(action: interval.stop) {
					Image(systemName: "pause.fill")
				}
			} else if interval.timeRemaining == interval.duration {
				Button(action: interval.start) {
					Image(systemName: "play.fill")
				}
			} else {
				Button(action: interval.start) {
					Image(systemName: "play.fill")
				}
			}
		}
		.frame(width: 30, height: 30)
		.foregroundColor(Color.black)
		.background(Color.orange)
		.clipShape(Circle())
    }
}

struct PauseButton_Previews: PreviewProvider {
    static var previews: some View {
		PauseButton(interval: Interval())
    }
}
