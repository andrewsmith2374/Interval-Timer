//
//  IntervalEnd.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.28.
//

import SwiftUI

struct IntervalEnd: View {
	@ObservedObject var interval: Interval
	
    var body: some View {
		if interval.timeRemaining == .zero {
			Text("Hello World")
		}
    }
}

struct IntervalEnd_Previews: PreviewProvider {
    static var previews: some View {
		IntervalEnd(interval: Interval(duration: 5))
    }
}
