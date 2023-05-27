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
		let interval = _Interval()
		
		XCTAssertEqual(interval.duration, 60.0)
		XCTAssertEqual(interval.index, 0)
		XCTAssertEqual(interval.isRunning, false)
		XCTAssertEqual(interval.timeRemaining, 60.0)
	}
	
	func testIntervalInitDuration() {
		// Test that Interval properly initializes duration and timeRemaining
		let interval = _Interval(duration: 2.0)
		
		XCTAssertEqual(interval.duration, 2.0)
		XCTAssertEqual(interval.timeRemaining, 2.0)
	}
	
	func testIntervalInitDurationNegative() {
		// Test that Interval properly handles negative duration inputs
		let interval = _Interval(duration: -20.0)
		
		XCTAssertEqual(interval.duration, 0.0)
		XCTAssertEqual(interval.timeRemaining, 0.0)
	}
	
	func testIntervalInitDurationInt() {
		// Test that Interal properly handles int inputs
		let interval = _Interval(duration: 60)
		
		XCTAssertEqual(interval.duration, 60.0)
		XCTAssertEqual(interval.timeRemaining, 60.0)
	}
	
	func testIntervalInitIndex() {
		// Test that Interval properly intializes index
		let interval = _Interval(index: 1)
		
		XCTAssertEqual(interval.index, 1)
	}
	
	func testIntervalInitIndexNegative() {
		// Test that Interval properly handles negative index inputs
		let interval = _Interval(index: -1)
		
		XCTAssertEqual(interval.index, 0)
	}
	
	// TODO: Update to check timeRemaining after IntervalTimer integration
	func testIntervalStart() {
		// Test that Interval.start() correctly changes isRunning and starts updating timeRemaining
		let interval = _Interval()
		interval.start()

		XCTAssert(interval.isRunning)
		XCTAssert(interval.timer.isValid)
	}
	
	func testIntervalStartAlreadyRunning() {
		// Test that Interval.start() does nothing when already running
		let interval = _Interval()
		interval.start()
		interval.start()
		
		XCTAssert(interval.isRunning)
		XCTAssert(interval.timer.isValid)
	}
	
	func testIntervalStop() {
		// Test that Interval.stop() correctly stops the timer and sets isRunning to false
		// Indirectly tests Interval.start()
		let interval = _Interval()
		interval.start()
		interval.stop()
		
		XCTAssert(!interval.isRunning)
		XCTAssert(!interval.timer.isValid)
	}
	
	func testIntervalStopWhileStopped() {
		// Test that Interval.stop() does nothing if already stopped
		let interval = _Interval()
		interval.stop()
		
		XCTAssert(!interval.isRunning)
		XCTAssert(!interval.timer.isValid)
	}
	
	func testIntervalTimerTick() {
		// Test that Interval._timerTick() correctly counts down and ends automatically
		let interval = _Interval()
		
		// Simulating Interval.start()
		interval._startTime = Date()
		sleep(1)
		interval._timerTick()
		
		XCTAssert(interval.timeRemaining < interval.duration)
	}
	
	func testIntervalTimerTickAfterStopping() {
		// Test that Interval._timerTick() correclty works after stopping and restarting the timer
		let interval = _Interval()
		
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
	func testIntervalTimerDescriptionOneInterval() {
		// Test that IntervalTimer has proper String representation when it has one interval
		let intervalTimer = IntervalTimer(intervals: [_Interval()])
		
		XCTAssertEqual(String(describing: intervalTimer), "Interval Timer with 1 Interval")
	}
	
	func testIntervalTimerDescriptionMultipleIntervals() {
		// Test that IntervalTimer has proper String representation when empty
		let intervalTimer = IntervalTimer(intervals: [_Interval(), _Interval()])
		
		XCTAssertEqual(String(describing: intervalTimer), "Interval Timer with 2 Intervals")
	}
	
	func testIntervalTimerInitDefault() {
		// Test that IntervalTimer initializes proper default values
		let intervalTimer = IntervalTimer()
		
		XCTAssertEqual(intervalTimer.autoContinue, false)
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
		let intervalTimer = IntervalTimer(intervals: [_Interval()])
		
		XCTAssertEqual(intervalTimer.intervals.count, 1)
		XCTAssertEqual(intervalTimer.intervals[0].index, 0)
	}
	
	func testIntervalTimerInitIntervalsMultipleIntervals() {
		// Test that IntervalTimer correctly initializes with proper indexing
		let intervalList = [_Interval(), _Interval(), _Interval(), _Interval()]
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
	
	func testIntervalTimerEndTimerNotStarted() {
		// Test that IntervalTimer.endTimer() works correctly if timer has not been started
		var intervalTimer = IntervalTimer()
		intervalTimer.endTimer()
		
		XCTAssertEqual(intervalTimer.status, 3)
	}
	
	func testIntervalTimerEndTimerWhilePaused() {
		// Test that IntervalTimer.endTimer() sets each interval's remaining time to 0, sets the timer's current interval to the last one, and sets status to 3
		// Indirectly tests IntervalTimer.start() and .pause()
		var intervalTimer = IntervalTimer(intervals: [_Interval(), _Interval(), _Interval()])
		intervalTimer.start()
		intervalTimer.pause()
		intervalTimer.endTimer()
		
		for interval in intervalTimer.intervals {
			XCTAssert(!interval.isRunning)
			XCTAssertEqual(interval.timeRemaining, 0.0)
		}
		XCTAssertEqual(intervalTimer.currentInterval, intervalTimer.intervals.count - 1)
		XCTAssertEqual(intervalTimer.status, 3)
	}
	
	func testIntervalTimeEndTimerWhileRunning() {
		// Test that IntervalTimer.endTimer() stops all intervals, sets interval's remaining time to 0, and sets status to 3
		// Indirectly tests IntervalTimer.start() and .pause()
		var intervalTimer = IntervalTimer(intervals: [_Interval(), _Interval(), _Interval()])
		intervalTimer.start()
		intervalTimer.endTimer()
		
		for interval in intervalTimer.intervals {
			XCTAssert(!interval.isRunning)
			XCTAssertEqual(interval.timeRemaining, 0.0)
		}
		XCTAssertEqual(intervalTimer.currentInterval, intervalTimer.intervals.count - 1)
		XCTAssertEqual(intervalTimer.status, 3)
	}
	
	func testIntervalTimerEndTimerLastInterval() {
		// Test that IntervalTimer.endTimer() correctly ends the timer when on the last interval
		// Indirectly tests IntervalTimer.nextInterval()
		var intervalTimer = IntervalTimer(intervals: [_Interval(), _Interval(), _Interval()])
		let numIntervals: Int = intervalTimer.intervals.count
		for _ in 1...(numIntervals - 1) {
			intervalTimer.nextInterval()
		}
		XCTAssertEqual(intervalTimer.currentInterval, numIntervals - 1)
		intervalTimer.endTimer()
		
		for interval in intervalTimer.intervals {
			XCTAssert(!interval.isRunning)
			XCTAssertEqual(interval.timeRemaining, 0.0)
		}
		XCTAssertEqual(intervalTimer.status, 3)
	}
		
	func testIntervalTimerNextIntervalLastInterval() {
		// Test that IntervalTimer.nextInterval() ends the timer when on the last interval and sets the last interval's remaining time to 0
		var intervalTimer = IntervalTimer(intervals: [_Interval(), _Interval(), _Interval()])
		intervalTimer.currentInterval = 2
		intervalTimer.nextInterval()
		
		XCTAssertEqual(intervalTimer.status, 3)
		XCTAssertEqual(intervalTimer.currentInterval, 3)
		XCTAssertEqual(intervalTimer.intervals[2].timeRemaining, 0)
		XCTAssert(!intervalTimer.intervals[2].isRunning)
	}
	
	func testIntervalTimerNextIntervalNotStarted() {
		// Test that IntervalTimer.nextInterval() correctly advances the current interval when not started
		var intervalTimer = IntervalTimer(intervals: [_Interval(), _Interval(), _Interval()])
		intervalTimer.nextInterval()
		
		XCTAssertEqual(intervalTimer.status, 0)
		XCTAssertEqual(intervalTimer.currentInterval, 1)
		XCTAssertEqual(intervalTimer.intervals[0].timeRemaining, 0.0)
		XCTAssertEqual(intervalTimer.intervals[1].timeRemaining, intervalTimer.intervals[1].duration)
		XCTAssert(!intervalTimer.intervals[0].isRunning)
		XCTAssert(!intervalTimer.intervals[1].isRunning)
	}
	
	func testIntervalTimerNextIntervalPaused() {
		// Test that IntervalTimer.nextInterval() correctly advances the current interval when paused
		// Indirectly tests IntervalTimer.start() and .pause()
		var intervalTimer = IntervalTimer(intervals: [_Interval(), _Interval(), _Interval()])
		intervalTimer.start()
		intervalTimer.pause()
		intervalTimer.nextInterval()
		
		XCTAssertEqual(intervalTimer.status, 2)
		XCTAssertEqual(intervalTimer.currentInterval, 1)
		XCTAssertEqual(intervalTimer.intervals[0].timeRemaining, 0.0)
		XCTAssertEqual(intervalTimer.intervals[1].timeRemaining, intervalTimer.intervals[1].duration)
		XCTAssert(!intervalTimer.intervals[0].isRunning)
		XCTAssert(!intervalTimer.intervals[1].isRunning)
	}
	
	func testIntervalTimerNextIntervalStarted() {
		// Test that IntervalTimer.nextInterval() advances the current interval while started and sets the previous interval's remaining time to 0
		// Indirectly tests IntervalTimer.start()
		var intervalTimer = IntervalTimer(intervals: [_Interval(), _Interval(), _Interval()])
		intervalTimer.start()
		intervalTimer.nextInterval()
		
		XCTAssertEqual(intervalTimer.status, 1)
		XCTAssertEqual(intervalTimer.currentInterval, 1)
		XCTAssertEqual(intervalTimer.intervals[0].timeRemaining, 0.0)
		XCTAssert(intervalTimer.intervals[1].timer.isValid)
		XCTAssert(!intervalTimer.intervals[0].isRunning)
		XCTAssert(intervalTimer.intervals[1].isRunning)
	}
	
	func testIntervalTimerNextIntervalWhenEnded() {
		// Test that IntervalTimer.nextInterval() does nothing if the timer has ended
		// Indirectly tests IntervalTimer.endTimer()
		var intervalTimer = IntervalTimer(intervals: [_Interval(), _Interval(), _Interval()])
		intervalTimer.endTimer()
		intervalTimer.nextInterval()
		
		XCTAssertEqual(intervalTimer.status, 3)
		XCTAssertEqual(intervalTimer.currentInterval, 2)
		XCTAssertEqual(intervalTimer.intervals[2].timeRemaining, 0)
		XCTAssert(!intervalTimer.intervals[2].isRunning)
	}
		
	func testIntervalTimerPause() {
		// Test that IntervalTimer.pause() correctly pauses the timer, sets status to 2, and stops the current interval's remaining time from counting down
		// Indirectly tests IntervalTimer.start()
		var intervalTimer = IntervalTimer(intervals: [_Interval()])
		intervalTimer.start()
		intervalTimer.pause()
		
		XCTAssert(intervalTimer.status == 2)
		XCTAssertEqual(intervalTimer.currentInterval, 0)
		XCTAssert(!intervalTimer.intervals[0].isRunning)
	}
	
	func testIntervalTimerPauseNotStarted() {
		// Test that IntervalTimer.pause() does nothing if not started
		var intervalTimer = IntervalTimer(intervals: [_Interval()])
		intervalTimer.pause()
		
		XCTAssert(intervalTimer.status == 0)
		XCTAssertEqual(intervalTimer.currentInterval, 0)
		XCTAssert(!intervalTimer.intervals[0].isRunning)
	}
	
	func testIntervalTimerPauseAlreadyPaused() {
		// Test that IntervalTimer.pause() does nothing if already paused
		// Indirectly tests IntervalTimer.start()
		var intervalTimer = IntervalTimer(intervals: [_Interval()])
		intervalTimer.start()
		intervalTimer.pause()
		intervalTimer.pause()
		
		XCTAssert(intervalTimer.status == 2)
		XCTAssertEqual(intervalTimer.currentInterval, 0)
		XCTAssert(!intervalTimer.intervals[0].isRunning)
	}
	
	func testIntervalTimerReset() {
		// Test that IntervalTimer.reset() correctly resets the timer, status, interval values, and current interval
	}
	
	func testIntervalTimerResetWhenNotStarted() {
		// Test that IntervalTimer.reset() does nothing if timer is not started
	}
	
	func testIntervalTimerStart() {
		// Test that IntervalTimer.start() correctly starts the first interval and sets status to 1
		var intervalTimer = IntervalTimer(intervals: [_Interval()])
		intervalTimer.start()
		
		XCTAssertEqual(intervalTimer.status, 1)
		XCTAssertEqual(intervalTimer.currentInterval, 0)
		XCTAssert(intervalTimer.intervals[0].isRunning)
	}
	
	func testIntervalTimerStartAlreadyInProgress() {
		// Test that IntervalTimer.start() does nothing if already in progress
		var intervalTimer = IntervalTimer(intervals: [_Interval()])
		intervalTimer.start()
		intervalTimer.start()
		
		XCTAssertEqual(intervalTimer.status, 1)
		XCTAssert(intervalTimer.intervals[0].isRunning)
		XCTAssertEqual(intervalTimer.currentInterval, 0)
	}
	
	func testIntervalTimerStartNoIntervals() {
		// Test that IntervalTimer.start() does nothing if there are no intervals
		var intervalTimer = IntervalTimer()
		intervalTimer.start()
	}
	
	func testIntervalTimerGetCurrentIntervalDurationFirstInterval() {
		// Test that IntervalTimer.getCurrentIntervalDuration() returns the correct interval's duration when on the first interval
	}
	
	func testIntervalTimerGetCurrentIntervalDurationSecondInterval() {
		// Test that IntervalTimer.getCurrentIntervalDuration() returns the correct interval's duration when past the first interval and not started
		// Indirectly tests IntervalTimer.nextInterval()
	}
	
	func testIntervalTimerGetCurrentIntervalDurationWhilePlaying() {
		// Test that IntervalTimer.getCurrentIntervalDuration() returns the correct interval's duration when playing
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
