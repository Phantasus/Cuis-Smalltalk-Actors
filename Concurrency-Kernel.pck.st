'From Cuis 5.0 [latest update: #4191] on 25 June 2020 at 1:20:48 pm'!
'Description Contains models, datatypes for concurrency related processing. For example specialized kinds of queues and promises.

License: MIT'!
!provides: 'Concurrency-Kernel' 1 2!
SystemOrganization addCategory: #'Concurrency-Kernel'!
SystemOrganization addCategory: #'Concurrency-Kernel-Tests'!


!classDefinition: #MonitoredSharedQueue category: #'Concurrency-Kernel'!
Stream subclass: #MonitoredSharedQueue
	instanceVariableNames: 'monitor items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Concurrency-Kernel'!
!classDefinition: 'MonitoredSharedQueue class' category: #'Concurrency-Kernel'!
MonitoredSharedQueue class
	instanceVariableNames: ''!

!classDefinition: #BrokenPromise category: #'Concurrency-Kernel'!
Error subclass: #BrokenPromise
	instanceVariableNames: 'promise'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Concurrency-Kernel'!
!classDefinition: 'BrokenPromise class' category: #'Concurrency-Kernel'!
BrokenPromise class
	instanceVariableNames: ''!

!classDefinition: #PromiseTest category: #'Concurrency-Kernel-Tests'!
TestCase subclass: #PromiseTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Concurrency-Kernel-Tests'!
!classDefinition: 'PromiseTest class' category: #'Concurrency-Kernel-Tests'!
PromiseTest class
	instanceVariableNames: ''!

!classDefinition: #FutureHandler category: #'Concurrency-Kernel'!
Object subclass: #FutureHandler
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Concurrency-Kernel'!
!classDefinition: 'FutureHandler class' category: #'Concurrency-Kernel'!
FutureHandler class
	instanceVariableNames: 'defaultInstance'!

!classDefinition: #Promise category: #'Concurrency-Kernel'!
Object subclass: #Promise
	instanceVariableNames: 'value resolvers mutex state error rejecters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Concurrency-Kernel'!
!classDefinition: 'Promise class' category: #'Concurrency-Kernel'!
Promise class
	instanceVariableNames: ''!

!classDefinition: #FutureMaker category: #'Concurrency-Kernel'!
ProtoObject subclass: #FutureMaker
	instanceVariableNames: 'myTarget deltaMSecs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Concurrency-Kernel'!
!classDefinition: 'FutureMaker class' category: #'Concurrency-Kernel'!
FutureMaker class
	instanceVariableNames: ''!


!MonitoredSharedQueue commentStamp: 'ls 6/25/2005 13:48' prior: 0!
An implementation of a shared queue based on class Monitor.  Clients may may place items on the queue using nextPut: or remove them using methods like next or nextOrNil.  Items are removed in first-in first-out (FIFO) order.  It is safe for multiple threads to access the same shared queue, which is why this is a "shared" queue.

[monitor] is used to synchronize access from multiple threads.

[items] is an ordered collection holding the items that are in the queue.  New items are added  at the end, and old items are removed from the beginning.

All methods must hold the monitor while they run.
!

!BrokenPromise commentStamp: 'tonyg 2/17/2017 13:53' prior: 0!
I am signalled when, during a Promise>>wait, the promise is rejected.
	promise:		the promise itself.
!

!FutureHandler commentStamp: '<historical>' prior: 0!
Baseclass for all different kinds of handlers which objects reference to handle futures. See #findFutureHandler on objects which let them define their own lookup scheme.!

!Promise commentStamp: 'tonyg 1/31/2018 23:34' prior: 0!
I represent the result of an asynchronous message.  Once the message is processed, I will be resolved to a value.  I am typically instantiated by invocations of #futureSend:at:args: (and not by #futureDo:atArgs:).

See class-comment of FutureNode.

I also implement the Promises/A+ Javascript specification. This allows you to chain my instances to perform arbitrarily complex asynchronous tasks with error handling baked in.

A Promise may be in one of three possible states: #pending, #fulfilled or #rejected. A Promise may move from #pending -> #fulfilled (by way of the resolveWith: message), or from #pending -> #rejected (by way of rejectWith:). No other state changes may occur.

