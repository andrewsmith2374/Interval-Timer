//
//  ContentView.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023-05-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TimerList(timers: [IntervalTimer(intervals: [Interval(), Interval(), Interval()]), IntervalTimer(intervals: [Interval(), Interval(), Interval()]), IntervalTimer(intervals: [Interval(), Interval(), Interval()])])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
