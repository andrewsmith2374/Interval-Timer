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
		
		XCTAssertEqual(interval.duration, .seconds(60))
		XCTAssertEqual(interval.isRunning, false)
		XCTAssertEqual(interval.timeRemaining, .seconds(60))
	}
	
	func testIntervalInitDuration() {
		// Test that Interval properly initializes duration and timeRemaining
		let interval = Interval(duration: 2.0)
		
		XCTAssertEqual(interval.duration, .seconds(2))
		XCTAssertEqual(interval.timeRemaining, .seconds(2))
	}
	
	func testIntervalInitDurationNegative() {
		// Test that Interval properly handles negative duration inputs
		let interval = Interval(duration: -20.0)
		
		XCTAssertEqual(interval.duration, .seconds(0))
		XCTAssertEqual(interval.timeRemaining, .seconds(0))
	}
	
	func testIntervalInitDurationInt() {
		// Test that Interal properly handles int inputs
		let interval = Interval(duration: 60)
		
		XCTAssertEqual(interval.duration, .seconds(60))
		XCTAssertEqual(interval.timeRemaining, .seconds(60))
	}
	
	func testIntervalStart() {
		// Test that Interval.start() correctly changes isRunning and starts updating timeRemaining
		let interval = Interval()
		interval.start()

		XCTAssert(interval.isRunning)
		XCTAssert(interval._timer.isValid)
	}
	
	func testIntervalStartAlreadyRunning() {
		// Test that Interval.start() does nothing when already running
		let interval = Interval()
		interval.start()
		interval.start()
		
		XCTAssert(interval.isRunning)
		XCTAssert(interval._timer.isValid)
	}
	
	func testIntervalStop() {
		// Test that Interval.stop() correctly stops the timer and sets isRunning to false
		// Indirectly tests Interval.start()
		let interval = Interval()
		interval.start()
		interval.stop()
		
		XCTAssertFalse(interval.isRunning)
		XCTAssertFalse(interval._timer.isValid)
	}
	
	func testIntervalStopWhileStopped() {
		// Test that Interval.stop() does nothing if already stopped
		let interval = Interval()
		interval.stop()
		
		XCTAssertFalse(interval.isRunning)
		XCTAssertFalse(interval._timer.isValid)
	}
	
	func testIntervalTimerTick() {
		// Test that Interval._timerTick() correctly counts down
		let interval = Interval()
		
		// Simulating Interval.start()
		interval._startTime = Date()
		sleep(1)
		interval._timerTick()
		
		XCTAssert(interval.timeRemaining < interval.duration)
	}
	
	func testIntervalTimerTickAtEnd() {
		// Test that Interval._timerTick() correctly ends automatically
		let interval = Interval(duration: 5)
		
		// Simulating Interval.start()
		interval._startTime = Date()
		sleep(10)
		interval._timerTick()
		
		XCTAssert(interval.timeRemaining == .milliseconds(0))
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
		
		let lowerBoundRemaining = interval.duration - .seconds(10.1) // Requires deviation of no more than 0.1 seconds
		XCTAssert(interval.timeRemaining > lowerBoundRemaining)
	}
	
	/*
	 TESTING INTERVALTIMER
	 */
	func testIntervalTimerInitDefault() {
		// Test that IntervalTimer initializes proper default values
		let intervalTimer = IntervalTimer()
		
		XCTAssertEqual(intervalTimer.autoContinue, true)
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
		let intervalTimer = IntervalTimer(intervals: [60.0])
		
		XCTAssertEqual(intervalTimer.getNumIntervals(), 1)
		XCTAssertEqual(intervalTimer.intervals[0], 60.0)
	}
	
	func testIntervalTimerInitTitleDefined() {
		// Test that IntervalTimer initializes proper defined title values
		let title = "Test"
		let intervalTimer = IntervalTimer(title: title)
		
		XCTAssertEqual(intervalTimer.title, title)
	}
		
	func testIntervalTimerGetNumIntervalsNoIntervals() {
		// Test that IntervalTimer.getNumIntervals() returns 0 when there are no intervals
		let intervalTimer = IntervalTimer()
		
		XCTAssertEqual(intervalTimer.getNumIntervals(), 0)
	}
	
	func testIntervalTimerGetNumIntervalsOneInterval() {
		// Test that IntervalTimer.getNumIntervals() returns 1 when there is one interval
		let intervalTimer = IntervalTimer(intervals: [60.0])
		
		XCTAssertEqual(intervalTimer.getNumIntervals(), 1)
	}
	
	func testIntervalTimerGetNumIntervalsManyIntervals() {
		// Test that IntervalTimer.getNumIntervals() works correctly when there are many intervals
		let numIntervals: Int = 1000
		let intervalList = Array(repeating: 60.0, count: numIntervals)
		let intervalTimer = IntervalTimer(intervals: intervalList)
		
		XCTAssertEqual(intervalTimer.getNumIntervals(), numIntervals)
	}
		
	func testTimerInterfaceInit() {
		// Test that TimerInterface initializes proper default values
		let timer = IntervalTimer(intervals: [Interval()])
		let interface = TimerInterface(timer: timer)
		
		XCTAssertFalse(interface.timer.getCurrentInterval().isRunning)
		XCTAssertEqual(interface.timer.id, timer.id)
	}
	
	func testTimerInterfaceNextInterval() {
		// Test that TimerInterface.nextInterval() causes its timer to move to the next interval
		let timer = IntervalTimer(intervals: [Interval(), Interval(), Interval()])
		let interface = TimerInterface(timer: timer)
		interface.nextInterval()
		
		XCTAssertEqual(interface.timer.getCurrentInterval().index, 1)
	}
	
	func testTimerInterfaceNextIntervalLastInterval() {
		// Test that TimerInterface.nextInterval() causes its timer to end while on the last one
		var timer = IntervalTimer(intervals: [Interval(), Interval(), Interval()])
		timer.nextInterval()
		timer.nextInterval()
		let interface = TimerInterface(timer: timer)
		XCTAssertEqual(interface.timer.getCurrentInterval().index, timer._currentInterval)
		interface.nextInterval()
		
		XCTAssertEqual(interface.timer.getCurrentInterval().index, interface.timer.getNumIntervals() - 1)
	}
	
	func testTimerInterfaceResetTimerIntervalRunning() {
		// Test that TimerInterface.resetTimer() causes its timer to reset its intervals
		// Indirectly tests Interval.start() and IntervalTimer.getCurrentInterval()
		let timer = IntervalTimer(intervals: [Interval()])
		let interface = TimerInterface(timer: timer)
		interface.timer.getCurrentInterval().start()
		interface.resetTimer()
		
		XCTAssertFalse(interface.timer.getCurrentInterval().isRunning)
		XCTAssertEqual(interface.timer.getCurrentInterval().timeRemaining, interface.timer.getCurrentInterval().duration)
	}
	
	func testTimerInterfaceResetTimerSecondInterval() {
		// Test that TimerInterface.resetTimer() causes its timer to reset its current interval
		// Indirectly tests IntervalTimer.nextInterval()
		let timer = IntervalTimer(intervals: [Interval(), Interval()])
		let interface = TimerInterface(timer: timer)
		interface.timer.nextInterval()
		interface.resetTimer()
		
		XCTAssertEqual(interface.timer._currentInterval, 0)
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