Once #fulfilled or #rejected, a Promise's value must not change. In keeping with the major Javascript Promise implementations' interpretations of this, calls to resolveWith: or rejectWith: when a Promise is in #fulfilled or #rejected state are simply ignored - an error is not signalled. (See test cases PromiseTest testFirstResolutionWins, testCannotRejectFulfilledPromise and testCannotResolveaRejectedPromise.)!

!FutureMaker commentStamp: 'jcg 12/17/2009 23:24' prior: 0!
Uses #doesNotUnderstand: to transform messages into future messages.  In practice, this class is never used; for efficiency, the Compiler has been modified to use FutureNode to transform code at compile-time to directly send #futureSend:at:args:.  However, this is simply an optimization... the semantics are unchanged.!

!MonitoredSharedQueue methodsFor: 'printing' stamp: 'ls 6/25/2005 13:56'!
printOn: aStream
	monitor critical: [
		aStream 
			nextPutAll: self class name;
			nextPutAll: ' with ';
			print: items size;
		 	nextPutAll: ' items' ].! !

!MonitoredSharedQueue methodsFor: 'copying' stamp: 'nice 10/5/2009 19:07'!
postCopy
	super postCopy.
	monitor critical:
		[items _ items copy.
		monitor _ Monitor new]! !

!Promise methodsFor: 'monad' stamp: 'tonyg 1/28/2018 16:07'!
>> resolvedBlock
	"Like >>=, but discards the result of the promise."
	^ self then: [:v | resolvedBlock value]! !

!Promise methodsFor: 'printing' stamp: 'fbs 5/20/2013 20:42'!
printOn: aStream
	aStream nextPutAll: 'a Promise'.
	self isResolved ifTrue: [
		aStream
			nextPutAll: '(resolved: ';
			nextPutAll: value printString;
			nextPutAll: ')'].
	self isRejected ifTrue: [
		aStream
			nextPutAll: '(rejected: ';
			nextPutAll: error printString;
			nextPutAll: ')'].! !

!FutureMaker methodsFor: 'printing' stamp: 'das 9/7/2005 10:10'!
printOn: aStream
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	| title |
	title _ self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title! !

!MonitoredSharedQueue methodsFor: 'accessing' stamp: 'jpb 6/25/2020 11:53:36'!
flush
	self deprecatedMethod. "use removeAll".
	
	^self removeAll! !

!MonitoredSharedQueue methodsFor: 'accessing' stamp: 'jpb 6/25/2020 11:53:44'!
flushAllSuchThat: aBlock
	self deprecatedMethod. "use removeAllSuchThat".

	^self removeAllSuchThat: aBlock! !

!MonitoredSharedQueue methodsFor: 'accessing' stamp: 'ul 10/15/2010 08:24'!
next

	^monitor critical: [
		monitor waitWhile: [ items isEmpty ].
		items removeFirst ]
! !

!MonitoredSharedQueue methodsFor: 'accessing' stamp: 'ls 6/25/2005 14:00'!
nextOrNil
	^monitor critical: [
		items isEmpty ifTrue: [ nil ] ifFalse: [ items removeFirst ] ]! !

!MonitoredSharedQueue methodsFor: 'accessing' stamp: 'nice 12/26/2009 21:34'!
nextOrNilSuchThat: aBlock
	"Answer the next object that satisfies aBlock, skipping any intermediate objects.
	If no such object has been queued, answer <nil> and leave me intact."

	^monitor critical: [
		| index |
		index _ items findFirst: aBlock.
		index = 0 ifTrue: [
			nil ]
		ifFalse: [
			items removeAt: index ] ].
! !

!MonitoredSharedQueue methodsFor: 'accessing' stamp: 'ul 10/15/2010 08:23'!
nextPut: item

	monitor critical: [
		items addLast: item.
		monitor signal.  ].
	^item! !

!MonitoredSharedQueue methodsFor: 'accessing' stamp: 'ls 6/25/2005 14:00'!
peek
	"Answer the object that was sent through the receiver first and has not 
	yet been received by anyone but do not remove it from the receiver. If 
	no object has been sent, return nil"
	^monitor critical: [
		items isEmpty ifTrue: [ nil ] ifFalse: [ items first ] ]
! !

!MonitoredSharedQueue methodsFor: 'accessing' stamp: 'ul 10/15/2010 08:23'!
removeAll
	monitor critical: [
		items removeAll ].! !

