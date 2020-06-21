'From Squeak5.3 of 3 March 2020 [latest update: #19431] on 21 June 2020 at 11:34:50 am'!
Object subclass: #Promise
	instanceVariableNames: 'value resolvers mutex state error rejecters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kernel-Processes'!
!Promise commentStamp: 'tonyg 1/31/2018 23:34' prior: 0!
I represent the result of an asynchronous message.  Once the message is processed, I will be resolved to a value.  I am typically instantiated by invocations of #futureSend:at:args: (and not by #futureDo:atArgs:).

See class-comment of FutureNode.

I also implement the Promises/A+ Javascript specification. This allows you to chain my instances to perform arbitrarily complex asynchronous tasks with error handling baked in.

A Promise may be in one of three possible states: #pending, #fulfilled or #rejected. A Promise may move from #pending -> #fulfilled (by way of the resolveWith: message), or from #pending -> #rejected (by way of rejectWith:). No other state changes may occur.

Once #fulfilled or #rejected, a Promise's value must not change. In keeping with the major Javascript Promise implementations' interpretations of this, calls to resolveWith: or rejectWith: when a Promise is in #fulfilled or #rejected state are simply ignored - an error is not signalled. (See test cases PromiseTest testFirstResolutionWins, testCannotRejectFulfilledPromise and testCannotResolveaRejectedPromise.)!


!Promise methodsFor: 'private' stamp: 'fbs 5/20/2013 09:41'!
evaluateRejecter: rejecterBlock
	^ rejecterBlock cull: error.! !

!Promise methodsFor: 'private' stamp: 'fbs 5/20/2013 09:29'!
evaluateResolver: resolverBlock
	^ resolverBlock cull: value.! !


!Promise methodsFor: 'initialize' stamp: 'fbs 5/26/2013 14:19'!
initialize
	state := #pending.
	resolvers := #().
	rejecters := #().
	mutex := Mutex new.! !

!Promise methodsFor: 'initialize' stamp: 'fbs 5/20/2013 20:37'!
initializeWithIfRejected: aBlock
	self initialize.
	rejecters := {aBlock}.! !

!Promise methodsFor: 'initialize' stamp: 'fbs 5/15/2013 17:37'!
initializeWithResolvedValue: anObject
	self initialize.
	self resolveWith: anObject.! !


!Promise methodsFor: 'testing' stamp: 'tonyg 2/1/2018 09:57'!
isPromise
	^ true! !

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
			error := anObject.
			state := #rejected.
			worklist := rejecters.
			resolvers := #().
			rejecters := #().
			worklist do: [:r | self evaluateRejecter: r]]]! !

!Promise methodsFor: 'resolving' stamp: 'pre 12/17/2018 17:41'!
resolve
	
	self resolveWith: nil! !

!Promise methodsFor: 'resolving' stamp: 'tonyg 1/24/2020 15:26'!
resolveWith: arg
	"Resolve this promise. If arg is itself a Promise, make this promise depend upon it,
	as detailed in the Promises/A+ spec:
		https://promisesaplus.com/#the-promise-resolution-procedure"

	arg isPromise
		ifTrue: [
			arg whenResolved: [:v | self resolveWith: v].
			arg whenRejected: [:e | self rejectWith: e]]
		ifFalse: [
			mutex critical: [
				(state == #pending) ifTrue: [ | worklist |
					value := arg.
					state := #fulfilled.
					worklist := resolvers.
					resolvers := #().
					rejecters := #().
					worklist do: [:r | self evaluateResolver: r]]]]! !

!Promise methodsFor: 'resolving' stamp: 'tonyg 2/11/2018 15:48'!
whenRejected: aBlock
	"Evaluate aBlock when I am rejected"
	aBlock numArgs <= 1 ifFalse: [self error: 'Must be 0- or 1-argument block'].
	mutex critical: [
		(state == #pending)
			ifTrue: [rejecters := rejecters copyWith: aBlock]
			ifFalse: [self isRejected ifTrue: [self evaluateRejecter: aBlock]]].
	^ nil! !

!Promise methodsFor: 'resolving' stamp: 'tonyg 2/11/2018 15:50'!
whenResolved: aBlock
	"Evaluate aBlock when I am resolved"
	aBlock numArgs <= 1 ifFalse:[self error: 'Must be 0- or 1-argument block'].
	mutex critical: [
		(state == #pending)
			ifTrue: [resolvers := resolvers copyWith: aBlock]
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
	sema := Semaphore new.
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
	sema := Semaphore new.
	self whenResolved: [sema signal].
	self whenRejected: [sema signal].
	delay := Delay timeoutSemaphore: sema afterMSecs: msecs.
	[sema wait] ensure: [delay unschedule].
	^ self isResolved.! !

!Promise methodsFor: 'waiting' stamp: 'jcg 12/17/2009 01:11'!
waitTimeoutSeconds: seconds
	"Wait for at most the given number of seconds for this promise to resolve. Answer true if it is resolved, false otherwise."
	^self waitTimeoutMSecs: seconds*1000! !


!Promise methodsFor: 'monad' stamp: 'tonyg 1/28/2018 16:07'!
>> resolvedBlock
	"Like >>=, but discards the result of the promise."
	^ self then: [:v | resolvedBlock value]! !

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
	p := Promise new.
	self whenResolved: [:v |
		[p resolveWith: (resolvedBlock value: v)]
			on: Error do: [:e | p rejectWith: e]].
	self whenRejected: [:e | p rejectWith: (errBlock value: e)].
	^ p.! !


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


!Promise methodsFor: '*KernelTests-Processes' stamp: 'fbs 5/26/2013 14:40'!
unsynchronized
	"This is useful for tests, because it's quite easy otherwise to deadlock your image. It is a DISASTER to use this in production code!!"
	mutex := NullMutex new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Promise class
	instanceVariableNames: ''!

!Promise class methodsFor: 'instance creation' stamp: 'fbs 5/20/2013 20:37'!
ifRejected: aBlock
	^ Promise basicNew initializeWithIfRejected: aBlock.! !

!Promise class methodsFor: 'instance creation' stamp: 'fbs 5/17/2013 08:23'!
unit: anObject
	"Return a resolved Promise. #new is the other half of Promise's unit function; #new returns an unresolved Promise."
	^ Promise basicNew initializeWithResolvedValue: anObject.! !
