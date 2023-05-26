//
//  Interval.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-25.
//

import Foundation

internal class _Interval: Identifiable {
	/*
	 One interval of an IntervalTimer
	 
	 >>> interval = _Interval()
	 >>> print(interval)
	 Interval of duration 60.0 seconds
	 >>> interval.duration
	 60.0
	 >>> interval.index
	 0
	 >>> interval.isRunning
	 false
	 >>> interval.timeRemaining
	 60.0
	 >>> interval.duration = 70.0
	 >>> interval.index = 1
	 >>> interval.start()
	 >>> interval.isRunning
	 true
	 >>> interval.timeRemaining < interval.duration
	 true
	 >>> interval.stop()
	 >>> interval.isRunning
	 false
	 
	 === Attributes ===
	 duration: The duration of this interval in seconds
	 id: Unique identifier
	 index: The index of this interval within an IntervalTimer, starting from 0
	 isRunning: Whether this index is counting down or not
	 timeRemaining: The amount of time remaining on this interval in seconds
	 
	 === Private Attributes ===
	 _startTime: The datetime for the last time the timer ticked
	 */
	var duration: TimeInterval
	public var id = UUID()
	var index: Int
	var isRunning: Bool
	private var _startTime: Date
	var timer: Timer
	var timeRemaining: TimeInterval
	
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
		self.isRunning = false
		self._startTime = Date()
		self.timer = Timer()
		self.timeRemaining = self.duration
	}
	
	func start() {
		// Start this interval
		self.isRunning = true
		self._startTime = Date()
		self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
	}
	
	func stop() {
		// Stop this interval
	}
	
	@objc private func timerTick() {
		// Update timeRemaining
		self.timeRemaining -= (Date().timeIntervalSince(self._startTime))
		self._startTime = Date()

		print(self.timeRemaining)
	}
}
