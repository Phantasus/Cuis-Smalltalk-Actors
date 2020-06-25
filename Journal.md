# Introduction

This file represents a journal for the `Cuis-Actors` project,
it's a port of the `Squeak-Actors` project, with refactorings
and changed designs here and there. The purpose of this document
is to record thoughts, opinions, feelings, etc. which were made
for this project, so that, whoever is the current "maintainer",
can pick up where the previous one has left the project.

# Entries

## 25th June 2020 (jpb)

Here is the actual implementation of `future:send:at:args:` in Squeak.
This method has two implementations one on `Project` and the other on
`MorphicProject`. I chose the `Project` implementation as this is more
general. How am I going to deal with the situation, that Cuis doesn't implement
projects?

````Smalltalk
future: receiver send: aSelector at: deltaMSecs args: args
	"Send a message deltaSeconds into the future.  Answers a Promise that will be resolved at some time in the future."
	| pr closure |
	pr := Promise new.
	closure := [pr fulfillWith: [receiver perform: aSelector withArguments: args]].
	deltaMSecs = 0
		ifTrue: [self addDeferredUIMessage: closure]
		ifFalse: [
			[	(Delay forMilliseconds: deltaMSecs) wait.
				self addDeferredUIMessage: 
					closure
			] forkAt: Processor userSchedulingPriority + 1.
		].
	^pr
````

I chose to use a `FutureHandler` class, because that you still have some of the intended
features of using `Project`. Dealing with Promises your own way.


## 21th June 2020 (jpb)

Yesterday I added the squeak actors project from squeaksource and
started a `AUTHORS.md` file to correctly record everybody from whom
I originally took code to build this project together for [Cuis Smalltalk](http://cuis-smalltalk.org).

Today I added missing classes from `Squeak5.3` which implemented the shared
queues and promises used in the original Actors package, I'll propably make
packages out of them to depend and will rename some things in them.
For example I dislike `SharedQueue2` that's a really unhelpful name.

I added too the `FutureMaker` from Squeak. But what now seems to me to a
problem is that there the concept of futures were intertwined into the
compiler for efficiency reasons and use `Project` for sending the
`future:send:at` message. That's unhelpful.

In Squeak5.3 the message which sits a little bit over that is implented
as: 

````Smalltalk
    futureSend: aSelector at: deltaMSecs args: args
	    "Send a message deltaSeconds into the future (some implementations may requires 'deltaMSecs' to be zero).
        Answers a Promise that will be resolved at some time in the future.  See comment in class FutureNode."
	^Project current future: self send: aSelector at: deltaMSecs args: args.
````

that's annoying. Maybe I should just remove the concepts of futures.


# Authors

- Josef Philip Bernhart (jpb)
