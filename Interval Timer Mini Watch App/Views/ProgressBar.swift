//
//  ProgressBar.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-06-07.
//

import SwiftUI

struct ProgressBar: View {
	let stroke: Double = 3
	@State var timeLeft: Duration
	@State var duration: Duration
	
    var body: some View {
		ZStack {
			Circle()
				.stroke(lineWidth: stroke)
				.foregroundColor(Color.orange)
			
			Circle()
				.trim(from: 0.0, to: Double(timeLeft) / Double(duration))
				.stroke(style: StrokeStyle(lineWidth: stroke, lineCap: .round, lineJoin: .round))
				.foregroundColor(Color.gray)
		}
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
		ProgressBar(timeLeft: .seconds(30), duration: .seconds(100))
    }
}
