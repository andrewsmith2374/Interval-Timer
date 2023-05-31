//
//  TimerRow.swift
//  Interval Timer Mini Watch App
//
//  Created by Andrew Smith on 2023-05-31.
//

import SwiftUI

struct TimerRow: View {
var timer: IntervalTimer
    var body: some View {
		Text(timer.title)
    }
}

struct TimerRow_Previews: PreviewProvider {
    static var previews: some View {
		TimerRow(timer: IntervalTimer())
    }
}
