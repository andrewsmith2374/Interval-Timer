//
//  CenterText.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023.06.28.
//

import SwiftUI

struct CenterText: View {
	var interval: Interval
	
    var body: some View {
		ZStack {
			if interval.timeRemaining == .zero {
				Text("Interval Finished")
					.font(.headline)
					.onAppear(perform: playHaptic)
			} else {
				IntervalView(interval: interval)
			}
			
			ProgressBar(interval: interval)
		}
		.offset(y: 5)
    }
}

struct CenterText_Previews: PreviewProvider {
    static var previews: some View {
		CenterText(interval: Interval())
    }
}
