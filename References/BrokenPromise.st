'From Squeak5.3 of 3 March 2020 [latest update: #19431] on 21 June 2020 at 11:35:10 am'!
Error subclass: #BrokenPromise
	instanceVariableNames: 'promise'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kernel-Exceptions'!
!BrokenPromise commentStamp: 'tonyg 2/17/2017 13:53' prior: 0!
I am signalled when, during a Promise>>wait, the promise is rejected.
	promise:		the promise itself.
!


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
	promise := aPromise! !
