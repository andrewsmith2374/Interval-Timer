//
//  Interval.swift
//  Interval Timer
//
//  Created by Andrew Smith on 2023-05-25.
//

import Foundation

public class Interval: Identifiable, ObservableObject {
	/*
	 One interval of an IntervalTimer
	 
	 >>> interval = Interval()
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
	 _startTime: The datetime for the last time the timer ticked
	 timeRemaining: The amount of time remaining on this interval in seconds
	 */
	let duration: TimeInterval
	public var id = UUID()
	var index: Int
	var isRunning: Bool
	internal var _startTime: Date
	var timer: Timer
	@Published var timeRemaining: TimeInterval
	
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
		if self.isRunning {
			return
		}
		self.isRunning = true
		self._startTime = Date()
		self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self._timerTick), userInfo: nil, repeats: true)
	}
	
	func stop() {
		// Stop this interval
		if !self.isRunning {
			return
		}
		self.timer.invalidate()
		self.isRunning = false
	}
	
	@objc internal func _timerTick() {
		// Update timeRemaining and check if this interval has ended
		self.timeRemaining -= (Date().timeIntervalSince(self._startTime))
		if self.timeRemaining <= 0.0 {
			self.stop()
			return
		}
		self._startTime = Date()
	}
}
