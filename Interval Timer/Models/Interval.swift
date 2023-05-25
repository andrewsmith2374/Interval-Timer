//
//  Interval.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-25.
//

import Foundation

internal struct _Interval: Identifiable {
	/*
	 One interval of an IntervalTimer
	 
	 >>> interval = _Interval()
	 >>> print(interval)
	 Interval of duration 60.0 seconds
	 >>> interval.duration
	 60.0
	 >>> interval.index
	 0
	 >>> interval.duration = 70.0
	 >>> interval.index = 1
	 
	 === Attributes ===
	 duration: The duration of this interval in seconds
	 id: Unique identifier
	 index: The index of this interval within an IntervalTimer, starting from 0
	 */
	var duration: TimeInterval
	public var id = UUID()
	var index: Int
	
	init(duration: Double = 60.0, index: Int = 0) {
		if duration < 0.0 {
			self.duration = TimeInterval(0.0)
		} else {
			self.duration = TimeInterval(duration)
		}
		if index < 0 {
			self.index = 0
		} else {
			self.index = index
		}
	}
}