!MonitoredSharedQueue methodsFor: 'accessing' stamp: 'ls 6/25/2005 14:01'!
removeAllSuchThat: aBlock
	"Remove from the queue all objects that satisfy aBlock."
	monitor critical: [
		items removeAllSuchThat: aBlock ]! !

!MonitoredSharedQueue methodsFor: 'initializing' stamp: 'ls 6/25/2005 13:48'!
initialize
	monitor _ Monitor new.
	items _ OrderedCollection new.
! !

!MonitoredSharedQueue methodsFor: 'size' stamp: 'ls 6/25/2005 14:03'!
isEmpty
	^monitor critical: [ items isEmpty ]! !

!MonitoredSharedQueue methodsFor: 'size' stamp: 'ls 6/25/2005 14:04'!
size
	^monitor critical: [ items size ]! !

!MonitoredSharedQueue class methodsFor: 'instance creation' stamp: 'ls 6/25/2005 13:53'!
new
	^self basicNew initialize! !

!BrokenPromise methodsFor: 'as yet unclassified' stamp: 'tonyg 2/17/2017 13:52'!
defaultAction
	self messageText: 'Promise was rejected'.
	^super defaultAction! !

!BrokenPromise methodsFor: 'as yet unclassified' stamp: 'tonyg 2/17/2017 13:52'!
isResumable
	^ true! !

!BrokenPromise methodsFor: 'as yet unclassified' stamp: 'tonyg 2/17/2017 13:51'!
promise
	^ promise! !

!BrokenPromise methodsFor: 'as yet unclassified' stamp: 'tonyg 2/17/2017 13:51'!
promise: aPromise
	promise _ aPromise! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/23/2013 08:36'!
testAnErrorInThenRejectsPromise
	| p q |
	p _ Promise new.
	q _ p then: [:v | KeyNotFound signal].
	p resolveWith: 1.
	self deny: p isRejected description: 'Original Promise rejected'.
	self assert: q isRejected description: 'Broken Promise not rejected'.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/17/2013 18:26'!
testCanRejectPromise
	| p |
	p _ Promise new.
	p rejectWith: Error new.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 1/29/2018 14:32'!
testCannotRejectFulfilledPromise
	| p |
	p _ Promise unit: 1.
	p rejectWith: Error new.
	self assert: p isResolved.
	self assert: 1 equals: p value.
! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 1/29/2018 14:34'!
testCannotResolveaRejectedPromise
	| p e |
	p _ Promise new.
	e _ Error new.
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
	p _ Promise new.
	q _ p then: [:v | Promise unit: v * 2].
	r _ q then: [:v | Promise unit: v + 1].
	p resolveWith: 4.
	self assert: 4 * 2 equals: q value.
	self assert: (4 * 2 + 1) equals: r value.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 1/31/2018 23:33'!
testFirstResolutionWins
	| p |
	p _ Promise new.
	p resolveWith: 1.
	p resolveWith: 2.
	self assert: p isResolved.
	self assert: p value == 1.
! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'jpb 6/21/2020 13:51:15'!
testRejectWithInvokesErrorHandlers
	| p error returnedError |
	returnedError _ nil.
	error _ Error new.
	p _ Promise ifRejected: [:e | returnedError _ e].
	p rejectWith: error.
	
	self assert: returnedError notNil description: 'Error block did not run.'.
	self assert: error equals: returnedError.
	self assert: error equals: p error.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/23/2013 17:35'!
testThenPermitsChainingOfPromises
	| p q r |
	p _ Promise new.
	q _ p then: [:v | v * 2].
	r _ q then: [:v | v + 1].
	p resolveWith: 4.
	self assert: 4 * 2 equals: q value.
	self assert: (4 * 2 + 1) equals: r value.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/15/2013 17:23'!
testThenReturnsaPromise
	| p |
	p _ Promise new then: [:v | v * 2].
	self assert: Promise equals: p class.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/15/2013 17:12'!
testUnitReturnsaPromise
	| p |
	p _ Promise unit: 1.
	self assert: Promise equals: p class.
	self assert: p isResolved.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 2/17/2017 14:04'!
