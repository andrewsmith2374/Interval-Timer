//
//  IntervalDetail.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023.06.30.
//

import SwiftUI

struct IntervalDetail: View {
	@ObservedObject var interval: Interval
	@Binding var currentInterval: Int
	
    var body: some View {
		ZStack {
			WatchFace(interval: interval, currentInterval: currentInterval)
			
			BottomBar(interval: interval, currentInterval: $currentInterval)
		}
		.onAppear(perform: interval.start)
    }
}

struct IntervalDetail_Previews: PreviewProvider {
    static var previews: some View {
		@State var currentInterval: Int = 0
		
		IntervalDetail(interval: Interval(), currentInterval: $currentInterval)
    }
}
