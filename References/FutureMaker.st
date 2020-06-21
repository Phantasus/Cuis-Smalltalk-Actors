'From Squeak5.3 of 3 March 2020 [latest update: #19431] on 21 June 2020 at 1:30:31 pm'!
ProtoObject subclass: #FutureMaker
	instanceVariableNames: 'myTarget deltaMSecs'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kernel-Processes'!
!FutureMaker commentStamp: 'jcg 12/17/2009 23:24' prior: 0!
Uses #doesNotUnderstand: to transform messages into future messages.  In practice, this class is never used; for efficiency, the Compiler has been modified to use FutureNode to transform code at compile-time to directly send #futureSend:at:args:.  However, this is simply an optimization... the semantics are unchanged.!


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


!FutureMaker methodsFor: 'printing' stamp: 'das 9/7/2005 10:10'!
printOn: aStream
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	| title |
	title := self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title! !

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
	limitedString := String streamContents: [:s | self printOn: s] limitedTo: limit.
	limitedString size < limit ifTrue: [^ limitedString].
	^ limitedString , '...etc...'! !


!FutureMaker methodsFor: 'private' stamp: 'jcg 12/17/2009 23:20'!
setDeltaMSecs: delta target: futureTarget
	deltaMSecs := delta.
	myTarget := futureTarget.! !

!FutureMaker methodsFor: 'private' stamp: 'das 9/6/2005 12:29'!
setTarget: aTarget
	myTarget := aTarget.! !


!FutureMaker methodsFor: '*Tools-inspecting' stamp: 'das 9/7/2005 10:09'!
defaultLabelForInspector
	"Answer the default label to be used for an Inspector window on the receiver."
	^self class name! !

!FutureMaker methodsFor: '*Tools-inspecting' stamp: 'das 9/7/2005 10:09'!
inspectorClass
	"Answer the class of the inspector to be used on the receiver.  Called by inspect; 
	use basicInspect to get a normal (less useful) type of inspector."

	^ Inspector! !
