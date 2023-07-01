//
//  BottomBar.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.28.
//

import SwiftUI

struct BottomBar: View {
	var numIntervals: Int
	@ObservedObject var interval: Interval
	@Binding var currentInterval: Int

	var body: some View {
		HStack(alignment: .center) {
			if interval.isRunning {
				NextIntervalButton(numIntervals: numIntervals, currentInterval: $currentInterval)
				
				Spacer()
				
				PauseButton(interval: interval)
			} else {
				PauseButton(interval: interval)
				
				Spacer()

				NextIntervalButton(numIntervals: numIntervals, currentInterval: $currentInterval)
			}
		}
		.offset(y: 80)
		.padding()
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
		@State var currentInterval: Int = 0
		
		BottomBar(numIntervals: 3, interval: Interval(duration: 5.0), currentInterval: $currentInterval)
    }
}
