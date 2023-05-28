//
//  Interval_TimerTests.swift
//  Interval TimerTests
//
//  Created by Andrew Smith on 2023-05-24.
//

import XCTest

final class Interval_TimerTests: XCTestCase {
	
	/*
	 TESTING INTERVAL
	 */
	func testIntervalInitDefault() {
		// Test that Interval initializes proper default values
		let interval = Interval()
		
		XCTAssertEqual(String(describing: interval), "Interval of 60.0 seconds")
		XCTAssertEqual(interval.duration, 60.0)
		XCTAssertEqual(interval.index, 0)
		XCTAssertEqual(interval.isRunning, false)
		XCTAssertEqual(interval.timeRemaining, 60.0)
	}
	
	func testIntervalInitDuration() {
		// Test that Interval properly initializes duration and timeRemaining
		let interval = Interval(duration: 2.0)
		
		XCTAssertEqual(interval.duration, 2.0)
		XCTAssertEqual(interval.timeRemaining, 2.0)
	}
	
	func testIntervalInitDurationNegative() {
		// Test that Interval properly handles negative duration inputs
		let interval = Interval(duration: -20.0)
		
		XCTAssertEqual(interval.duration, 0.0)
		XCTAssertEqual(interval.timeRemaining, 0.0)
	}
	
	func testIntervalInitDurationInt() {
		// Test that Interal properly handles int inputs
		let interval = Interval(duration: 60)
		
		XCTAssertEqual(interval.duration, 60.0)
		XCTAssertEqual(interval.timeRemaining, 60.0)
	}
	
	func testIntervalInitIndex() {
		// Test that Interval properly intializes index
		let interval = Interval(index: 1)
		
		XCTAssertEqual(interval.index, 1)
	}
	
	func testIntervalInitIndexNegative() {
		// Test that Interval properly handles negative index inputs
		let interval = Interval(index: -1)
		
		XCTAssertEqual(interval.index, 0)
	}
	
	func testIntervalDescriptionOneSecond() {
		// Test that Interval has correct description when duration is one second
		let interval = Interval(duration: 1.0)
		
		XCTAssertEqual(String(describing: interval), "Interval of 1.0 second")
	}
	
	func testIntervalDescriptionMultipleSeconds() {
		// Test that Interval has correct description when duration is not one second
		let interval = Interval(duration: 10.0)
		
		XCTAssertEqual(String(describing: interval), "Interval of 10.0 seconds")
	}
	
	func testIntervalStart() {
		// Test that Interval.start() correctly changes isRunning and starts updating timeRemaining
		let interval = Interval()
		interval.start()

		XCTAssert(interval.isRunning)
		XCTAssert(interval.timer.isValid)
	}
	
	func testIntervalStartAlreadyRunning() {
		// Test that Interval.start() does nothing when already running
		let interval = Interval()
		interval.start()
		interval.start()
		
		XCTAssert(interval.isRunning)
		XCTAssert(interval.timer.isValid)
	}
	
	func testIntervalStop() {
		// Test that Interval.stop() correctly stops the timer and sets isRunning to false
		// Indirectly tests Interval.start()
		let interval = Interval()
		interval.start()
		interval.stop()
		
		XCTAssert(!interval.isRunning)
		XCTAssert(!interval.timer.isValid)
	}
	
	func testIntervalStopWhileStopped() {
		// Test that Interval.stop() does nothing if already stopped
		let interval = Interval()
		interval.stop()
		
		XCTAssert(!interval.isRunning)
		XCTAssert(!interval.timer.isValid)
	}
	
	func testIntervalTimerTick() {
		// Test that Interval._timerTick() correctly counts down and ends automatically
		let interval = Interval()
		
		// Simulating Interval.start()
		interval._startTime = Date()
		sleep(1)
		interval._timerTick()
		
		XCTAssert(interval.timeRemaining < interval.duration)
	}
	
	func testIntervalTimerTickAfterStopping() {
		// Test that Interval._timerTick() correclty works after stopping and restarting the timer
		let interval = Interval()
		
		// Simulating Interval.start()
		interval._startTime = Date()
		sleep(5)
		interval._timerTick()
		interval.stop()
		sleep(5)
		interval._startTime = Date()
		sleep(5)
		interval._timerTick()
		
		let lowerBoundRemaining = interval.duration - 10.1 // Requires deviation of no more than 0.1 seconds
		XCTAssert(interval.timeRemaining > lowerBoundRemaining)
	}
	
	/*
	 TESTING INTERVALTIMER
	 */
	func testIntervalTimerInitDefault() {
		// Test that IntervalTimer initializes proper default values
		let intervalTimer = IntervalTimer()
		
		XCTAssertEqual(intervalTimer.autoContinue, false)
		XCTAssertEqual(intervalTimer._currentInterval, 0)
		XCTAssertEqual(String(describing: intervalTimer), "Interval Timer with 0 Intervals")
		XCTAssert(intervalTimer.intervals.isEmpty)
		XCTAssertEqual(intervalTimer.title, "Timer")
	}
	
	func testIntervalTimerInitAutoContinue() {
		// Test that IntervalTimer properly initializes autoContinue
		let intervalTimer = IntervalTimer(autoContinue: true)
		
		XCTAssert(intervalTimer.autoContinue)
	}
	
