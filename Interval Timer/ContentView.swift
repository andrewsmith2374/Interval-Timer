//
//  ContentView.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-24.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var interval: _Interval
	
    var body: some View {
        VStack {
			Button("Start", action: interval.start)
			
			Button("Stop", action: interval.stop)
			
			Text(String(interval.timeRemaining))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(interval: _Interval(duration: 5.0))
    }
}
