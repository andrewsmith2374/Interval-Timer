//
//  CenterText.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.28.
//

import SwiftUI

struct WatchFace: View {
	var interval: Interval
	var currentInterval: Int
	
    var body: some View {
		ZStack {
			if interval.timeRemaining == .zero {
				Text("Interval Finished")
					.font(.headline)
					.onAppear(perform: playHaptic)
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
		WatchFace(interval: Interval(), currentInterval: 0)
    }
}
