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


# Authors

- Josef Philip Bernhart (jpb)
