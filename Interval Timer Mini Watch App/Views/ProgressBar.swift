//
//  ProgressBar.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-06-07.
//

import SwiftUI

struct ProgressBar: View {
	let stroke: Double = 3.0
	@ObservedObject var interval: Interval
	
    var body: some View {
		ZStack {
			Circle()
				.stroke(lineWidth: stroke)
				.foregroundColor(Color(UIColor.darkGray))
			
			Circle()
				.trim(from: 0.0, to: interval.timeRemaining / interval.duration)
				.stroke(style: StrokeStyle(lineWidth: stroke, lineCap: .round, lineJoin: .round))
				.foregroundColor(Color.orange)
				.rotationEffect(Angle(degrees: 270.0))
		}
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
		@State var interval: Interval = Interval()
		ProgressBar(interval: interval)
    }
}
