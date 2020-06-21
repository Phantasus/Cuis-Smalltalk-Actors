'From Squeak5.3 of 3 March 2020 [latest update: #19431] on 21 June 2020 at 11:35:37 am'!
TestCase subclass: #PromiseTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'KernelTests-Processes'!

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/23/2013 08:36'!
testAnErrorInThenRejectsPromise
	| p q |
	p := Promise new.
	q := p then: [:v | KeyNotFound signal].
	p resolveWith: 1.
	self deny: p isRejected description: 'Original Promise rejected'.
	self assert: q isRejected description: 'Broken Promise not rejected'.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/17/2013 18:26'!
testCanRejectPromise
	| p |
	p := Promise new.
	p rejectWith: Error new.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 1/29/2018 14:32'!
testCannotRejectFulfilledPromise
	| p |
	p := Promise unit: 1.
	p rejectWith: Error new.
	self assert: p isResolved.
	self assert: 1 equals: p value.
! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 1/29/2018 14:34'!
testCannotResolveaRejectedPromise
	| p e |
	p := Promise new.
	e := Error new.
	p rejectWith: e.
	p resolveWith: 1.
	self assert: p isRejected.
	self assert: p error == e.
! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 1/28/2018 16:23'!
testCollapsesChainsOfPromises
	"The monadic bind operator has signature (m a -> (a -> m b) -> m b): that is, in our setting,
	the block given to `then:` is expected to return a *Promise* of a value, not a value directly.
	It is convenient to accept non-promise values and automatically lift them into the monad,
	but we must also ensure we treat the case where a `then:`-block yields a Promise correctly."
	| p q r |
	p := Promise new.
	q := p then: [:v | Promise unit: v * 2].
	r := q then: [:v | Promise unit: v + 1].
	p resolveWith: 4.
	self assert: 4 * 2 equals: q value.
	self assert: (4 * 2 + 1) equals: r value.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 1/31/2018 23:33'!
testFirstResolutionWins
	| p |
	p := Promise new.
	p resolveWith: 1.
	p resolveWith: 2.
	self assert: p isResolved.
	self assert: p value == 1.
! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/20/2013 20:36'!
testRejectWithInvokesErrorHandlers
	| p error returnedError |
	returnedError := nil.
	error := KeyNotFound new.
	p := Promise ifRejected: [:e | returnedError := e].
	p rejectWith: error.
	self assert: returnedError notNil description: 'Error block did not run.'.
	self assert: error equals: returnedError description: 'Error not passed into block'.
	self assert: error equals: p error description: 'Promise didn''t store error'.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/23/2013 17:35'!
testThenPermitsChainingOfPromises
	| p q r |
	p := Promise new.
	q := p then: [:v | v * 2].
	r := q then: [:v | v + 1].
	p resolveWith: 4.
	self assert: 4 * 2 equals: q value.
	self assert: (4 * 2 + 1) equals: r value.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/15/2013 17:23'!
testThenReturnsaPromise
	| p |
	p := Promise new then: [:v | v * 2].
	self assert: Promise equals: p class.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/15/2013 17:12'!
testUnitReturnsaPromise
	| p |
	p := Promise unit: 1.
	self assert: Promise equals: p class.
	self assert: p isResolved.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 2/17/2017 14:04'!
testWaitForRejection
	| p |
	p := Promise new.
	[ (Delay forMilliseconds: 1) wait. p rejectWith: Error new ] fork.
	self should: [ p wait ] raise: BrokenPromise.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 2/17/2017 14:01'!
