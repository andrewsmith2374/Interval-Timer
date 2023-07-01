//
//  BottomBar.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.28.
//

import SwiftUI

struct BottomBar: View {
	@ObservedObject var interval: Interval
	@Binding var currentInterval: Int

	var body: some View {
		HStack(alignment: .center) {
			if interval.isRunning {
				NextIntervalButton(currentInterval: $currentInterval)
				
				Spacer()
				
				PauseButton(interval: interval)
			} else {
				PauseButton(interval: interval)
				
				Spacer()

				NextIntervalButton(currentInterval: $currentInterval)
			}
		}
		.offset(y: 80)
		.padding()
    }
}

struct BottomBar_Previews: PreviewProvider {
    static var previews: some View {
		@State var currentInterval: Int = 0
		
		BottomBar(interval: Interval(duration: 5.0), currentInterval: $currentInterval)
    }
}
