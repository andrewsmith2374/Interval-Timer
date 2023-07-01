//
//  IntervalView.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-29.
//

import SwiftUI

struct IntervalText: View {
	@ObservedObject var interval: Interval
	var currentInterval: Int
	
    var body: some View {
		VStack {
			Text(String(interval.duration.formatted(
				.time(pattern: .minuteSecond))))
			.font(.headline)
			.foregroundColor(Color.gray)
			
			Text(String((interval.timeRemaining.formatted(
				.time(pattern: .minuteSecond)))))
			.font(.title)
			
			Text("Interval " + String(currentInterval + 1))
				.font(.footnote)
				.foregroundColor(Color.gray)
		}
    }
	
	private func roundToTenths(_ x : Double) -> Double {
		return Double((x * 10.0).rounded() / 10)
	}
}

struct IntervalView_Previews: PreviewProvider {
    static var previews: some View {
		@State var interval = Interval(duration: 5.0)
		IntervalText(interval: interval, currentInterval: 0)
    }
}
