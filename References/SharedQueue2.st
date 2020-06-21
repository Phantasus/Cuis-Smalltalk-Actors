'From Squeak5.3 of 3 March 2020 [latest update: #19431] on 21 June 2020 at 11:33:52 am'!
Stream subclass: #SharedQueue2
	instanceVariableNames: 'monitor items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Collections-Sequenceable'!
!SharedQueue2 commentStamp: 'ls 6/25/2005 13:48' prior: 0!
An implementation of a shared queue based on class Monitor.  Clients may may place items on the queue using nextPut: or remove them using methods like next or nextOrNil.  Items are removed in first-in first-out (FIFO) order.  It is safe for multiple threads to access the same shared queue, which is why this is a "shared" queue.

[monitor] is used to synchronize access from multiple threads.

[items] is an ordered collection holding the items that are in the queue.  New items are added  at the end, and old items are removed from the beginning.

All methods must hold the monitor while they run.
!


!SharedQueue2 methodsFor: 'accessing' stamp: 'ls 6/25/2005 14:07'!
flush
	self deprecated: 'use removeAll'.
	^self removeAll! !

!SharedQueue2 methodsFor: 'accessing' stamp: 'ls 6/25/2005 14:02'!
flushAllSuchThat: aBlock
	self deprecated: 'use removeAllSuchThat:'.

	^self removeAllSuchThat: aBlock! !

!SharedQueue2 methodsFor: 'accessing' stamp: 'ul 10/15/2010 08:24'!
next

	^monitor critical: [
		monitor waitWhile: [ items isEmpty ].
		items removeFirst ]
! !

!SharedQueue2 methodsFor: 'accessing' stamp: 'ls 6/25/2005 14:00'!
nextOrNil
	^monitor critical: [
		items isEmpty ifTrue: [ nil ] ifFalse: [ items removeFirst ] ]! !

!SharedQueue2 methodsFor: 'accessing' stamp: 'nice 12/26/2009 21:34'!
nextOrNilSuchThat: aBlock
	"Answer the next object that satisfies aBlock, skipping any intermediate objects.
	If no such object has been queued, answer <nil> and leave me intact."

	^monitor critical: [
		| index |
		index := items findFirst: aBlock.
		index = 0 ifTrue: [
			nil ]
		ifFalse: [
			items removeAt: index ] ].
! !

!SharedQueue2 methodsFor: 'accessing' stamp: 'ul 10/15/2010 08:23'!
nextPut: item

	monitor critical: [
		items addLast: item.
		monitor signal.  ].
	^item! !

!SharedQueue2 methodsFor: 'accessing' stamp: 'ls 6/25/2005 14:00'!
peek
	"Answer the object that was sent through the receiver first and has not 
	yet been received by anyone but do not remove it from the receiver. If 
	no object has been sent, return nil"
	^monitor critical: [
		items isEmpty ifTrue: [ nil ] ifFalse: [ items first ] ]
! !

!SharedQueue2 methodsFor: 'accessing' stamp: 'ul 10/15/2010 08:23'!
removeAll
	monitor critical: [
		items removeAll ].! !

!SharedQueue2 methodsFor: 'accessing' stamp: 'ls 6/25/2005 14:01'!
removeAllSuchThat: aBlock
	"Remove from the queue all objects that satisfy aBlock."
	monitor critical: [
		items removeAllSuchThat: aBlock ]! !


!SharedQueue2 methodsFor: 'initializing' stamp: 'ls 6/25/2005 13:48'!
initialize
	monitor := Monitor new.
	items := OrderedCollection new.
! !


!SharedQueue2 methodsFor: 'printing' stamp: 'ls 6/25/2005 13:56'!
printOn: aStream
	monitor critical: [
		aStream 
			nextPutAll: self class name;
			nextPutAll: ' with ';
			print: items size;
		 	nextPutAll: ' items' ].! !


!SharedQueue2 methodsFor: 'size' stamp: 'ls 6/25/2005 14:03'!
isEmpty
	^monitor critical: [ items isEmpty ]! !

!SharedQueue2 methodsFor: 'size' stamp: 'ls 6/25/2005 14:04'!
size
	^monitor critical: [ items size ]! !


!SharedQueue2 methodsFor: 'copying' stamp: 'nice 10/5/2009 19:07'!
postCopy
	super postCopy.
	monitor critical:
		[items := items copy.
		monitor := Monitor new]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

SharedQueue2 class
	instanceVariableNames: ''!

!SharedQueue2 class methodsFor: 'instance creation' stamp: 'ls 6/25/2005 13:53'!
new
	^self basicNew initialize! !