testWaitForResolution
	| p |
	p := Promise new.
	[ (Delay forMilliseconds: 1) wait. p resolveWith: #ok ] fork.
	self assert: [ p wait = #ok ]! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 2/17/2017 14:04'!
testWaitRejectionYieldsCorrectBrokenPromise
	| p |
	p := Promise new.
	[ (Delay forMilliseconds: 1) wait. p rejectWith: Error new ] fork.
	[ p wait ] on: BrokenPromise do: [ :bp | ^ self assert: [ bp promise == p ] ].
	self fail: 'Should not reach this point'! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/26/2013 14:13'!
testifRejectedDoesNotRunBlockIfPromiseResolves
	| p q error |
	error := nil.
	p := Promise new.
	q := p ifRejected: [:e | error := e].
	p resolveWith: 1.
	self deny: q isRejected.
	self assert: nil equals: error.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/26/2013 14:13'!
testifRejectedRunsBlockIfPromiseFails
	| p q error |
	error := nil.
	p := Promise new.
	q := p ifRejected: [:e | error := e].
	p rejectWith: KeyNotFound new.
	self assert: q isRejected.
	self assert: KeyNotFound equals: error class.! !


!PromiseTest methodsFor: 'tests' stamp: 'jcg 4/5/2010 00:36'!
testChainedResolvers
	| promise1 promise2 result |
	promise1 := Promise new.
	promise2 := Promise new.
	promise1 whenResolved: [:bool | promise2 resolveWith: bool not].
	promise2 whenResolved: [:bool | result := bool].
	promise1 resolveWith: false.
	self should: [result].! !

!PromiseTest methodsFor: 'tests' stamp: 'tonyg 2/13/2018 11:30'!
testFulfillWithError
	| p |
	p := Promise new.
	p fulfillWith: [ 1 / 0 ] passErrors: false.
	self assert: p isRejected.
	self assert: ZeroDivide equals: p error class.! !

!PromiseTest methodsFor: 'tests' stamp: 'tonyg 2/13/2018 16:40'!
testFulfillWithHaltAndResult
	| p |
	p := Promise new.
	[
		p fulfillWith: [ self halt. 3 + 4 ]
	] on: Halt do: [:ex | ex resume].
	self assert: p isResolved.
	self assert: 7 equals: p value.! !

!PromiseTest methodsFor: 'tests' stamp: 'tonyg 2/13/2018 11:24'!
testFulfillWithResult
	| p |
	p := Promise new.
	p fulfillWith: [ 3 + 4 ].
	self assert: p isResolved.
	self assert: 7 equals: p value.! !

!PromiseTest methodsFor: 'tests' stamp: 'jcg 4/5/2010 00:31'!
testMultipleResolvers
	| promise sum |
	sum := 0.
	promise := Promise new.
	5 timesRepeat: [
		promise whenResolved: [:val | sum := sum + val].
	].
	promise resolveWith: 5.
	self should: [sum = 25].
	! !

!PromiseTest methodsFor: 'tests' stamp: 'fbs 5/23/2013 08:28'!
testSingleResolver
	| promise sum |
	sum := 0.
	promise := Promise new.
	promise whenResolved: [:val | sum := sum + val].
	promise resolveWith: 5.
	self assert: 5 equals: sum.
	! !

!PromiseTest methodsFor: 'tests' stamp: 'tonyg 2/9/2018 11:45'!
testTimeout
	| promise |
	promise := Promise new.
	self shouldnt: [promise waitTimeoutMSecs: 1].
	self shouldnt: [promise isResolved].
	self shouldnt: [promise isRejected].
	promise resolveWith: 45.
	self should: [promise waitTimeoutMSecs: 1].
	self should: [promise isResolved].
	self shouldnt: [promise isRejected].! !

!PromiseTest methodsFor: 'tests' stamp: 'tonyg 2/9/2018 11:47'!
testTimeoutRejected
	| promise |
	promise := Promise new.
	self shouldnt: [promise waitTimeoutMSecs: 1].
	self shouldnt: [promise isResolved].
	self shouldnt: [promise isRejected].
	promise rejectWith: 45.
	self shouldnt: [promise waitTimeoutMSecs: 1].
	self shouldnt: [promise isResolved].
	self should: [promise isRejected].! !


!PromiseTest methodsFor: 'tests - future' stamp: 'tonyg 2/13/2018 15:35'!
testFutureRejectionInvisibleError
	| p |
	p := 1 future / 0.
	p whenRejected: []. "Installing a rejection handler is enough to cause the exception to be swallowed."
	self assert: (self waitUntil: [p isRejected] orCycleCount: 100).
	self assert: p isRejected.
	self assert: ZeroDivide equals: p error class.! !

!PromiseTest methodsFor: 'tests - future' stamp: 'tonyg 2/13/2018 15:34'!
testFutureRejectionVisibleError
	| p |
	p := 1 future / 0.
	[
		self assert: (self waitUntil: [p isRejected] orCycleCount: 100)
	] on: ZeroDivide do: [:ex | "Fall through." ].
	self assert: p isRejected.
	self assert: ZeroDivide equals: p error class.! !

!PromiseTest methodsFor: 'tests - future' stamp: 'tonyg 2/13/2018 11:10'!
testFutureResolution
	| p |
	p := 3 future + 4.
	self assert: (self waitUntil: [p isResolved] orCycleCount: 100).
	self assert: p isResolved.
	self assert: 7 equals: p value.! !


!PromiseTest methodsFor: 'private' stamp: 'mt 9/18/2019 11:50'!
waitUntil: aBlock orCycleCount: anInteger
	"This is a gross hack that depends on running the tests in Morphic.
	We simply repeatedly do a cycle of the interaction loop, which happens
	to also be the way that the queue of pending futures gets serviced."
	| counter |
	counter := 0.
	[
		aBlock value ifTrue: [^ true].
		Project current world doOneSubCycle.
		counter := counter + 1.
		counter >= anInteger ifTrue: [^ false].
	] repeat! !
