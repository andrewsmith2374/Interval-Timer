//
//  NextIntervalButton.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-06-07.
//

import SwiftUI

struct NextIntervalButton: View {
	var numIntervals: Int
	@Binding var currentInterval: Int

    var body: some View {
		Button(action: nextInterval) {
			Image(systemName: "forward.frame.fill")
		}
		.frame(width: 30, height: 30)
		.foregroundColor(Color.white)
		.background(Color.black)
		.clipShape(Circle())
    }
	
	func nextInterval() {
		// Move timer to next interval if not at the end
		if currentInterval >= numIntervals - 1 {
			return
		}
		currentInterval += 1
	}
}

struct NextIntervalButton_Previews: PreviewProvider {
    static var previews: some View {
		@State var currentInterval: Int = 0
		
		NextIntervalButton(numIntervals: 3, currentInterval: $currentInterval)
    }
}