	func testIntervalTimerInitIntervalsOneInterval() {
		// Test that IntervalTimer correctly initializes with one interval
		let intervalTimer = IntervalTimer(intervals: [Interval()])
		
		XCTAssertEqual(intervalTimer.getNumIntervals(), 1)
		XCTAssertEqual(intervalTimer.intervals[0].index, 0)
	}
	
	func testIntervalTimerInitIntervalsMultipleIntervals() {
		// Test that IntervalTimer correctly initializes with proper indexing
		let intervalList = [Interval(), Interval(), Interval(), Interval()]
		let intervalTimer = IntervalTimer(intervals: intervalList)
		var i: Int = 0
		
		for interval in intervalTimer.intervals {
			XCTAssertEqual(interval.index, i)
			i += 1
		}
	}
	
	func testIntervalTimerInitTitleDefined() {
		// Test that IntervalTimer initializes proper defined title values
		let title = "Test"
		let intervalTimer = IntervalTimer(title: title)
		
		XCTAssertEqual(intervalTimer.title, title)
	}
		
	func testIntervalTimerDescriptionOneInterval() {
		// Test that IntervalTimer has proper String representation when it has one interval
		let intervalTimer = IntervalTimer(intervals: [Interval()])
		
		XCTAssertEqual(String(describing: intervalTimer), "Interval Timer with 1 Interval")
	}
	
	func testIntervalTimerDescriptionMultipleIntervals() {
		// Test that IntervalTimer has proper String representation when empty
		let intervalTimer = IntervalTimer(intervals: [Interval(), Interval()])
		
		XCTAssertEqual(String(describing: intervalTimer), "Interval Timer with 2 Intervals")
	}
	
	func testIntervalTimerGetNumIntervalsNoIntervals() {
		// Test that IntervalTimer.getNumIntervals() returns 0 when there are no intervals
		let intervalTimer = IntervalTimer()
		
		XCTAssertEqual(intervalTimer.getNumIntervals(), 0)
	}
	
	func testIntervalTimerGetNumIntervalsOneInterval() {
		// Test that IntervalTimer.getNumIntervals() returns 1 when there is one interval
		let intervalTimer = IntervalTimer(intervals: [Interval()])
		
		XCTAssertEqual(intervalTimer.getNumIntervals(), 1)
	}
	
	func testIntervalTimerGetNumIntervalsManyIntervals() {
		// Test that IntervalTimer.getNumIntervals() works correctly when there are many intervals
		let numIntervals: Int = 1000
		let intervalList = Array(repeating: Interval(), count: numIntervals)
		let intervalTimer = IntervalTimer(intervals: intervalList)
		
		XCTAssertEqual(intervalTimer.getNumIntervals(), numIntervals)
	}
		
	func testIntervalTimerNextIntervalLastInterval() {
		// Test that IntervalTimer.nextInterval() resets the timer when on the last interval
		var intervalTimer = IntervalTimer(intervals: [Interval(), Interval(), Interval()])
		intervalTimer._currentInterval = 2
		intervalTimer.nextInterval()
		
		XCTAssertEqual(intervalTimer._currentInterval, 0)
		for interval in intervalTimer.intervals {
			XCTAssertEqual(interval.timeRemaining, interval.duration)
			XCTAssert(!interval.isRunning)
		}
	}
	
	func testIntervalTimerNextInterval() {
		// Test that IntervalTimer.nextInterval() advances the current interval
		var intervalTimer = IntervalTimer(intervals: [Interval(), Interval(), Interval()])
		intervalTimer.nextInterval()
		
		XCTAssertEqual(intervalTimer._currentInterval, 1)
	}
	
	func testIntervalTimerResetNotStarted () {
		// Test that IntervalTimer.reset() correctly resets the timer and interval values when the timer has not been started
		var intervalTimer = IntervalTimer(intervals: [Interval(), Interval(), Interval()])
		intervalTimer.reset()
		
		for interval in intervalTimer.intervals {
			XCTAssert(!interval.isRunning)
			XCTAssertEqual(interval.timeRemaining, interval.duration)
			XCTAssert(!interval.timer.isValid)
		}
	}
	
	// TODO: Implement
	func testIntervalTimerResetSecondInterval() {
		// Test that IntervalTimer.reset() correctly resets the timer, interval values, and current interval when in the second interval
	}
	
	func testIntervalTimerResetStarted() {
		// Test that IntervalTimer.reset() correctly resets interval values when started
		// Indirectly tests IntervalTimer.nextInterval()
		var intervalTimer = IntervalTimer(intervals: [Interval(), Interval(), Interval()])
		intervalTimer.getCurrentInterval().start()
		intervalTimer.reset()
		
		for interval in intervalTimer.intervals {
			XCTAssert(!interval.isRunning)
			XCTAssertEqual(interval.timeRemaining, interval.duration)
			XCTAssert(!interval.timer.isValid)
		}
	}
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}

	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func testExample() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct results.
		// Any test you write for XCTest can be annotated as throws and async.
		// Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
		// Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
	}

	func testPerformanceExample() throws {
		// This is an example of a performance test case.
		measure {
			// Put the code you want to measure the time of here.
		}
	}

}
