//
//  IntervalView.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-29.
//

import SwiftUI

struct IntervalView: View {
	@ObservedObject var interval: Interval
	
    var body: some View {
		VStack {
			Text(String(interval.duration))
			
			Text(String(roundToTenths(interval.timeRemaining)))
		}
			.onAppear(perform: interval.start)
    }
	
	func roundToTenths(_ x : Double) -> Double {
		return Double((x * 10.0).rounded() / 10)
	}
}

struct IntervalView_Previews: PreviewProvider {
    static var previews: some View {
		IntervalView(interval: Interval(duration: 5.0))
    }
}
