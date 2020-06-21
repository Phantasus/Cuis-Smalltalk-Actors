# Introduction

This file represents a journal for the `Cuis-Actors` project,
it's a port of the `Squeak-Actors` project, with refactorings
and changed designs here and there. The purpose of this document
is to record thoughts, opinions, feelings, etc. which were made
for this project, so that, whoever is the current "maintainer",
can pick up where the previous one has left the project.

# Entries

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
