//
//  CenterText.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.28.
//

import SwiftUI
import WatchKit

struct WatchFace: View {
	@ObservedObject var interval: Interval
	var currentInterval: Int
	var hapticPlayer: HapticPlayer = HapticPlayer()
	
    var body: some View {
		ZStack {
			if interval.timeRemaining == .zero {
				Text("Interval Finished")
					.font(.headline)
					.onAppear(perform: hapticPlayer.startTimer)
					.onDisappear(perform: hapticPlayer.endTimer)
			} else {
				IntervalText(interval: interval, currentInterval: currentInterval)
			}
			
			ProgressBar(interval: interval)
		}
		.offset(y: 5)
    }
}

struct CenterText_Previews: PreviewProvider {
    static var previews: some View {
		WatchFace(interval: Interval(duration: 5), currentInterval: 0)
    }
}
