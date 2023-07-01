//
//  IntervalDetail.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023.06.30.
//

import SwiftUI

struct IntervalDetail: View {
	var numIntervals: Int
	@ObservedObject var interval: Interval
	@Binding var currentInterval: Int
	
    var body: some View {
		ZStack {
			WatchFace(interval: interval, currentInterval: currentInterval)
			
			BottomBar(numIntervals: numIntervals, interval: interval, currentInterval: $currentInterval)
		}
    }
}

struct IntervalDetail_Previews: PreviewProvider {
    static var previews: some View {
		@State var currentInterval: Int = 0
		
		IntervalDetail(numIntervals: 3, interval: Interval(), currentInterval: $currentInterval)
    }
}