testWaitForRejection
	| p |
	p _ Promise new.
	[ (Delay forMilliseconds: 1) wait. p rejectWith: Error new ] fork.
	self should: [ p wait ] raise: BrokenPromise.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 2/17/2017 14:01'!
testWaitForResolution
	| p |
	p _ Promise new.
	[ (Delay forMilliseconds: 1) wait. p resolveWith: #ok ] fork.
	self assert: [ p wait = #ok ]! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'tonyg 2/17/2017 14:04'!
testWaitRejectionYieldsCorrectBrokenPromise
	| p |
	p _ Promise new.
	[ (Delay forMilliseconds: 1) wait. p rejectWith: Error new ] fork.
	[ p wait ] on: BrokenPromise do: [ :bp | ^ self assert: [ bp promise == p ] ].
	self fail: 'Should not reach this point'! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'fbs 5/26/2013 14:13'!
testifRejectedDoesNotRunBlockIfPromiseResolves
	| p q error |
	error _ nil.
	p _ Promise new.
	q _ p ifRejected: [:e | error _ e].
	p resolveWith: 1.
	self deny: q isRejected.
	self assert: nil equals: error.! !

!PromiseTest methodsFor: 'tests - monad' stamp: 'jpb 6/21/2020 13:50:33'!
testifRejectedRunsBlockIfPromiseFails
	| p q error |
	error _ nil.
	p _ Promise new.
	q _ p ifRejected: [:e | error _ e].
	p rejectWith: Error new.
	self assert: q isRejected.
	self assert: Error equals: error class.! !

!PromiseTest methodsFor: 'tests' stamp: 'jcg 4/5/2010 00:36'!
testChainedResolvers
	| promise1 promise2 result |
	promise1 _ Promise new.
	promise2 _ Promise new.
	promise1 whenResolved: [:bool | promise2 resolveWith: bool not].
	promise2 whenResolved: [:bool | result _ bool].
	promise1 resolveWith: false.
	self should: [result].! !

!PromiseTest methodsFor: 'tests' stamp: 'tonyg 2/13/2018 11:30'!
testFulfillWithError
	| p |
	p _ Promise new.
	p fulfillWith: [ 1 / 0 ] passErrors: false.
	self assert: p isRejected.
	self assert: ZeroDivide equals: p error class.! !

!PromiseTest methodsFor: 'tests' stamp: 'tonyg 2/13/2018 16:40'!
testFulfillWithHaltAndResult
	| p |
	p _ Promise new.
	[
		p fulfillWith: [ self halt. 3 + 4 ]
	] on: Halt do: [:ex | ex resume].
	self assert: p isResolved.
	self assert: 7 equals: p value.! !

!PromiseTest methodsFor: 'tests' stamp: 'tonyg 2/13/2018 11:24'!
testFulfillWithResult
	| p |
	p _ Promise new.
	p fulfillWith: [ 3 + 4 ].
	self assert: p isResolved.
	self assert: 7 equals: p value.! !

!PromiseTest methodsFor: 'tests' stamp: 'jcg 4/5/2010 00:31'!
testMultipleResolvers
	| promise sum |
	sum _ 0.
	promise _ Promise new.
	5 timesRepeat: [
		promise whenResolved: [:val | sum _ sum + val].
	].
	promise resolveWith: 5.
	self should: [sum = 25].
	! !

!PromiseTest methodsFor: 'tests' stamp: 'fbs 5/23/2013 08:28'!
testSingleResolver
	| promise sum |
	sum _ 0.
	promise _ Promise new.
	promise whenResolved: [:val | sum _ sum + val].
	promise resolveWith: 5.
	self assert: 5 equals: sum.
	! !

!PromiseTest methodsFor: 'tests' stamp: 'tonyg 2/9/2018 11:45'!
testTimeout
	| promise |
	promise _ Promise new.
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
	promise _ Promise new.
	self shouldnt: [promise waitTimeoutMSecs: 1].
	self shouldnt: [promise isResolved].
	self shouldnt: [promise isRejected].
	promise rejectWith: 45.
	self shouldnt: [promise waitTimeoutMSecs: 1].
	self shouldnt: [promise isResolved].
	self should: [promise isRejected].! !

!PromiseTest methodsFor: 'tests - future' stamp: 'jpb 6/25/2020 13:07:20'!
testFutureRejectionInvisibleError
	| p |
	p _ 1 future / 0.
	p whenRejected: []. "Installing a rejection handler is enough to cause the exception to be swallowed."
	self assert: (self waitUntil: [p isRejected] orCycleCount: 1000).
	self assert: p isRejected.
	self assert: ZeroDivide equals: p error class.! !

!PromiseTest methodsFor: 'tests - future' stamp: 'jpb 6/25/2020 13:04:42'!
testFutureRejectionVisibleError
	| p |
	p _ 1 future / 0.
	[
		self assert: (self waitUntil: [p isRejected] orCycleCount: 100)
	] on: ZeroDivide do: [:ex | "Fall through." ].

	self assert: p isRejected.
	self assert: ZeroDivide equals: p error class.! !

!PromiseTest methodsFor: 'tests - future' stamp: 'tonyg 2/13/2018 11:10'!
testFutureResolution
	| p |
	p _ 3 future + 4.
	self assert: (self waitUntil: [p isResolved] orCycleCount: 100).
	self assert: p isResolved.
	self assert: 7 equals: p value.! !

!PromiseTest methodsFor: 'private' stamp: 'jpb 6/25/2020 13:19:06'!
waitUntil: aBlock orCycleCount: anInteger
	"This is a gross hack that depends on running the tests in Morphic.
	We simply repeatedly do a cycle of the interaction loop, which happens
	to also be the way that the queue of pending futures gets serviced."
	| counter |
	counter _ 0.
	[
		aBlock value ifTrue: [^ true].
		UISupervisor ui doOneCycle.
		counter _ counter + 1.
		counter >= anInteger ifTrue: [^ false]
	] repeat! !

!FutureHandler methodsFor: 'future callbacks' stamp: 'jpb 6/25/2020 13:02:14'!
future: receiver send: aSelector at: deltaMSecs args: args
	"Send a message deltaSeconds into the future.  Answers a Promise that will be resolved at some time in the future."
	| newPromise closure |
	newPromise _ Promise new.
	closure _ [newPromise fulfillWith: [receiver perform: aSelector withArguments: args]].
	
	deltaMSecs = 0
		ifTrue: [ UISupervisor whenUIinSafeState: closure ]
		ifFalse: [
			[	(Delay forMilliseconds: deltaMSecs) wait.
				self addDeferredUIMessage: 
					closure
			] forkAt: Processor userSchedulingPriority + 1.
		].
	
	^newPromise! !

!FutureHandler class methodsFor: 'as yet unclassified' stamp: 'jpb 6/25/2020 12:53:17'!
default
	"Returns a default instance used for handling future callbacks"
	defaultInstance ifNil: [ defaultInstance _ self new ].
	^defaultInstance! !

!Promise methodsFor: 'monad' stamp: 'tonyg 1/28/2018 15:54'!
>>= resolvedBlock
	"Alias for `then:` allowing convenient chaining."
	^ self then: resolvedBlock! !

!Promise methodsFor: 'monad' stamp: 'fbs 5/26/2013 14:17'!
ifRejected: errBlock
	^ self then: [:ignored | "Do nothing"] ifRejected: errBlock.! !

!Promise methodsFor: 'monad' stamp: 'tonyg 1/29/2018 14:12'!
then: resolvedBlock
	^ self then: resolvedBlock ifRejected: [:e | "Pass rejection reason along" e].! !

!Promise methodsFor: 'monad' stamp: 'fbs 5/23/2013 20:26'!
then: resolvedBlock ifRejected: errBlock
	"Return a Promise that, if it resolves, runs the resolvedBlock. If resolution throws an Exception, it runs the errBlock."
	| p |
	p _ Promise new.
	self whenResolved: [:v |
		[p resolveWith: (resolvedBlock value: v)]
			on: Error do: [:e | p rejectWith: e]].
	self whenRejected: [:e | p rejectWith: (errBlock value: e)].
	^ p.! !

!Promise methodsFor: 'private' stamp: 'jpb 6/21/2020 13:26:19'!
evaluateRejecter: rejecterBlock
	rejecterBlock numArgs >= 1 ifTrue: [ ^rejecterBlock value: error ].
	
	^rejecterBlock value! !

!Promise methodsFor: 'private' stamp: 'jpb 6/21/2020 13:25:59'!
evaluateResolver: resolverBlock
	resolverBlock numArgs >= 1 ifTrue: [ ^resolverBlock value: value ].
	
	^resolverBlock value! !

!Promise methodsFor: 'initialize' stamp: 'fbs 5/26/2013 14:19'!
initialize
	state _ #pending.
	resolvers _ #().
	rejecters _ #().
	mutex _ Mutex new.! !

!Promise methodsFor: 'initialize' stamp: 'fbs 5/20/2013 20:37'!
initializeWithIfRejected: aBlock
	self initialize.
	rejecters _ {aBlock}.! !

!Promise methodsFor: 'initialize' stamp: 'fbs 5/15/2013 17:37'!
initializeWithResolvedValue: anObject
	self initialize.
	self resolveWith: anObject.! !

!Promise methodsFor: 'testing' stamp: 'jpb 6/21/2020 13:24:19'!
is: aSymbol
	^(#Promise = aSymbol) or: [super is: aSymbol ] ! !

!Promise methodsFor: 'testing' stamp: 'fbs 5/20/2013 09:32'!
isRejected
	^ state == #rejected.! !

!Promise methodsFor: 'testing' stamp: 'fbs 5/17/2013 18:33'!
isResolved
	^ state == #fulfilled.! !

!Promise methodsFor: 'resolving' stamp: 'tonyg 2/13/2018 15:35'!
fulfillWith: aBlock
	self fulfillWith: aBlock passErrors: rejecters isEmpty! !

!Promise methodsFor: 'resolving' stamp: 'tonyg 2/13/2018 16:41'!
fulfillWith: aBlock passErrors: aBoolean
	"Evaluate aBlock. If it signals an exception, reject this promise with the exception
	as the argument; if it returns a value [or another Promise], resolve this promise
	with the result.
	
	If aBoolean is true, and an exception is signaled, it is passed out to the caller.
	If aBoolean is false, signaled exceptions are considered handled after the promise
	has been rejected."
	[ self resolveWith: aBlock value ]
		on: Exception
		do: [ :ex |
			(ex isKindOf: Halt)
				ifTrue: [ex pass]
				ifFalse: [
					self rejectWith: ex.
					aBoolean ifTrue: [ ex pass ] ]]! !

!Promise methodsFor: 'resolving' stamp: 'pre 12/17/2018 17:42'!
reject

	self rejectWith: nil! !

!Promise methodsFor: 'resolving' stamp: 'tonyg 2/11/2018 15:44'!
rejectWith: anObject
	"Reject this promise."
	mutex critical: [
		(state == #pending) ifTrue: [ | worklist |
			error _ anObject.
			state _ #rejected.
			worklist _ rejecters.
			resolvers _ #().
			rejecters _ #().
			worklist do: [:r | self evaluateRejecter: r]]]! !

!Promise methodsFor: 'resolving' stamp: 'pre 12/17/2018 17:41'!
resolve
	
	self resolveWith: nil! !

!Promise methodsFor: 'resolving' stamp: 'jpb 6/21/2020 13:23:31'!
resolveWith: arg
	"Resolve this promise. If arg is itself a Promise, make this promise depend upon it,
	as detailed in the Promises/A+ spec:
		https://promisesaplus.com/#the-promise-resolution-procedure"

	(arg is: #Promise)
		ifTrue: [
			arg whenResolved: [:v | self resolveWith: v].
			arg whenRejected: [:e | self rejectWith: e]]
		ifFalse: [
			mutex critical: [
				(state == #pending) ifTrue: [ | worklist |
					value _ arg.
					state _ #fulfilled.
					worklist _ resolvers.
					resolvers _ #().
					rejecters _ #().
					worklist do: [:r | self evaluateResolver: r]]]]! !

!Promise methodsFor: 'resolving' stamp: 'tonyg 2/11/2018 15:48'!
whenRejected: aBlock
	"Evaluate aBlock when I am rejected"
	aBlock numArgs <= 1 ifFalse: [self error: 'Must be 0- or 1-argument block'].
	mutex critical: [
		(state == #pending)
			ifTrue: [rejecters _ rejecters copyWith: aBlock]
			ifFalse: [self isRejected ifTrue: [self evaluateRejecter: aBlock]]].
	^ nil! !

!Promise methodsFor: 'resolving' stamp: 'tonyg 2/11/2018 15:50'!
whenResolved: aBlock
	"Evaluate aBlock when I am resolved"
	aBlock numArgs <= 1 ifFalse:[self error: 'Must be 0- or 1-argument block'].
	mutex critical: [
		(state == #pending)
			ifTrue: [resolvers _ resolvers copyWith: aBlock]
			ifFalse: [self isResolved ifTrue: [self evaluateResolver: aBlock]]].
	^ nil! !

!Promise methodsFor: 'accessing' stamp: 'fbs 5/17/2013 18:42'!
error
	^ error.! !

!Promise methodsFor: 'accessing' stamp: 'jcg 12/17/2009 01:03'!
value
	^value! !

!Promise methodsFor: 'waiting' stamp: 'tonyg 2/17/2017 13:55'!
wait
	"Wait unconditionally for this promise to become fulfilled or rejected."
	| sema |
	sema _ Semaphore new.
	self whenResolved:[sema signal].
	self whenRejected:[sema signal].
	sema wait.
	^ self isResolved
		ifTrue: [ value ]
		ifFalse: [ BrokenPromise new promise: self; signal ]! !

!Promise methodsFor: 'waiting' stamp: 'tonyg 2/9/2018 11:49'!
waitTimeoutMSecs: msecs
	"Wait for at most the given number of milliseconds for this promise to settle.
	Answer true if it is resolved, false otherwise. False can therefore mean EITHER 'timeout' OR 'rejected'."
	| sema delay |
	sema _ Semaphore new.
	self whenResolved: [sema signal].
	self whenRejected: [sema signal].
	delay _ Delay timeoutSemaphore: sema afterMSecs: msecs.
	[sema wait] ensure: [delay unschedule].
	^ self isResolved.! !

!Promise methodsFor: 'waiting' stamp: 'jcg 12/17/2009 01:11'!
waitTimeoutSeconds: seconds
	"Wait for at most the given number of seconds for this promise to resolve. Answer true if it is resolved, false otherwise."
	^self waitTimeoutMSecs: seconds*1000! !

!Promise class methodsFor: 'instance creation' stamp: 'fbs 5/20/2013 20:37'!
ifRejected: aBlock
	^ Promise basicNew initializeWithIfRejected: aBlock.! !

!Promise class methodsFor: 'instance creation' stamp: 'fbs 5/17/2013 08:23'!
unit: anObject
	"Return a resolved Promise. #new is the other half of Promise's unit function; #new returns an unresolved Promise."
	^ Promise basicNew initializeWithResolvedValue: anObject.! !

!FutureMaker methodsFor: 'printing' stamp: 'das 9/7/2005 10:10'!
printString
	"Answer a String whose characters are a description of the receiver. 
	If you want to print without a character limit, use fullPrintString."
	^ self printStringLimitedTo: 50000! !

!FutureMaker methodsFor: 'printing' stamp: 'das 9/7/2005 10:10'!
printStringLimitedTo: limit
	"Answer a String whose characters are a description of the receiver.
	If you want to print without a character limit, use fullPrintString."
	| limitedString |
	limitedString _ String streamContents: [:s | self printOn: s] limitedTo: limit.
	limitedString size < limit ifTrue: [^ limitedString].
	^ limitedString , '...etc...'! !

!FutureMaker methodsFor: 'comparing' stamp: 'das 9/7/2005 10:10'!
= anObject
	^self == anObject! !

!FutureMaker methodsFor: 'comparing' stamp: 'nice 12/24/2009 03:01'!
hash
	^self scaledIdentityHash! !

!FutureMaker methodsFor: 'accessing' stamp: 'das 9/7/2005 10:08'!
basicAt: index 
	"Primitive. Assumes receiver is indexable. Answer the value of an 
	indexable element in the receiver. Fail if the argument index is not an 
	Integer or is out of bounds. Essential. Do not override in a subclass. See 
	Object documentation whatIsAPrimitive."

	<primitive: 60>
	index isInteger ifTrue: [self errorSubscriptBounds: index].
	index isNumber
		ifTrue: [^self basicAt: index asInteger]
		ifFalse: [self errorNonIntegerIndex]! !

!FutureMaker methodsFor: 'accessing' stamp: 'das 9/7/2005 10:09'!
basicAt: index put: value 
	"Primitive. Assumes receiver is indexable. Store the second argument 
	value in the indexable element of the receiver indicated by index. Fail 
	if the index is not an Integer or is out of bounds. Or fail if the value is 
	not of the right type for this kind of collection. Answer the value that 
	was stored. Essential. Do not override in a subclass. See Object 
	documentation whatIsAPrimitive."

	<primitive: 61>
	index isInteger
		ifTrue: [(index >= 1 and: [index <= self size])
					ifTrue: [self errorImproperStore]
					ifFalse: [self errorSubscriptBounds: index]].
	index isNumber
		ifTrue: [^self basicAt: index asInteger put: value]
		ifFalse: [self errorNonIntegerIndex]! !

!FutureMaker methodsFor: 'accessing' stamp: 'das 9/7/2005 10:10'!
basicSize
	"Primitive. Answer the number of indexable variables in the receiver. 
	This value is the same as the largest legal subscript. Essential. Do not 
	override in any subclass. See Object documentation whatIsAPrimitive."

	<primitive: 62>
	"The number of indexable fields of fixed-length objects is 0"
	^0! !

!FutureMaker methodsFor: 'accessing' stamp: 'jcg 12/17/2009 23:20'!
doesNotUnderstand: aMessage
	"Package up the message and send it"
	^myTarget futureSend: aMessage selector at: deltaMSecs args: aMessage arguments! !

!FutureMaker methodsFor: 'accessing' stamp: 'eem 2/22/2019 16:27'!
instVarAt: index 
	"Primitive. Answer a fixed variable in an object. The numbering of the 
	variables corresponds to the named instance variables. Fail if the index 
	is not an Integer or is not the index of a fixed variable. Essential. See 
	Object documentation whatIsAPrimitive."

	<primitive: 173 error: ec>
	self primitiveFailed! !

!FutureMaker methodsFor: 'accessing' stamp: 'eem 2/22/2019 16:27'!
instVarAt: anInteger put: anObject 
	"Primitive. Store a value into a fixed variable in the receiver. The 
	numbering of the variables corresponds to the named instance variables. 
	Fail if the index is not an Integer or is not the index of a fixed variable. 
	Answer the value stored as the result. Using this message violates the 
	principle that each object has sovereign control over the storing of 
	values into its instance variables. Essential. See Object documentation 
	whatIsAPrimitive."

	<primitive: 174 error: ec>
	self primitiveFailed! !

!FutureMaker methodsFor: 'accessing' stamp: 'das 9/7/2005 10:09'!
isKindOf: aClass 
	"--- needed for debugging ---"
	self class == aClass
		ifTrue: [^true]
		ifFalse: [^self class inheritsFrom: aClass]! !

!FutureMaker methodsFor: 'accessing' stamp: 'das 9/7/2005 10:09'!
isMemberOf: aClass 
	"Answer whether the receiver is an instance of the class, aClass."
	^self class == aClass! !

!FutureMaker methodsFor: 'testing' stamp: 'das 9/7/2005 10:09'!
isText
	^false! !

!FutureMaker methodsFor: 'private' stamp: 'jcg 12/17/2009 23:20'!
setDeltaMSecs: delta target: futureTarget
	deltaMSecs _ delta.
	myTarget _ futureTarget.! !

!FutureMaker methodsFor: 'private' stamp: 'das 9/6/2005 12:29'!
setTarget: aTarget
	myTarget _ aTarget.! !

!Object methodsFor: '*Concurrency-Kernel' stamp: 'jpb 6/25/2020 12:50:58'!
findFutureHandler
	"Returns a future handler by some object defined lookup logic"
	 ^FutureHandler default! !

!Object methodsFor: '*Concurrency-Kernel' stamp: 'jpb 6/25/2020 12:43:01'!
future
	"See FutureMaker class comment."
	^(FutureMaker new) 
		setDeltaMSecs: 0.0 target: self! !

!Object methodsFor: '*Concurrency-Kernel' stamp: 'jpb 6/25/2020 12:50:29'!
futureSend: aSelector at: deltaMSecs args: args
	"Send a message deltaSeconds into the future (some implementations may requires 'deltaMSecs' to be zero).  Answers a Promise that will be resolved at some time in the future.  See comment in class FutureNode."
	^self findFutureHandler future: self send: aSelector at: deltaMSecs args: args.! !
