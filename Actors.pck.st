'From Cuis 5.0 [latest update: #4191] on 21 June 2020 at 1:51:29 pm'!
'Description Port of Squeak Actors (See https://tonyg.github.io/squeak-actors) to Cuis.

License: MIT
Copyright (c) 2020 Josef Philip Bernhart (Port)
Copyright (c) 2018, 2019, 2020 Tony Garnock-Jones (Squeak Actors Author)'!
!provides: 'Actors' 1 2!
!requires: 'Concurrency-Kernel' 1 0 nil!
SystemOrganization addCategory: #Actors!
SystemOrganization addCategory: #'Actors-Dataspace'!
SystemOrganization addCategory: #'Actors-Demos'!
SystemOrganization addCategory: #'Actors-Tests'!


!classDefinition: #ActorProcess category: #Actors!
Process subclass: #ActorProcess
	instanceVariableNames: 'mailbox pendingMessages exitReason tracer linkedActors monitors proxy'
	classVariableNames: 'DefaultTracer MailboxQueueClass'
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'ActorProcess class' category: #Actors!
ActorProcess class
	instanceVariableNames: ''!

!classDefinition: #Actor category: #Actors!
ActorProcess subclass: #Actor
	instanceVariableNames: 'behavior currentRemoteContinuation pendingContinuations'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'Actor class' category: #Actors!
Actor class
	instanceVariableNames: ''!

!classDefinition: #MaxRestartIntensityExceeded category: #Actors!
Error subclass: #MaxRestartIntensityExceeded
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'MaxRestartIntensityExceeded class' category: #Actors!
MaxRestartIntensityExceeded class
	instanceVariableNames: ''!

!classDefinition: #ActorProcessTests category: #'Actors-Tests'!
TestCase subclass: #ActorProcessTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Tests'!
!classDefinition: 'ActorProcessTests class' category: #'Actors-Tests'!
ActorProcessTests class
	instanceVariableNames: ''!

!classDefinition: #ChatRoomTests category: #'Actors-Tests'!
TestCase subclass: #ChatRoomTests
	instanceVariableNames: 'testUser testUserName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Tests'!
!classDefinition: 'ChatRoomTests class' category: #'Actors-Tests'!
ChatRoomTests class
	instanceVariableNames: ''!

!classDefinition: #SharedQueueActorAdditionsTests category: #'Actors-Tests'!
TestCase subclass: #SharedQueueActorAdditionsTests
	instanceVariableNames: 'q'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Tests'!
!classDefinition: 'SharedQueueActorAdditionsTests class' category: #'Actors-Tests'!
SharedQueueActorAdditionsTests class
	instanceVariableNames: ''!

!classDefinition: #SimpleTestActorTests category: #'Actors-Tests'!
TestCase subclass: #SimpleTestActorTests
	instanceVariableNames: 'testActor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Tests'!
!classDefinition: 'SimpleTestActorTests class' category: #'Actors-Tests'!
SimpleTestActorTests class
	instanceVariableNames: ''!

!classDefinition: #ChatRoomTestResource category: #'Actors-Tests'!
TestResource subclass: #ChatRoomTestResource
	instanceVariableNames: 'room accepting user'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Tests'!
!classDefinition: 'ChatRoomTestResource class' category: #'Actors-Tests'!
ChatRoomTestResource class
	instanceVariableNames: ''!

!classDefinition: #ActorBehavior category: #Actors!
Object subclass: #ActorBehavior
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'ActorBehavior class' category: #Actors!
ActorBehavior class
	instanceVariableNames: ''!

!classDefinition: #SingletonActor category: #Actors!
ActorBehavior subclass: #SingletonActor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'SingletonActor class' category: #Actors!
SingletonActor class
	instanceVariableNames: 'Instance'!

!classDefinition: #Supervisor category: #Actors!
ActorBehavior subclass: #Supervisor
	instanceVariableNames: 'children shutdownPending shutdownReason intensity period restartCount lastRestartCountReset'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'Supervisor class' category: #Actors!
Supervisor class
	instanceVariableNames: ''!

!classDefinition: #SimpleDataspace category: #'Actors-Dataspace'!
ActorBehavior subclass: #SimpleDataspace
	instanceVariableNames: 'entries subscriptions filters cleanups'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Dataspace'!
!classDefinition: 'SimpleDataspace class' category: #'Actors-Dataspace'!
SimpleDataspace class
	instanceVariableNames: ''!

!classDefinition: #BarrierActor category: #'Actors-Demos'!
ActorBehavior subclass: #BarrierActor
	instanceVariableNames: 'waiters'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'BarrierActor class' category: #'Actors-Demos'!
BarrierActor class
	instanceVariableNames: ''!

!classDefinition: #CellActor category: #'Actors-Demos'!
ActorBehavior subclass: #CellActor
	instanceVariableNames: 'waiters contents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'CellActor class' category: #'Actors-Demos'!
CellActor class
	instanceVariableNames: ''!

!classDefinition: #ChatRoom category: #'Actors-Demos'!
ActorBehavior subclass: #ChatRoom
	instanceVariableNames: 'present counter isListening serverSock'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'ChatRoom class' category: #'Actors-Demos'!
ChatRoom class
	instanceVariableNames: ''!

!classDefinition: #ChatUserAgent category: #'Actors-Demos'!
ActorBehavior subclass: #ChatUserAgent
	instanceVariableNames: 'username conn room'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'ChatUserAgent class' category: #'Actors-Demos'!
ChatUserAgent class
	instanceVariableNames: ''!

!classDefinition: #ControlledActor category: #'Actors-Demos'!
ActorBehavior subclass: #ControlledActor
	instanceVariableNames: 'controllingActor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'ControlledActor class' category: #'Actors-Demos'!
ControlledActor class
	instanceVariableNames: ''!

!classDefinition: #ServerSocketActor category: #'Actors-Demos'!
ControlledActor subclass: #ServerSocketActor
	instanceVariableNames: 'hostname portNumber backlog socket ready credit acceptProcess'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'ServerSocketActor class' category: #'Actors-Demos'!
ServerSocketActor class
	instanceVariableNames: ''!

!classDefinition: #SocketActor category: #'Actors-Demos'!
ControlledActor subclass: #SocketActor
	instanceVariableNames: 'me socket stream credit readWorker writeWorker readAction finalSignalSent lineTerminator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'SocketActor class' category: #'Actors-Demos'!
SocketActor class
	instanceVariableNames: ''!

!classDefinition: #MorphActor category: #'Actors-Demos'!
ActorBehavior subclass: #MorphActor
	instanceVariableNames: 'model morph'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'MorphActor class' category: #'Actors-Demos'!
MorphActor class
	instanceVariableNames: ''!

!classDefinition: #DemoSocketTerminal category: #'Actors-Demos'!
MorphActor subclass: #DemoSocketTerminal
	instanceVariableNames: 'sock output currentHostName currentPortNumber nextHostName nextPortNumber'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'DemoSocketTerminal class' category: #'Actors-Demos'!
DemoSocketTerminal class
	instanceVariableNames: ''!

!classDefinition: #TerminalOutputMorphActor category: #'Actors-Demos'!
MorphActor subclass: #TerminalOutputMorphActor
	instanceVariableNames: 'buffer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'TerminalOutputMorphActor class' category: #'Actors-Demos'!
TerminalOutputMorphActor class
	instanceVariableNames: ''!

!classDefinition: #SimpleWorkerActor category: #'Actors-Demos'!
ActorBehavior subclass: #SimpleWorkerActor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'SimpleWorkerActor class' category: #'Actors-Demos'!
SimpleWorkerActor class
	instanceVariableNames: ''!

!classDefinition: #ChatRoomTestUser category: #'Actors-Tests'!
ActorBehavior subclass: #ChatRoomTestUser
	instanceVariableNames: 'sock seenUsers presentUsers speakingUser currentStanza allStanzas myName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Tests'!
!classDefinition: 'ChatRoomTestUser class' category: #'Actors-Tests'!
ChatRoomTestUser class
	instanceVariableNames: ''!

!classDefinition: #SimpleTestActor category: #'Actors-Tests'!
ActorBehavior subclass: #SimpleTestActor
	instanceVariableNames: 'updateHandler'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Tests'!
!classDefinition: 'SimpleTestActor class' category: #'Actors-Tests'!
SimpleTestActor class
	instanceVariableNames: ''!

!classDefinition: #ActorCallback category: #Actors!
Object subclass: #ActorCallback
	instanceVariableNames: 'actor block'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'ActorCallback class' category: #Actors!
ActorCallback class
	instanceVariableNames: ''!

!classDefinition: #ActorEventTracer category: #Actors!
Object subclass: #ActorEventTracer
	instanceVariableNames: 'debugExceptions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'ActorEventTracer class' category: #Actors!
ActorEventTracer class
	instanceVariableNames: ''!

!classDefinition: #ActorEventStreamTracer category: #Actors!
ActorEventTracer subclass: #ActorEventStreamTracer
	instanceVariableNames: 'streams'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'ActorEventStreamTracer class' category: #Actors!
ActorEventStreamTracer class
	instanceVariableNames: ''!

!classDefinition: #ActorProxy category: #Actors!
Object subclass: #ActorProxy
	instanceVariableNames: 'actor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'ActorProxy class' category: #Actors!
ActorProxy class
	instanceVariableNames: ''!

!classDefinition: #ActorRequest category: #Actors!
Object subclass: #ActorRequest
	instanceVariableNames: 'message sender promise worker'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'ActorRequest class' category: #Actors!
ActorRequest class
	instanceVariableNames: ''!

!classDefinition: #ActorTerminated category: #Actors!
Object subclass: #ActorTerminated
	instanceVariableNames: 'actor exitReason'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'ActorTerminated class' category: #Actors!
ActorTerminated class
	instanceVariableNames: ''!

!classDefinition: #SimpleDataspaceItem category: #'Actors-Dataspace'!
Object subclass: #SimpleDataspaceItem
	instanceVariableNames: 'peer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Dataspace'!
!classDefinition: 'SimpleDataspaceItem class' category: #'Actors-Dataspace'!
SimpleDataspaceItem class
	instanceVariableNames: ''!

!classDefinition: #SimpleDataspaceAssertion category: #'Actors-Dataspace'!
SimpleDataspaceItem subclass: #SimpleDataspaceAssertion
	instanceVariableNames: 'topic datum'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Dataspace'!
!classDefinition: 'SimpleDataspaceAssertion class' category: #'Actors-Dataspace'!
SimpleDataspaceAssertion class
	instanceVariableNames: ''!

!classDefinition: #SimpleDataspaceFilter category: #'Actors-Dataspace'!
SimpleDataspaceItem subclass: #SimpleDataspaceFilter
	instanceVariableNames: 'filterBlock assertionHandler retractionHandler'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Dataspace'!
!classDefinition: 'SimpleDataspaceFilter class' category: #'Actors-Dataspace'!
SimpleDataspaceFilter class
	instanceVariableNames: ''!

!classDefinition: #SimpleDataspaceSubscription category: #'Actors-Dataspace'!
SimpleDataspaceItem subclass: #SimpleDataspaceSubscription
	instanceVariableNames: 'topic assertionHandler retractionHandler'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Dataspace'!
!classDefinition: 'SimpleDataspaceSubscription class' category: #'Actors-Dataspace'!
SimpleDataspaceSubscription class
	instanceVariableNames: ''!

!classDefinition: #ActorPromise category: #Actors!
ProtoObject subclass: #ActorPromise
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'ActorPromise class' category: #Actors!
ActorPromise class
	instanceVariableNames: ''!

!classDefinition: #PromiseMessageChain category: #Actors!
ProtoObject subclass: #PromiseMessageChain
	instanceVariableNames: 'promise'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'PromiseMessageChain class' category: #Actors!
PromiseMessageChain class
	instanceVariableNames: ''!

!classDefinition: #TransientActorProxy category: #Actors!
ProtoObject subclass: #TransientActorProxy
	instanceVariableNames: 'actor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'TransientActorProxy class' category: #Actors!
TransientActorProxy class
	instanceVariableNames: ''!

!classDefinition: #AsyncTransientActorProxy category: #Actors!
TransientActorProxy subclass: #AsyncTransientActorProxy
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'AsyncTransientActorProxy class' category: #Actors!
AsyncTransientActorProxy class
	instanceVariableNames: ''!

!classDefinition: #BlockingTransientActorProxy category: #Actors!
TransientActorProxy subclass: #BlockingTransientActorProxy
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'BlockingTransientActorProxy class' category: #Actors!
BlockingTransientActorProxy class
	instanceVariableNames: ''!

!classDefinition: #SyncTransientActorProxy category: #Actors!
TransientActorProxy subclass: #SyncTransientActorProxy
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors'!
!classDefinition: 'SyncTransientActorProxy class' category: #Actors!
SyncTransientActorProxy class
	instanceVariableNames: ''!

!classDefinition: #ActorProxyModel category: #'Actors-Demos'!
ProtoObject subclass: #ActorProxyModel
	instanceVariableNames: 'proxy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Actors-Demos'!
!classDefinition: 'ActorProxyModel class' category: #'Actors-Demos'!
ActorProxyModel class
	instanceVariableNames: ''!


!ActorProcess commentStamp: 'tonyg 2/12/2018 20:02' prior: 0!
I am a "Process style" actor, in the terminology of De Koster et al. [1]

I implement a subset of the Erlang approach to the actor model. In particular, I provide
	- a main process routine
	- a receive operation
	- a form of selective receive
	- distinct system-level and user-level messages
	- Erlang-style "links" and "monitors" [2]

I have *two* sets of interfaces: one "internal" interface, for the use of the main process routine that I am animating, and one "external" interface, for use by other ActorProcesses, Actors, and regular Processes.

[1] J. De Koster, T. Van Cutsem, and W. De Meuter, "43 Years of Actors: a Taxonomy of Actor Models and Their Key Properties," in Proceedings of the AGERE!! Workshop, 2016.

[2] http://erlang.org/doc/reference_manual/processes.html

Instance Variables
	exitReason:		used to store the exit status of this actor; nil means "normal" exit
	linkedActors:		a Set of Process
	mailbox:		SharedQueue2 (Squeak) or SharedQueue (Pharo) - the main mailbox
	monitors:		a Dictionary mapping monitor reference objects to Process instances
	pendingMessages:		queue of user-level request messages
	proxy:		my ActorProxy, or nil if it hasn't been created yet
	tracer:		an ActorEventTracer, or nil to use the default system-wide tracer!

!Actor commentStamp: 'tonyg 2/19/2017 10:30' prior: 0!
I extend ActorProcess with the notion of a distinct behavior object. My user-level request messages are to be ActorRequest instances bearing Message instances. I respond to user-level request messages by performing them at my behavior object, and sending the results back to the calling actor.

Instance Variables
	behavior:		my behavior object. May be any object, but ActorBehavior is a convenient subclass.
	currentRemoteContinuation:		non-nil initially during execution of a behavior method. See #caller
	pendingContinuations:		Set of ActorRequests that haven't been replied to yet, that this actor is obliged to reply to at some point in the future. See #finishRequest: and ActorRequest>>#redirectTo:message:.
!

!MaxRestartIntensityExceeded commentStamp: 'tonyg 2/18/2017 21:05' prior: 0!
I am signalled when a Supervisor detects that its supervisees are restarting too often.
!

!ActorBehavior commentStamp: 'tonyg 2/18/2017 20:42' prior: 0!
I provide useful methods for behavior objects animated by Actor instances.

It is NOT MANDATORY to use this class as a base class for such behavior objects: ANY object can be animated by an Actor.

The benefits of this class are:
	- an experimental logging facility, #log:, #logAll:
	- class-side #spawn and #spawnLink
!

!Supervisor commentStamp: 'tonyg 2/18/2017 20:49' prior: 0!
I am an Erlang/OTP-style supervisor of actors. I am intended to be the behavior object of an Actor myself: nested supervision hierarchies are useful.

Configure me with "specifications" for supervisees: see #supervise:.

Instance Variables
	children:		IdentityDictionary mapping specification objects to ActorProcess instances
	intensity:		Positive number
	period:		Duration
	restartCount:		Non-negative integer
	lastRestartCountReset:		Time
	shutdownReason:		nil, or an Exception

children
	- All running supervisees are listed here. Keyed by their specifications.

intensity, period, restartCount and lastRestartCountReset
	- restartCount tracks how many restarts have happened since the last reset
	- lastRestartCountReset records when that reset happened
	- if more than `intensity` restarts have happened, and not more than `period` time has elapsed since `lastRestartCountReset`, then the supervisor will kill all its children and terminate with MaxRestartIntensityExceeded.

shutdownReason
	- usually nil for a healthy Supervisor
	- when some fatal event such as max restart intensity exceeded happens, is set to non-nil by #stopWith:; this leads eventually to Supervisor termination.
!

!BarrierActor commentStamp: 'tonyg 2/18/2018 19:21' prior: 0!
I am a simple ActorBehavior that implements a *barrier*.

Clients may call #barrierWait, in which case they will not receive a reply until some other client calls #releaseWaiters or #releaseWaiters:. Any value supplied to #releaseWaiters: is used as the resolved value of waiting clients' promises; #releaseWaiters supplies nil as this value.

Instance Variables
	waiters:		a Set of ActorRequests, the waiting continuations
!

!CellActor commentStamp: 'tonyg 3/5/2017 19:18' prior: 0!
I hold a single value. Peers requesting my value before it is set block until some other peer sets my value. From then on, all requestors are given the most-recently-set value. Compare to BarrierActor, which is similar, but doesn't remember the value for later comers.!

!ChatRoom commentStamp: 'tonyg 2/18/2017 21:08' prior: 0!
I am a simple ActorBehavior that implements a TCP-accessible chat room listening on port 5999.

Instance Variables
	counter:		used to assign quasi-unique usernames initially to newly-connected users
	present:		map from ActorProxy to username String - all connected users
!

!ChatUserAgent commentStamp: 'tonyg 2/18/2017 21:09' prior: 0!
I am an ActorBehavior representing a user connected to a ChatRoom.

Instance Variables
	conn:		SocketActor proxy, my connection to the user themselves
	room:		ChatRoom proxy, my connection to the chat room
	username:		String, my current username
!

!ControlledActor commentStamp: 'tonyg 2/4/2018 13:06' prior: 0!
I have a "controlling actor": whenever I send an event, I send it to my controlling actor. I link myself to my controlling actor, so that I shut down when it does.

Instance Variables
	controllingActor:		nil or a Process!

!ServerSocketActor commentStamp: 'tonyg 2/18/2017 21:19' prior: 0!
I listen on a configured TCP port (and optionally, IP interface) for incoming TCP connections.

I have a "controlling actor": whenever I send an event, I send it to my controlling actor. I link myself to my controlling actor, so that I shut down when it does.

Once I am configured, I will asynchronously invoke #tcpServer:accepted: and #tcpServer:ready: on my controlling actor. However, I implement credit-based flow control: I will only accept as many sockets as I have been permitted to!! Clients must call #issueCredit or #issueCredit: to permit me to accept more connections.

I am modelled after Erlang's gen_tcp functionality, http://erlang.org/doc/man/gen_tcp.html.

Instance Variables
	acceptProcess:		Private. Process actually waiting for new sockets.
	backlog:		Positive integer. Connection backlog; see listen(2) etc etc etc.
	controllingActor:		nil or a Process
	credit:		Non-negative integer. How many more connections I may accept before I must pause, awaiting more credit.
	hostname:		Interface to bind to. '0.0.0.0' binds to all IPv4 interfaces; 'localhost' to the loopback; etc.
	portNumber:		Port number to listen on.
	ready:		Private. Tracks whether the listen socket is working or not.
	socket:		Private. The listen socket.
!

!SocketActor commentStamp: 'tonyg 2/15/2018 19:40' prior: 0!
I am an ActorBehavior interfacing to a connected Socket. I can be instantiated by a ServerSocketActor, or can be instantiated using my class-side methods to connect to an external server.

Like ServerSocketActor, I have a "controlling actor" which receives all events related to my socket. I am modelled on Erlang's gen_tcp library, http://erlang.org/doc/man/gen_tcp.html.

I send my controlling actor #tcpSocket:data: and #tcpSocketClosed: events as they happen. I link myself to my controlling actor, so that I shut down when it does.

Here is a simple example, a very rough HTTP client that retrieves http://localhost/:

	ActorProcess boot: [ | s |
		s _ SocketActor connectToHost: 'localhost' port: 80. "Takes the current actor as its controlling actor."
		s lineTerminator: String crlf. "HTTP protocol requires this."
		s sendLine: 'GET / HTTP/1.0'.
		s sendLine: ''.
		s delimiterMode: String crlfcrlf. "This makes the first work item a string up to the header/body break."
		s issueCredit. "Issue one work-unit's credit: this reads the headers."
		s rawMode. "Switch to raw mode for the remainder of the connection."
		s infiniteCredit. "Retrieve it all. NB be more careful about credit, in production use!!"
		Actor receiveUntil: [:v |
			Transcript crlf; nextPutAll: (v printStringLimitedTo: 400); flush.
			v message selector = #tcpSocketClosed:reason: ]].

I read data from my socket in "work units", which depend on my *mode*.

In #delimiterMode:, a work unit is a span of bytes or text leading up to the next occurrence of some delimiter bytes or text, or the end of the stream, whichever is sooner.

In #rawMode, a work unit is an arbitrary chunk of bytes.

In #rawModeAscii, it's an arbitrary chunk of ASCII characters - note, not UTF-8-encoded Unicode, since the chunk we get might not contain a complete Unicode codepoint. Be careful when using this - it's convenient for debugging, but can easily cause Mojibake in other settings.

I implement credit-based flow control: I will not read more work units than I have credit for. Use #issueCredit and #issueCredit: to replenish my credit levels.

Instance Variables
	controllingActor:		my controlling actor.
	credit:		Non-negative integer count of read work units.
	finalSignalSent:		Private.
	readAction:		Private. Set by mode-setting methods.
	readWorker:		Private. A SimpleWorkerActor.
	socket:		my Socket.
	stream:		a SocketStream over my Socket.
	writeWorker:		Private. A SimpleWorkerActor.
!

!MorphActor commentStamp: 'tonyg 2/12/2018 21:51' prior: 0!
I am an Actor behavior responsible for acting as a model to a Morph. My associated Morph(s) have my `model`, which is an ActorProxyModel, as their model. My `model` then delegates their requests to me, taking care of timeouts, promises, and so forth.

After I am spawned, use #buildSpecWith: to get a build specification for constructing my main Morph. See #open for an example use of #buildSpecWith:.

My subclasses override #buildSpecWith:.

If, after I terminate, a Morph needs to call methods on me, supply stub implementations of those methods in the Dictionary returned by #buildProxyStub.

My #postExitCleanup: method destroys my main Morph when I terminate.

Instance Variables
	model:		an ActorProxyModel targeting me.
	morph:		nil, until initialized with my main Morph
!

!DemoSocketTerminal commentStamp: 'tonyg 2/13/2018 00:05' prior: 0!
A DemoSocketTerminal implements a simple interactive TCP/IP terminal application.

	DemoSocketTerminal spawn open.
	
As a morphic model (by virtue of its inheritance from MorphActor), the specification resulting from #buildSpecWith: creates and hooks up UI controls for altering the target host name and port number, as well as a TerminalOutputMorphActor for terminal display and an input text field for terminal input.

Instance Variables
	currentHostName:		when connected, a String, hostname that was used to open the connection; otherwise, nil
	currentPortNumber:		when connected, an Integer, port number that was used to open the connection; otherwise, nil
	nextHostName:		stores a String, hostname to use next time a connection attempt is made
	nextPortNumber:		stores an Integer, port number to use next time a connection attempt is made
	output:		an ActorProxy on an Actor for a TerminalOutputMorphActor
	sock:		when connected, an ActorProxy for a SocketActor; otherwise, nil
!

!TerminalOutputMorphActor commentStamp: 'tonyg 2/13/2018 00:16' prior: 0!
I am an actor able to append text to an associated PluggableTextMorph, a bit like a Transcript.

Send #appendText: with a String or Text to append to my morph, and #clear to clear my morph.

	| t |
	t _ TerminalOutputMorphActor spawn.
	t open.
	t appendText: 'Hello!!', String cr.
	t appendText: 'Hi there!!' asText allBold, String cr.
	t appendText: DateAndTime now asString asText allBold, String cr.
	nil inform: 'Click to clear'.
	t clear.
	nil inform: 'Click to close'.
	t actor terminate.

Instance Variables
	buffer:		a chunk of Text to append to the Morph; usually empty, only nonempty while something is waiting to be picked up by the Morph!

!SimpleWorkerActor commentStamp: 'tonyg 2/4/2018 16:12' prior: 0!
I am a simple job queue: submit work-item blocks to me with #work:.

I am used, for example, by SocketActor (twice!!) to perform read- and write-operations in parallel without the one blocking the other.

Here's a small example:

	ActorProcess boot: [ | w p a |
		w _ SimpleWorkerActor spawnLink. "Linked to our process, so we don't leak resources."
		p _ w work: [3 + 4]. "p is a Promise for the result of the block, executed by the worker."
		a _ p wait. "a is the result of the block."
		[a = 7] assert.
		self inform: a asString.]
!

!ActorCallback commentStamp: 'tonyg 2/17/2018 13:27' prior: 0!
I wrap a BlockClosure, and pretend to be a BlockClosure myself. When invoked, I cause my wrapped block to be run in my `actor`. See ActorCallback class >> #wrap:.

Instance Variables
	actor:		an Actor, the place where my block must be run
	block:		a BlockClosure (or other valueable), the task to run in my actor!

!ActorEventTracer commentStamp: 'tonyg 2/7/2018 09:51' prior: 0!
I receive messages describing important events in the lifetimes of the ActorProcesses in the system.

I am also responsible for handling uncaught exceptions in actors where I am installed. By default, I pass them on, which usually triggers UnhandledError, which in turn opens a debugger. If debugExceptions is false, however, I will simply log the error.!

!ActorEventStreamTracer commentStamp: 'tonyg 2/9/2018 13:07' prior: 0!
I respond to trace event messages by logging them to a configurable collection of streams, often including the Transcript or a standard-error output stream.!

!ActorProxy commentStamp: 'tonyg 2/18/2017 21:00' prior: 0!
I am a vanilla Object that uses #doesNotUnderstand: to delegate behavior to a remote Actor. Methods that go through #doesNotUnderstand: return Promise instances, which can be used to pick up replies. See Promise>>#whenResolved: and friends.

Instance Variables
	actor:		The underlying Actor that I send requests to.!

!ActorRequest commentStamp: 'tonyg 2/9/2018 15:30' prior: 0!
I represent a triple of a Message destined for a remote behavior, a Process interested in the reply, and a Promise by which the reply is to be delivered to the Process.

If the Promise is nil, I am asynchronous and no-one cares about the reply to the eventual evaluation of my Message. My sender will usually not be nil when I am asynchronous, and will never be nil when I am synchronous.

I am not intrinsically targeted at any Actor in particular, though I can be sent to an actor with #sendTo: or #redirectTo:message:.

Ultimately, when a response is ready to my request, it is transmitted by invoking #resolveWith: or #rejectWith:, as appropriate. Compare to similar methods on Promise.

In order to ensure that every request receives an answer, I sometimes store the identity of an Actor (in my `worker` instance variable) that has taken responsibility for me, so that it can send a default answer if no-one else supplies anything first. I take care to signal `worker` whenever someone supplies a reply to me, so that `worker` knows it no longer needs to bother with me.

Instance Variables
	message:		a Message
	promise:		a Promise, or nil
	sender:		a Process, or nil
	worker:		nil, or an Actor
!

!ActorTerminated commentStamp: 'tonyg 2/12/2018 17:06' prior: 0!
I represent the cause of a chain of actor terminations propagating through links. An actor that signals an uncaught exception will be terminated with an instance of me as the exit reason, where my `actor` field is the original signalling actor, and my `exception` field is the original signalled exception.!

!ActorPromise commentStamp: 'tonyg 2/4/2018 12:08' prior: 0!
I augment the default Promise waiting behavior with special treatment of ActorProcesses, which must continue to receive system-level messages while they wait. I rely on the fact that my instances are always resolved with just such a system-level message, ensuring that my controlling process is woken up when I become #fulfilled!!!

!TransientActorProxy commentStamp: 'tonyg 2/15/2018 14:39' prior: 0!
I am like an ActorProxy, and in fact my instances are always obtained via ActorProxy>>#sync, #async, and #blocking, but I am derived from ProtoObject and thus can proxy for (almost) any method. Use me when the methods on Object (superclass of ActorProxy) get in the way of trying to send a message to my actor.

I am never instantiated directly: only my subclasses know enough to be able properly to implement doesNotUnderstand: in my context.

Methods in category "minimal tool support" are needed in order to avoid confusing various tools (e.g. debugger, inspector and so on). (I used, among other sources, the implementation of class FutureMaker to figure out what was required.)!

!AsyncTransientActorProxy commentStamp: 'tonyg 2/10/2018 16:22' prior: 0!
I specialize TransientActorProxy to give asynchronous method calls always returning nil.!

!BlockingTransientActorProxy commentStamp: 'tonyg 2/10/2018 16:23' prior: 0!
I specialize TransientActorProxy to give synchronous method calls that block and then wait for and return the reply.!

!SyncTransientActorProxy commentStamp: 'tonyg 2/10/2018 16:23' prior: 0!
I specialize TransientActorProxy to give synchronous method calls that do not block, but instead return a Promise of the eventual reply.!

!ActorProxyModel commentStamp: 'tonyg 2/12/2018 21:46' prior: 0!
I subclass Model, part of the Smalltalk/Morphic user interface framework. My purpose is to relay calls to callbacks invoked by Morphic views to an Actor, thereby reconciling the tension between Morphic models needing to be run in the UI process and Actors running in separate processes. I complement MorphActor, which constructs instances of me.

The approach of using an ActorProxy (or a BlockingTransientActorProxy) as a model itself fails for a few reasons:
 1. an ActorProxy returns Promises for callback invocations, which Morphic is not expecting;
 2. a terminated Actor invoked via its ActorProxy yields Promise rejections and signalled BrokenPromise exceptions, which Morphic doesn't expect;
 3. a BlockingTransientActorProxy waits forever for a reply, which can lead to UI deadlock; and
 4. a BlockingTransientActorProxy doesn't play nicely with the inspector or the explorer, since it inherits directly from ProtoObject and is not intended to outlive a small number of message sends.

These are the reasons for my existence. I directly handle reasons 1, 3 and 4 by way of my #proxySend: method, and reason 2 by way of my #proxyStub: method and related functionality.

Instance Variables
	proxy:		an ActorProxy, the actor backing this model
!

!Actor methodsFor: 'accessing' stamp: 'tonyg 2/8/2018 20:47'!
printOn: aStream
	| title |
	title _ self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title;
		nextPutAll: ' (';
		nextPutAll: self name;
		nextPutAll: ') ';
		nextPutAll: 'on '.
	behavior printOn: aStream.
	self isTerminated ifTrue: [aStream nextPutAll: ' (terminated)'].! !

!CellActor methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 19:39'!
printOn: aStream
	super printOn: aStream.
	waiters
		ifNil: [aStream nextPut: $(.
			contents printOn: aStream.
			aStream nextPut: $).]
		ifNotNil: [aStream nextPutAll: '<empty>']! !

!ActorProxy methodsFor: 'printing' stamp: 'tonyg 2/17/2017 14:54'!
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' for '.
	actor printOn: aStream.! !

!ActorRequest methodsFor: 'printing' stamp: 'tonyg 2/9/2018 15:28'!
printOn: aStream
	aStream nextPutAll: (self isAsync ifTrue: ['an asynchronous '] ifFalse: ['a synchronous ']); nextPutAll: self class name.
	sender ifNotNil: [aStream nextPutAll: ' from '; nextPutAll: sender name].
	aStream nextPutAll: ' ('.
	message printOn: aStream.
	aStream nextPutAll: ')'.! !

!ActorTerminated methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 17:30'!
printOn: aStream
	super printOn: aStream.
	aStream nextPutAll: ' for '.
	actor printOn: aStream.
	aStream nextPutAll: ' with '.
	exitReason printOn: aStream.! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:42'!
printOn: aStream
	"Append to the argument, aStream, a sequence of characters that  
	identifies the receiver."
	| title |
	title _ self class name.
	aStream
		nextPutAll: (title first isVowel ifTrue: ['an '] ifFalse: ['a ']);
		nextPutAll: title! !

!ActorProcess methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 12:52'!
actor
	^ self! !

!ActorProcess methodsFor: 'accessing' stamp: 'tonyg 2/12/2018 17:15'!
exitReason
	^ exitReason! !

!ActorProcess methodsFor: 'accessing' stamp: 'tonyg 1/29/2018 11:19'!
ownTracer
	"Private. Allows startup code to generically set a new ActorProcess's tracer to that of its parent, whether its parent was an ActorProcess or not."
	^ tracer! !

!ActorProcess methodsFor: 'accessing' stamp: 'tonyg 2/19/2017 10:31'!
proxy
	"Public. Yields the ActorProxy corresponding to and targeting the receiver. While not all ActorProcesses
	deal in ActorRequests as their user-level message types, all instances of Actor do, and it's reasonable
	to imagine that others might also. Having an ActorProxy always available simplifies writing library code:
	library actors can assume they will be able to send ActorRequests."
	^ proxy ifNil: [ proxy _ ActorProxy new initializeActor: self ]! !

!ActorProcess methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 19:26'!
sendMessage: aMessage
	"Public. Enqueue `aMessage` as a user-level request message for the receiver."
	self performInternally: (Message selector: #handleMessage: argument: aMessage)! !

!ActorProcess methodsFor: 'accessing' stamp: 'tonyg 1/29/2018 11:19'!
tracer: aTracer
	tracer _ aTracer! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 1/24/2020 23:16'!
addLinkedActor: peer
	"Private. Called from ActorProcess>>#link to register `peer` as an actor that is listening for
	our exit signal when we terminate."
	peer == self ifFalse: [
		self ifDead: [
				self tracer traceLinkAddedTo: peer.
				self signalLinkedActor: peer ]
			ifAlive: [
				linkedActors ifNil: [ linkedActors _ IdentitySet new ].
				(linkedActors includes: peer) ifFalse: [
					linkedActors add: peer.
					self tracer traceLinkAddedTo: peer ]]]! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 1/29/2018 11:15'!
addMonitor: aReference actor: anActor
	"Private. Called from ActorProcess>>#monitor: to register `anActor` as an actor that is
	monitoring our (eventual or immediate) exit signal via `aReference`."
	self ifDead: [
			self tracer traceMonitorAddedTo: anActor reference: aReference.
			self signalMonitor: aReference actor: anActor ]
		ifAlive: [
			self tracer traceMonitorAddedTo: anActor reference: aReference.
			monitors ifNil: [ monitors _ Dictionary new ].
			monitors at: aReference put: anActor ]! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 2/18/2017 19:08'!
evaluateBlock: aBlock
	"Private. Called via the mailbox by #evaluateBlockInternally:."
	aBlock value.! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 1/29/2018 11:38'!
handleMessage: aMessage
	"Private. Accepts `aMessage`, a user-level request message, from the mailbox.
	Clients can send such messages to the receiver using #sendMessage:."
	self ifDead: [ self rejectMessage: aMessage]
		ifAlive: [
			self tracer traceEnqueuedMessage: aMessage.
			pendingMessages addLast: aMessage ]! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 2/18/2017 19:11'!
ifDead: aBlock ifAlive: anotherBlock
	"Private. Convenient branching on ActorProcess liveness."
	^ self isTerminated
		ifTrue: aBlock
		ifFalse: anotherBlock! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 2/14/2018 11:51'!
internalLinkedPeer: anActor terminatedWith: aReason
	"Private. Do not override - #linkedPeer:terminatedWith: is the place to add extended
	behavior. Invoked via mailbox by #triggerLinkTo:withExitReason:."
	self tracer traceLinkedPeer: anActor terminatedWith: aReason.
	self removeLinkedActor: anActor.
	^ self linkedPeer: anActor terminatedWith: aReason! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 2/14/2018 11:51'!
internalPeer: anActor monitor: aReference terminatedWith: aReason
	"Private. Do not override - #peer:monitor:terminatedWith: is the place to add extended
	behavior. Invoked via mailbox by #triggerMonitor:on:withExitReason:."
	self tracer tracePeer: anActor monitor: aReference terminatedWith: aReason.
	^ self peer: anActor monitor: aReference terminatedWith: aReason! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 2/15/2018 17:39'!
linkedPeer: anActor terminatedWith: aReason
	"Protected. Internal. Hook for handling the termination of a linked peer.
	Subclasses may override this to replace or extend this behavior."
	exitReason _ ActorTerminated actor: anActor reason: aReason.
	self terminate.! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 2/12/2018 16:54'!
peer: anActor monitor: aReference terminatedWith: anException
	"Protected. Internal. Hook for handling the termination of a monitored peer.
	Subclasses may override this to replace or extend this behavior."! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 1/29/2018 11:16'!
rejectMessage: aMessage
	"Protected. Internal. Hook for cleaning up a user-level message that is never going to be
	processed. Subclasses may perform cleanup here."
	self tracer traceRejectedMessage: aMessage! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 2/9/2018 15:45'!
removeLinkedActor: anActor
	"Private. Called to remove `peer` from the set of actors listening for
	our exit signal when we terminate."
	linkedActors ifNotNil: [ | wasPresent |
		wasPresent _ true.
		linkedActors remove: anActor ifAbsent: [wasPresent _ false].
		wasPresent ifTrue: [ self tracer traceLinkRemovedTo: anActor ].
		linkedActors ifEmpty: [linkedActors _ nil]]! !

!ActorProcess methodsFor: 'private-message handling' stamp: 'tonyg 1/29/2018 11:37'!
removeMonitor: aReference
	"Private. Called to remove a monitor that a peer had previously installed."
	monitors
		ifNil: [
			self tracer traceMonitorRemovedTo: nil reference: aReference]
		ifNotNil: [ | peer |
			peer _ monitors removeKey: aReference ifAbsent: [nil].
			monitors ifEmpty: [monitors _ nil].
			self tracer traceMonitorRemovedTo: peer reference: aReference]! !

!ActorProcess methodsFor: 'private-lifecycle management' stamp: 'tonyg 2/15/2018 15:26'!
boot: bootBlock link: actorOrNil
	"Private. This is the main body of the ActorProcess."
	self tracer traceActorStarted.
	[
		actorOrNil ifNotNil: [ actorOrNil link ].
		[ [ bootBlock value ] on: Exception do: [ :ex | self handleException: ex ] ]
			on: Exception do: [ :ex | self interruptUIProcessIfNecessary. ex pass ]
	] ensure: [
		self signalExit.
		self tracer traceActorStopped: exitReason.
	]! !

!ActorProcess methodsFor: 'private-lifecycle management' stamp: 'tonyg 2/15/2018 17:25'!
handleException: ex
	"Called from the exception handler in boot:link: when the
	user's bootBlock signals an uncaught exception."
	(ex isKindOf: Halt) ifTrue: [^ ex pass].
	exitReason _ ex.
	^ self tracer traceException: ex! !

!ActorProcess methodsFor: 'private-lifecycle management' stamp: 'tonyg 2/15/2018 15:14'!
interruptUIProcessIfNecessary
	"Overridden in Actor, where we have pendingContinuations to check."! !

!ActorProcess methodsFor: 'private-lifecycle management' stamp: 'tonyg 2/18/2017 19:21'!
postExitCleanup
	"Protected. Internal. Hook for cleaning up actor state upon termination. RUNS IN A
	NEW PROCESS, does not run in the process that was animating the actor during its lifetime."
	pendingMessages do: [:m | self rejectMessage: m].! !

!ActorProcess methodsFor: 'private-lifecycle management' stamp: 'tonyg 2/18/2017 19:28'!
signalExit
	"Private. Do not override - extend #postExitCleanup instead. Triggers links and monitors,
	rejects pending work items, and invokes #postExitCleanup. CREATES A NEW PROCESS
	to do all this work in!!"
	[
		"It's important to do ALL of this in a new process (!!) because
		of the following issue. (I don't think it's a bug, it's just weird.)
		If process A is RUNNING and calls #terminate of process B,
		and process B has an unwind handler (such as appears in #boot:link:)
		which checks whether process A #isTerminated, then
		it will appear that process A #isTerminated because
		the active process is process B only because process A has called
		#evaluate:onBehalfOf: in order to PRETEND to be process B, and
		process A's suspendedContext is nil because process A is actually running.
		
		Basically: it's unsafe to check #isTerminated when in an unwind handler
		because we might be checking #isTerminated for the process which is
		temporarily breathing life into the unwinding/terminating process on its
		way out."

		[ self isTerminated ] whileFalse: [ Processor yield ]. "Short spin"

		linkedActors ifNotNil: [ linkedActors do: [ :a | self signalLinkedActor: a ]].
		linkedActors _ nil.
		monitors ifNotNil: [ monitors keysAndValuesDo: [ :r :a | self signalMonitor: r actor: a ]].
		monitors _ nil.
		self processMailbox.
		self postExitCleanup.
	] fork.! !

!ActorProcess methodsFor: 'private-lifecycle management' stamp: 'tonyg 2/12/2018 17:18'!
signalLinkedActor: anActor
	"Private. Delivers a link signal to `anActor` on the occasion of the receiver's termination."
	anActor triggerLinkTo: self withExitReason: exitReason.
! !

!ActorProcess methodsFor: 'private-lifecycle management' stamp: 'tonyg 2/12/2018 17:19'!
signalMonitor: aReference actor: anActor
	"Private. Delivers a monitor signal to `anActor` on the occasion of the receiver's termination."
	anActor triggerMonitor: aReference on: self withExitReason: exitReason.
! !

!ActorProcess methodsFor: 'private-message sending' stamp: 'tonyg 2/18/2017 19:09'!
evaluateBlockInternally: actionBlock
	"Private. Called when an ActorRequest ceases to be pending. The `actionBlock` should run
	in the context of the receiver and trigger the promise waiting for the result of the ActorRequest."
	self performInternally: (Message selector: #evaluateBlock: argument: actionBlock)
! !

!ActorProcess methodsFor: 'private-message sending' stamp: 'tonyg 2/18/2017 19:20'!
performInternally: aMessage
	"Private. If running, enqueue `aMessage` in the mailbox; otherwise, just do it now."
	self ifDead: [ aMessage sendTo: self ]
		ifAlive: [ mailbox nextPut: aMessage ]! !

!ActorProcess methodsFor: 'private-message sending' stamp: 'tonyg 2/12/2018 17:18'!
triggerLinkTo: peer withExitReason: aReason
	"Private. Called from ActorProcess>>#signalLinkedActor:, which is invoked indirectly
	during Actor cleanup, in order to notify the receiver that `peer` has just terminated."
	self performInternally: (Message
		selector: #internalLinkedPeer:terminatedWith:
		arguments: {peer. aReason})! !

!ActorProcess methodsFor: 'private-message sending' stamp: 'tonyg 2/12/2018 17:19'!
triggerMonitor: aReference on: peer withExitReason: aReason
	"Private. Called from ActorProcess>>#signalMonitor:actor:, which is invoked indirectly
	during Actor cleanup, in order to notify the receiver that `peer` has just terminated."
	self performInternally: (Message
			selector: #internalPeer:monitor:terminatedWith:
			arguments: {peer. aReference. aReason})! !

!ActorProcess methodsFor: 'initialization' stamp: 'tonyg 2/12/2018 17:14'!
initialize
	mailbox _ ActorProcess newMailboxQueue.
	pendingMessages _ OrderedCollection new.
	exitReason _ nil.
	tracer _ nil.
	linkedActors _ nil.
	monitors _ nil.
	proxy _ nil.! !

!ActorProcess methodsFor: 'testing' stamp: 'tonyg 2/18/2017 18:28'!
isActor
	^ true! !

!ActorProcess methodsFor: 'killing' stamp: 'tonyg 2/15/2018 17:25'!
kill
	"Public. Terminates the receiver abnormally with a generic, stock reason code."
	self terminateWith: (Error new messageText: 'Killed')! !

!ActorProcess methodsFor: 'killing' stamp: 'tonyg 2/12/2018 17:15'!
terminateWith: aReason
	"Public. Causes the receiver to terminate immediately, running any ensure:/ifCurtailed: blocks
	but not via any kind of catchable exception. The termination is considered 'normal' if
	aReason is nil, and 'abnormal' otherwise.
	See ActorProcess class >> #terminateNormally
	and ActorProcess class >> #terminateWith: for termination of the currently-running actor."
	self isActiveProcess ifFalse: [self suspend].
	exitReason _ aReason.
	self terminate.! !

!ActorProcess methodsFor: 'monitoring and linking' stamp: 'tonyg 2/9/2018 15:45'!
link
	"Public. Establish a link between the currently-running Process and the receiver. If either
	one terminates, the other will receive a signal (though see the caveats in
	Process>>#addLinkedActor:). Idempotent."
	| thisProcess |
	thisProcess _ Processor activeProcess.
	thisProcess addLinkedActor: self.
	self performInternally: (Message selector: #addLinkedActor: argument: thisProcess).
! !

!ActorProcess methodsFor: 'monitoring and linking' stamp: 'tonyg 2/18/2017 19:19'!
monitor: aReference
	"Public. Establish a one-way link so that when the receiver eventually terminates,
	the Process that was active at the time of the call to #monitor: will receive a signal via
	#triggerMonitor:on:withException:. See caveats in Process>>#triggerMonitor:on:withException:."
	self performInternally: (Message
		selector: #addMonitor:actor:
		arguments: {aReference. Processor activeProcess}).
	^ aReference! !

!ActorProcess methodsFor: 'monitoring and linking' stamp: 'tonyg 2/9/2018 15:45'!
unlink
	"Public. Undoes a previously-established link between the receiver and the currently running process. Idempotent."
	| thisProcess |
	thisProcess _ Processor activeProcess.
	thisProcess removeLinkedActor: self.
	self performInternally: (Message selector: #removeLinkedActor: argument: thisProcess).
! !

!ActorProcess methodsFor: 'monitoring and linking' stamp: 'tonyg 2/18/2017 19:33'!
unmonitor: aReference
	"Public. Removes a previously-established monitor on the receiver established by the currently running process."
	self performInternally: (Message selector: #removeMonitor: argument: aReference)! !

!ActorProcess methodsFor: 'internal-message dispatch' stamp: 'tonyg 2/6/2018 23:28'!
processAtLeastOneMessageTimeout: anIntegerOrNil
	"Protected. Internal. Process all previously-enqueued messages; if there aren't any,
	wait for at least one to arrive, or for a timeout to occur. Useful for guaranteeing some kind of progress."
	"Returns true if at least one message was processed, or false if a timeout was supplied and it expired."
	^ (mailbox nextTimeout: anIntegerOrNil)
		ifNil: [ false ]
		ifNotNil: [:m |
			m sendTo: self.
			self processMailbox.
			true ]! !

!ActorProcess methodsFor: 'internal-message dispatch' stamp: 'tonyg 2/18/2017 19:22'!
processMailbox
	"Protected. Internal. Process all previously-enqueued messages."
	| msg |
	[ (msg _ mailbox nextOrNil) notNil ] whileTrue: [ msg sendTo: self ].! !

!ActorProcess methodsFor: 'internal-message dispatch' stamp: 'tonyg 2/12/2018 16:58'!
waitForPromise: aPromise for: msecsOrNil ifTimedOut: timeoutBlock
	"Public. Internal. Cause the currently executing ActorProcess (and it must be a kind of
	ActorProcess) to wait, processing system-level messages but not user-level messages,
	until the given promise settles. Usually invoked via ActorPromise >> #wait. Relies on
	the fact that an ActorPromise's resolution happens via a system-level message!!

	Returns the promise's value, if it resolves. If it is rejected, then BrokenPromise is signalled.
	If a timeout is supplied, and it expires, returns the result of invoking `timeoutBlock`.

	For example, given an actor `a`,
		Actor waitForPromise: (a proxy + 4) for: nil ifTimedOut: nil
	will cause the current actor to 'block' (while remaining system-level responsive!!) until
	the promise of the plus-four is either resolved or rejected."
	[
		aPromise isResolved ifTrue: [^ aPromise value].
		aPromise isRejected ifTrue: [ BrokenPromise new promise: aPromise; signal ].
		(self processAtLeastOneMessageTimeout: msecsOrNil) ifFalse: [^ timeoutBlock value]
	] repeat! !

!ActorProcess methodsFor: 'internal-accessing' stamp: 'tonyg 2/6/2018 22:50'!
receiveNext
	"Protected. Internal. Retrieve the next available user-level message in the queue.
	Do not call from outside the actor's thread of control."
	^ self receiveNextTimeout: nil! !

!ActorProcess methodsFor: 'internal-accessing' stamp: 'tonyg 1/29/2018 11:39'!
receiveNextOrNil
	"Protected. Internal. Retrieve the next available user-level message in the queue, or nil
	if none are currently available. Do not call from outside the actor's thread of control."
	^ pendingMessages isEmpty
		ifTrue: [ nil ]
		ifFalse: [
			self tracer traceDeliveredMessage: pendingMessages first.
			pendingMessages removeFirst ]! !

!ActorProcess methodsFor: 'internal-accessing' stamp: 'tonyg 2/6/2018 22:51'!
receiveNextTimeout: anIntegerOrNil
	"Protected. Internal. Retrieve the next available user-level message in the queue,
	or nil if a timeout was supplied and it expires before a user-level message arrives.
	Do not call from outside the actor's thread of control."
	[ pendingMessages isEmpty ] whileTrue: [
		(self processAtLeastOneMessageTimeout: anIntegerOrNil) ifFalse: [
			self tracer traceReceiveNextTimeout.
			^ nil] ].
	self tracer traceDeliveredMessage: pendingMessages first.
	^ pendingMessages removeFirst! !

!ActorProcess methodsFor: 'tracing' stamp: 'tonyg 1/29/2018 11:04'!
tracer
	^ tracer ifNil: [self class defaultTracer]! !

!ActorProcess class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 17:35'!
boot: bootBlock
	"Starts and returns an ActorProcess running the given bootBlock as its main routine."
	^ self boot: bootBlock name: nil! !

!ActorProcess class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 17:34'!
boot: bootBlock link: aBoolean
	"Starts and returns an ActorProcess running the given bootBlock as its main routine.
	If aBoolean is true, links the new ActorProcess to the currently-running Process."
	^ self boot: bootBlock link: aBoolean name: nil! !

!ActorProcess class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 17:34'!
boot: bootBlock link: aBoolean name: aStringOrNil
	"Starts and returns an ActorProcess running the given bootBlock as its main routine.
	If aBoolean is true, links the new ActorProcess to the currently-running Process."
	^ self boot: bootBlock priority: Processor activePriority link: aBoolean name: aStringOrNil! !

!ActorProcess class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 17:36'!
boot: bootBlock name: aStringOrNil
	"Starts and returns an ActorProcess running the given bootBlock as its main routine."
	^ self boot: bootBlock link: false name: aStringOrNil! !

!ActorProcess class methodsFor: 'instance creation' stamp: 'tonyg 1/24/2020 22:53'!
boot: bootBlock priority: anInteger link: aBoolean name: aStringOrNil
	"As #boot:link:, but with explicit priority and name."
	| peerToLink actor |
	peerToLink _ aBoolean ifTrue: [Actor current] ifFalse: [nil].
	actor _ self
		forContext:
			[actor boot: bootBlock link: peerToLink.
			"v See comment in BlockClosure>>newProcess."
			Processor terminateActive] asContext
		priority: anInteger.
	aStringOrNil ifNotNil: [ actor name: aStringOrNil ].
	Actor current ownTracer ifNotNil: [:tracer | actor tracer: tracer].
	Actor current tracer traceActorCreated: actor.
	actor resume.
	^ actor! !

!ActorProcess class methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 20:06'!
current
	"Retrieves the currently-running ActorProcess instance. Really, just retrieves the current
	Process, though. NOTE: You will need to call #proxy on the result if you need an ActorProxy!!"
	^ Processor activeProcess! !

!ActorProcess class methodsFor: 'accessing' stamp: 'tonyg 1/29/2018 11:05'!
defaultTracer
	^ DefaultTracer ifNil: [DefaultTracer _ ActorEventTracer new]! !

!ActorProcess class methodsFor: 'accessing' stamp: 'tonyg 1/29/2018 12:01'!
defaultTracer: anActorEventTracer
	DefaultTracer _ anActorEventTracer! !

!ActorProcess class methodsFor: 'accessing' stamp: 'jpb 6/21/2020 12:27:32'!
newMailboxQueue
	MailboxQueueClass ifNil: [
		"Lazily initialize with either SharedQueue2 (Squeak) or SharedQueue (Pharo)."
		MailboxQueueClass _ Smalltalk at: #MonitoredSharedQueue ifAbsent: [ Smalltalk at: #SharedQueue ] ].
	^ MailboxQueueClass new! !

!ActorProcess class methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 20:07'!
receiveNext
	"To be called from within an Actor's main thread of execution.
	See ActorProcess>>#receiveNext."
	^ self current receiveNext! !

!ActorProcess class methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 20:07'!
receiveNextOrNil
	"To be called from within an Actor's main thread of execution.
	See ActorProcess>>#receiveNextOrNil."
	^ self current receiveNextOrNil! !

!ActorProcess class methodsFor: 'accessing' stamp: 'tonyg 2/14/2018 15:27'!
receiveNextTimeout: anIntegerOrNil
	"To be called from within an Actor's main thread of execution.
	See ActorProcess>>#receiveNextTimeout:."
	^ self current receiveNextTimeout: anIntegerOrNil! !

!ActorProcess class methodsFor: 'accessing' stamp: 'tonyg 2/19/2017 12:31'!
receiveUntil: aBlock
	"Repeatedly retrieve user-level messages, passing them to `aBlock`, until `aBlock` returns true."
	[ aBlock value: self receiveNext ] whileFalse: []! !

!ActorProcess class methodsFor: 'debugging' stamp: 'tonyg 2/6/2018 18:01'!
loggingActorNamed: aString
	"Spawns and returns an actor (proxy) which simply logs every user-level message it receives to its tracer."
	"Compare to ActorBehavior >> logAll:."
	| a |
	a _ self
		boot: [ [ | msg |
				msg _ ActorProcess receiveNext.
				Actor current tracer traceLogAll: {'received '. msg}.
				(msg isKindOf: ActorRequest) ifTrue: [ msg resolveWith: nil ].
			] repeat ]
		name: aString.
	^ a proxy! !

!ActorProcess class methodsFor: 'sending' stamp: 'tonyg 2/18/2017 20:07'!
send: anActor message: m
	"Sends a user-level request message to `anActor`."
	^ anActor sendMessage: m! !

!ActorProcess class methodsFor: 'terminating' stamp: 'tonyg 2/18/2017 20:08'!
terminateNormally
	"Terminates the currently-running Actor normally."
	self terminateWith: nil! !

!ActorProcess class methodsFor: 'terminating' stamp: 'tonyg 2/12/2018 17:10'!
terminateWith: aReason
	"Terminates the currently-running Actor, either 'normally' (if `aReason` is nil) or
	'abnormally' (otherwise)."
	self current terminateWith: aReason! !

!Actor methodsFor: 'accessing' stamp: 'tonyg 2/16/2017 18:11'!
behavior
	^ behavior! !

!Actor methodsFor: 'accessing' stamp: 'tonyg 1/29/2018 11:49'!
behavior: anObject
	"It's unusual but not forbidden to replace the behavior object of an Actor after it has started running."
	self tracer traceNewBehavior: anObject.
	behavior _ anObject! !

!Actor methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 19:43'!
caller
	"Public. Internal. Call this from within a method on a behavior object in order to reify
	the remote actor's context that invoked the method. Normally, such a method would
	return a value which would automatically be sent to `currentRemoteContinuation`, but
	in some cases it's desirable to 'capture' the context in order to store it somewhere and
	reply later. This method does just that. After #caller has returned, no automatic reply
	to the remote actor's request will be produced; it is at that point the responsibility of
	whoever called #caller."
	| c |
	c _ currentRemoteContinuation.
	currentRemoteContinuation _ nil.
	^ c! !

!Actor methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 19:45'!
sender
	"Public. Non-destructively retrieves the identity of the sending actor, if there is one.
	Call this from within a behavior object method to learn who the caller was without
	disturbing `currentRemoteContinuation`; compare to #caller."
	^ currentRemoteContinuation sender! !

!Actor methodsFor: 'private-lifecycle management' stamp: 'tonyg 2/18/2017 19:39'!
boot: bootBlock link: actorOrNil
	"Private. Effectively extends `bootBlock` with initialization of `behavior` and entry to
	the main `dispatchLoop`."
	^ super boot: [ self behavior: bootBlock value. self dispatchLoop ] link: actorOrNil! !

!Actor methodsFor: 'private-lifecycle management' stamp: 'tonyg 1/24/2020 22:28'!
extractBlockedUIProcess
	| p prio list |
	p _ self extractUIProcess ifNil: [^nil].
	"Squeak's isBlocked method is not present in Pharo."
	prio _ p priority.
	list _ p suspendingList.
	"We are not blocked if there's no suspending list, or there is, but it's the runnable queue."
	(list isNil or: [list == (Processor waitingProcessesAt: prio)]) ifTrue: [^nil].
	^ p! !

!Actor methodsFor: 'private-lifecycle management' stamp: 'tonyg 1/24/2020 22:18'!
extractUIProcess
	"Squeak and Pharo differ on how to access the current UI process."
	"Squeak goes through class Project; Pharo, through the UIManager."
	"Perhaps Squeak will add `UIManager default uiProcess` someday; we defer to it if it is present."

	(UIManager default respondsTo: #uiProcess) ifTrue: [^ UIManager default uiProcess].
	(SmalltalkImage current hasClassNamed: #Project) ifTrue: [^ (SmalltalkImage current at: #Project) uiProcess].
	"Give up: this is developer-convenience code anyway."
	^nil! !

!Actor methodsFor: 'private-lifecycle management' stamp: 'tonyg 1/24/2020 22:24'!
interruptUIProcessIfNecessary
	| uiProcess c candidatePromise |

	uiProcess _ self extractBlockedUIProcess ifNil: [^self].
	c _ uiProcess suspendedContext.
	c method = (Promise >> #wait) ifFalse: [
		c method = (Promise >> #waitTimeoutMSecs:) ifFalse: [^self]].
	candidatePromise _ c receiver.
	(candidatePromise isKindOf: ActorPromise) ifFalse: [^self].

	"The UI process is blocked on some ActorPromise here."
	"If it's one of ours, or it's still waiting on the same one in a few hundred ms, interrupt the UI process."
	"This is terribly hacky."
	(
		(pendingContinuations anySatisfy: [:r | r promise == candidatePromise]) or: [
			(Delay forMilliseconds: 500) wait.
			uiProcess == self extractBlockedUIProcess ifFalse: ["It changed while we were waiting!!" ^self].
			c _ uiProcess suspendedContext.
			c method = (Promise >> #wait) ifFalse: [
				c method = (Promise >> #waitTimeoutMSecs:) ifFalse: [^self]].
			candidatePromise == c receiver]
	) ifTrue: [
		uiProcess signalException:
			(Halt new messageText: 'UI process paused to allow a background halt to show'; yourself)].! !

!Actor methodsFor: 'private-lifecycle management' stamp: 'tonyg 1/27/2020 14:48'!
postExitCleanup
	"Protected. Internal. Rejects all pending continuations before doing other cleanup work.
	Finally, if our behavior responds to #postExitCleanup:, invoke that method as well. See
	comment in ActorProcess>>#postExitCleanup."
	| workset error |
	workset _ pendingContinuations.
	pendingContinuations _ IdentitySet new.
	error _ ActorTerminated actor: self reason: self exitReason.
	workset do: [:c | c rejectWith: error].
	super postExitCleanup.
	(behavior respondsTo: #postExitCleanup:) ifTrue: [ behavior postExitCleanup: self exitReason ].! !

!Actor methodsFor: 'printing' stamp: 'tonyg 2/18/2017 19:40'!
browserPrintStringWith: anObject
	"Customise the appearance of this process in the ProcessBrowser."
	"Ignore anObject, which is the name that has been suggested, in favour of our own behavior."
	^ super browserPrintStringWith: self printString! !

!Actor methodsFor: 'private-message handling' stamp: 'tonyg 2/18/2017 19:43'!
dispatchLoop
	"Private. Repeatedly processes user-level messages. Invoked indirectly by #boot:link:."
	[ self handleRequest: self receiveNext ] repeat.! !

!Actor methodsFor: 'private-message handling' stamp: 'tonyg 2/6/2018 23:35'!
handleRequest: aRequest
	"Private. Given a user-level message that has been received by this actor, dispatch it
	to our behavior object, taking care to propagate any exceptions appropriately.
	If the invoked behavior method doesn't call #caller, then when *we* do, it will
	return non-nil, and we will return a result or an exception to the remote peer.
	As a small convenience, if the behavior method returns just the behavior object itself,
	we rewrite that here to the ActorProxy representing the actor."
	| answer |
	self tracer traceHandleRequest: aRequest.
	currentRemoteContinuation _ self registerContinuationFor: aRequest.
	answer _ (aRequest message) sendTo: behavior.
	behavior == answer ifTrue: [answer _ self proxy].
	self caller ifNotNil: [:c | c resolveWith: answer].! !

!Actor methodsFor: 'private-message handling' stamp: 'tonyg 2/18/2017 19:50'!
linkedPeer: anActor terminatedWith: anException
	"Protected. Internal. Delegates to behavior if behavior is interested; else does the default thing."
	((behavior respondsTo: #linkedPeer:terminatedWith:) and: [self isTerminated not])
		ifTrue: [ behavior linkedPeer: anActor terminatedWith: anException ]
		ifFalse: [ super linkedPeer: anActor terminatedWith: anException ]
! !

!Actor methodsFor: 'private-message handling' stamp: 'tonyg 2/18/2018 20:39'!
peer: anActor monitor: aReference terminatedWith: anException
	"Protected. Internal. Delegates to behavior. If a monitor was requested, we require that the behavior be able to handle its activation."
	self isTerminated ifFalse: [ behavior peer: anActor monitor: aReference terminatedWith: anException ]
! !

!Actor methodsFor: 'private-message handling' stamp: 'tonyg 2/15/2018 17:44'!
rejectMessage: aRequest
	"Protected. Internal. Overrides ActorProcess. Provides cleanup action for user-level request
	messages that will never be executed."
	aRequest rejectWith: (ActorTerminated actor: self reason: self exitReason).
	^ super rejectMessage: aRequest! !

!Actor methodsFor: 'private-request management' stamp: 'tonyg 2/18/2017 19:53'!
finishRequest: request
	"Private. ActorRequest>>#notifyWorker calls this to signal that `request` is no longer our
	responsibility: it has either been replied to already or delegated to someone else."
	pendingContinuations remove: request ifAbsent: [].
! !

!Actor methodsFor: 'private-request management' stamp: 'tonyg 2/6/2018 22:16'!
registerContinuationFor: request
	"Private. Registers the receiver as a dependency of `request` (see #finishRequest:), and
	adds it to our `pendingContinuations` table in case we terminate before we reply."
	request isAsync ifFalse: [
		request worker: self.
		pendingContinuations add: request ].
	^ request
! !

!Actor methodsFor: 'initialization' stamp: 'tonyg 2/19/2017 10:29'!
initialize
	super initialize.
	behavior _ nil.
	currentRemoteContinuation _ nil.
	pendingContinuations _ IdentitySet new.! !

!Actor class methodsFor: 'accessing instances and variables' stamp: 'tonyg 2/19/2020 10:05'!
allInstancesWithBehavior: anActorBehaviorClass
	| c |
	c _ OrderedCollection new.
	self allInstancesDo: [:a |
		(a behavior isKindOf: anActorBehaviorClass) ifTrue: [c add: a]].
	^ c! !

!Actor class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 19:24'!
bootLinkProxy: bootBlock
	^ self bootLinkProxy: bootBlock name: nil! !

!Actor class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 19:24'!
bootLinkProxy: bootBlock name: aStringOrNil
	"As ActorProcess>>#boot:name:, but always links the new actor, and returns
	an ActorProxy instead of an Actor."
	^ (self boot: bootBlock link: true name: aStringOrNil) proxy! !

!Actor class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 19:24'!
bootProxy: bootBlock
	^ self bootProxy: bootBlock name: nil! !

!Actor class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 19:24'!
bootProxy: bootBlock name: aStringOrNil
	"As ActorProcess>>#boot:name:, but returns an ActorProxy instead of an Actor."
	^ (self boot: bootBlock name: aStringOrNil) proxy! !

!Actor class methodsFor: 'instance creation' stamp: 'tonyg 2/18/2017 20:13'!
for: anObject
	"Spawns a new Actor on an existing behavior object. Compare to #boot:, which takes
	a block which *yields* the behavior object to use."
	^ self for: anObject link: false! !

!Actor class methodsFor: 'instance creation' stamp: 'tonyg 2/18/2017 20:13'!
for: anObject link: aBoolean
	"Spawns and optionally links a new Actor on an existing behavior object. Compare to
	#boot:, which takes a block which *yields* the behavior object to use."
	^ self boot: [ anObject ] link: aBoolean
! !

!Actor class methodsFor: 'replying' stamp: 'tonyg 2/18/2017 20:12'!
caller
	"See Actor>>#caller."
	^ self current caller! !

!Actor class methodsFor: 'replying' stamp: 'tonyg 2/18/2017 09:13'!
callerError: aString
	self rejectCallerWith: (Error new messageText: aString)! !

!Actor class methodsFor: 'replying' stamp: 'tonyg 2/15/2018 17:45'!
rejectCallerWith: aReason
	self caller rejectWith: aReason! !

!Actor class methodsFor: 'replying' stamp: 'tonyg 2/18/2017 09:15'!
resolveCallerWith: anObject
	self caller resolveWith: anObject! !

!Actor class methodsFor: 'replying' stamp: 'tonyg 2/4/2018 13:03'!
sender
	"See Actor>>#sender."
	^ self current sender! !

!Actor class methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 13:01'!
me
	^ self current proxy! !

!Actor class methodsFor: 'sending' stamp: 'tonyg 2/18/2017 11:14'!
sendAsyncRequest: aMessage to: anActor
	(ActorRequest asyncMessage: aMessage) sendTo: anActor.
	^ nil! !

!Actor class methodsFor: 'sending' stamp: 'tonyg 2/4/2018 12:13'!
sendRequest: aMessage to: anActor
	| promise |
	promise _ ActorPromise new.
	(ActorRequest message: aMessage sender: Actor current promise: promise) sendTo: anActor.
	^ promise! !

!ActorProcessTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 17:29'!
testDoubleLinkReasonPropagation
	| a b |
	a _ ActorProcess boot: [ Actor receiveNext ].
	b _ ActorProcess boot: [ a link. Actor receiveNext ].
	a sendMessage: #go.
	(Delay forMilliseconds: 50) wait.
	self assert: a isTerminated.
	self assert: nil equals: a exitReason.
	self assert: b isTerminated.
	self assert: nil equals: b exitReason exitReason.
	self assert: a equals: b exitReason actor.! !

!ActorProcessTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/25/2017 12:54'!
testEvaluateBlock
	"Tests the private-ish functionality offered by evaluateBlockInternally:."
	| a flag |
	a _ ActorProcess boot: [ ActorProcess receiveUntil: [false] ].
	flag _ false.
	a evaluateBlockInternally: [ flag _ true ].
	(Delay forMilliseconds: 50) wait.
	self assert: flag.
	a terminate.
	self assert: a isTerminated.
	flag _ false.
	a evaluateBlockInternally: [ flag _ true ].
	self assert: flag.
	self assert: a isTerminated.
! !

!ActorProcessTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 17:27'!
testExceptionsAreCaught
	| a |
	a _ ActorProcess boot: [self assert: Actor receiveNext = #go. self error: 'oh dear'].
	a sendMessage: #go.
	(Delay forMilliseconds: 50) wait.
	self assert: a isTerminated.
	self assert: a exitReason messageText = 'oh dear'.! !

!ActorProcessTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/6/2018 23:17'!
testNonTimeout
	| a p |
	a _ SimpleWorkerActor spawn.
	[
		p _ a work: [ (Delay forMilliseconds: 10) wait. 'finished' ].
		self assert: 'finished' equals: (p waitFor: 100 ifTimedOut: [self fail: 'Expected an answer by now'])
	] ensure: [a actor terminate]! !

!ActorProcessTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/6/2018 23:16'!
testTimeout
	| a p |
	a _ SimpleWorkerActor spawn.
	[
		p _ a work: [ (Delay forMilliseconds: 100) wait. 'finished' ].
		p waitFor: 10 ifTimedOut: [^ self].
		self fail: 'Expected a timeout'
	] ensure: [a actor terminate]! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 6/4/2020 20:49'!
disconnectAndWaitForObservation
	| u me myName |
	me _ testUser.
	myName _ me myName wait.
	self disconnectTestUser.
	u _ self otherUser.
	[u seenUsers wait includes: myName] whileFalse.
	[u presentUsers wait includes: myName] whileTrue.
	^ u allStanzas wait last! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:04'!
disconnectTestUser
	"HACK: We wait until we have learned our own name, because otherwise
	with very short test cases, we send all our output, then close the socket,
	which causes the server-side to get RST because the first thing it does is
	try to print a list of room inhabitants, before it tries to read anything, and
	that in turn causes the bytes we sent to be discarded."	
	testUser ifNil: [^self].
	(testUser myName whenResolved: [:n | testUserName _ n]; yourself)
		waitTimeoutSeconds: 1.
	testUser actor kill.
	testUser _ nil.
! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 19:04'!
otherUser
	^ ChatRoomTestResource current user! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 15:02'!
setUp
	testUser _ ChatRoomTestUser spawn.! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 19:27'!
tearDown
	self disconnectTestUser.! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:12'!
testLineBlankBlankNoLFDelay2
	self testScenario: {'one', String lf, String lf, String lf. #pause} expected: {'one'. ''. ''}.! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:12'!
testLineBlankBlankNoLFNoDelay
	self testScenario: {'one', String lf, String lf, String lf} expected: {'one'. ''. ''}.! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:09'!
testLineBlankNoLFDelay1
	self testScenario: {'one', String lf. #pause. String lf} expected: {'one'. ''}.! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:11'!
testLineBlankNoLFNoDelay
	self testScenario: {'one', String lf, String lf} expected: {'one'. ''}.! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 13:12'!
testOneLineNoLFNoDelay
	self testScenario: {'hi'} expected: {'hi'}.! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:07'!
testScenario: instructions expected: lines
	| stanza |
	instructions do: [:i |
		i caseOf: {
			[#pause] -> [(Delay forMilliseconds: 50) wait].
		} otherwise: [testUser send: i]].
	stanza _ self disconnectAndWaitForObservation.
	self assert: stanza key = testUserName.
	self assert: stanza value asArray = lines asArray.! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:08'!
testTwoLinesNoLFDelay1
	self testScenario: {'one', String lf. #pause. 'two'} expected: {'one'. 'two'}.! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:08'!
testTwoLinesNoLFDelay2
	self testScenario: {'one', String lf. 'two'. #pause} expected: {'one'. 'two'}.! !

!ChatRoomTests methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:08'!
testTwoLinesNoLFNoDelay
	self testScenario: {'one', String lf. 'two'} expected: {'one'. 'two'}.! !

!ChatRoomTests class methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 13:06'!
resources
	^ {ChatRoomTestResource}! !

!SharedQueueActorAdditionsTests methodsFor: 'as yet unclassified' stamp: 'jpb 6/21/2020 12:27:32'!
setUp
	q _ MonitoredSharedQueue new.! !

!SharedQueueActorAdditionsTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 09:39'!
testEmptyNextTimeoutNonzero
	self assert: nil equals: (q nextTimeout: 10).! !

!SharedQueueActorAdditionsTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 09:39'!
testEmptyNextTimeoutZero
	self assert: nil equals: (q nextTimeout: 0).! !

!SharedQueueActorAdditionsTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 09:46'!
testFeedNextTimeoutNil
	| p proc |
	p _ Promise new.
	proc _ [ p resolveWith: (q nextTimeout: nil) ] fork.
	[
		(Delay forMilliseconds: 10) wait.
		self assert: p isResolved not.
		self assert: p isRejected not.
		q nextPut: 123.
		(Delay forMilliseconds: 10) wait.
		self assert: p isResolved.
		self assert: 123 equals: p value.
	] ensure: [
		proc terminate.
	]! !

!SharedQueueActorAdditionsTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 09:46'!
testFeedNextTimeoutNonzero
	| p proc |
	p _ Promise new.
	proc _ [ p resolveWith: (q nextTimeout: 10000) ] fork.
	[
		(Delay forMilliseconds: 10) wait.
		self assert: p isResolved not.
		self assert: p isRejected not.
		q nextPut: 123.
		(Delay forMilliseconds: 10) wait.
		self assert: p isResolved.
		self assert: 123 equals: p value.
	] ensure: [
		proc terminate.
	]! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 1/29/2018 13:29'!
setUp
	testActor _ SimpleTestActor spawn.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 1/29/2018 13:29'!
tearDown
	testActor actor kill.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 1/28/2018 17:30'!
testAddOneTo
	self assert: 4 equals: (testActor addOneTo: 3) wait.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 1/29/2018 14:36'!
testAsyncSelfDelegation
	self assert: 2 equals: (testActor asynchronouslyDelegateComputationTo: testActor using: 1) wait.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 17:46'!
testAsyncSelfDelegationWithError
	self should: [(testActor asynchronouslyDelegateComputationTo: testActor using: 0) wait]
		raise: BrokenPromise
		withExceptionDo: [:e | self assert: ZeroDivide equals: e promise error exitReason class]! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 1/29/2018 14:39'!
testAsyncTransformation
	self assert: 77 equals: (testActor asynchronouslyTransformResultOfCallTo: testActor) wait.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/13/2018 16:52'!
testChangeSignallingExnOK
	| otherActor1 otherActor2 otherActor3 result1 result2 result3 |
	result1 _ result2 _ result3 _ 0.
	[
		otherActor1 _ SimpleTestActor spawn.
		otherActor2 _ SimpleTestActor spawn.
		otherActor3 _ SimpleTestActor spawn.
		otherActor1 blocking updateHandler: [:aspect | result1 _ result1 + 1].
		otherActor2 blocking updateHandler: [:aspect | result2 _ result2 + 1. self error: 'deliberately erroring'].
		otherActor3 blocking updateHandler: [:aspect | result3 _ result3 + 1].
		testActor addDependent: otherActor1.
		testActor addDependent: otherActor2.
		testActor addDependent: otherActor3.
		testActor async changed: #harmless.
		testActor async changed: #harmless.
		20 timesRepeat: [World doOneSubCycle].
		self assert: 2 equals: result1.
		self assert: 1 equals: result2.
		self assert: 2 equals: result3.
		self assert: 2 equals: testActor blocking dependents size.
	] ensure: [
		otherActor1 ifNotNil: [otherActor1 actor kill].
		otherActor2 ifNotNil: [otherActor2 actor kill].
		otherActor3 ifNotNil: [otherActor3 actor kill].
	]! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/13/2018 17:12'!
testChangeSignallingFromObject
	| o result |
	testActor blocking updateHandler: [:aspect | result _ aspect].
	o _ Object new.
	o addDependent: testActor.
	o changed: #harmless.
	10 timesRepeat: [World doOneSubCycle].
	self assert: #harmless equals: result.
! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/13/2018 17:12'!
testChangeSignallingFromObjectWithArgument
	| o result arg |
	testActor blocking updateHandler: [:aspect :a | result _ aspect. arg _ a ].
	o _ Object new.
	o addDependent: testActor.
	o changed: #harmless with: 1234.
	10 timesRepeat: [World doOneSubCycle].
	self assert: #harmless equals: result.
	self assert: 1234 equals: arg.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/13/2018 16:26'!
testChangeSignallingOK
	| otherActor1 otherActor2 result1 result2 |
	[
		otherActor1 _ SimpleTestActor spawn.
		otherActor2 _ SimpleTestActor spawn.
		otherActor1 blocking updateHandler: [:aspect | result1 _ aspect].
		otherActor2 blocking updateHandler: [:aspect | result2 _ aspect].
		testActor addDependent: otherActor1.
		testActor addDependent: otherActor2.
		testActor async changed: #harmless.
		10 timesRepeat: [World doOneSubCycle].
		self assert: #harmless equals: result1.
		self assert: #harmless equals: result2.
	] ensure: [
		otherActor1 ifNotNil: [otherActor1 actor kill].
		otherActor2 ifNotNil: [otherActor2 actor kill].
	]! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 1/29/2018 13:25'!
testDelegateComputationDeadlock
	self assert: ((testActor delegateComputationTo: testActor using: 1) waitTimeoutMSecs: 50) not
		description: 'Expected no answer to this request in the time allotted.'! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 1/29/2018 13:30'!
testDelegateComputationNoDeadlock
	| otherActor promise |
	[
		otherActor _ SimpleTestActor spawn.
		promise _ testActor delegateComputationTo: otherActor using: 1.
		self assert: (promise waitTimeoutMSecs: 50)
			description: 'Expected an answer to this request in the time allotted.'.
		self assert: 2 equals: promise value.
	] ensure: [
		otherActor ifNotNil: [otherActor actor kill]
	]! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 1/29/2018 13:18'!
testDivideBy
	self assert: 4 equals: (testActor divideOneBy: 1/4) wait.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 17:46'!
testDivideByZero
	[(testActor divideOneBy: 0) wait]
		on: BrokenPromise
		do: [:e | ^ self assert: ZeroDivide equals: e promise error exitReason class].
	self fail: 'Expected ZeroDivide BrokenPromise'! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:41'!
testIndirectAddOneTo
	self assert: 4 equals: (testActor slowlyIndirectlyAddOneTo: 3) wait.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:40'!
testLinkClientCrashWithIndirection
	| a p |
	a _ ActorProcess boot: [
		testActor actor link.
		p _ testActor slowlyIndirectlyAddOneTo: 0.
		Actor current kill].
	self waitForTerminationOf: a.
	self waitForTerminationOf: testActor.
	self assert: p isRejected.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:42'!
testLinkClientCrashWithRedirection
	| a p |
	a _ ActorProcess boot: [
		testActor actor link.
		p _ testActor slowlyRedirectToAddOneTo: 0.
		Actor current kill].
	self waitForTerminationOf: a.
	self waitForTerminationOf: testActor.
	self assert: p isRejected.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 17:28'!
testLinkServerCrash
	| a |
	a _ ActorProcess boot: [
		testActor actor link.
		testActor divideOneBy: 0.
		Actor receiveNext.
		self fail: 'Should not reach here - the link should have killed us'].
	self waitForTerminationOf: a.
	self assert: ZeroDivide equals: a exitReason exitReason class.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 20:31'!
testLocalRedirection
	self assert: #nullaryRedirect equals: (testActor nullaryRedirect waitFor: 500 ifTimedOut: [ #timeout ]).
	self assert: #nullaryRedirect equals: (testActor indirectNullaryRedirect waitFor: 500 ifTimedOut: [ #timeout ]).! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:56'!
testMonitorClientCrashWithIndirection
	| a p fired reason |
	a _ [
		"Use a regular Process for convenient convention about monitor references."
		"See Process >> triggerMonitor:on:withException:."
		testActor actor monitor: [ :e | fired _ true. reason _ e ].
		p _ testActor slowlyIndirectlyAddOneTo: 0] fork.
	self waitForTerminationOf: a.
	(Delay forMilliseconds: 10) wait.
	self assert: testActor actor isTerminated not.
	self assert: 1 equals: p wait.
	self assert: nil equals: fired.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:56'!
testMonitorClientCrashWithRedirection
	| a p fired reason |
	a _ [
		"Use a regular Process for convenient convention about monitor references."
		"See Process >> triggerMonitor:on:withException:."
		testActor actor monitor: [ :e | fired _ true. reason _ e ].
		p _ testActor slowlyRedirectToAddOneTo: 0] fork.
	self waitForTerminationOf: a.
	(Delay forMilliseconds: 10) wait.
	self assert: testActor actor isTerminated not.
	self assert: 1 equals: p wait.
	self assert: nil equals: fired.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 17:29'!
testMonitorServerCrash
	| a p fired reason |
	a _ [
		"Use a regular Process for convenient convention about monitor references."
		"See Process >> triggerMonitor:on:withException:."
		testActor actor monitor: [ :e | fired _ true. reason _ e ].
		p _ testActor divideOneBy: 0] fork.
	self waitForTerminationOf: a.
	self waitForTerminationOf: testActor.
	self waitUntil: [ p isResolved or: [p isRejected] ].
	self assert: p isRejected.
	self assert: fired.
	self assert: ZeroDivide equals: reason class.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:41'!
testRedirectingAddOneTo
	self assert: 4 equals: (testActor slowlyRedirectToAddOneTo: 3) wait.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:39'!
testSenderCrashBeforeReply
	| a p |
	a _ ActorProcess boot: [
		p _ testActor slowlyAddOneTo: 0.
		Actor current kill].
	self waitForTerminationOf: a.
	self assert: p isResolved not.
	self assert: 1 equals: p wait.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:41'!
testSlowAddOneTo
	self assert: 4 equals: (testActor slowlyAddOneTo: 3) wait.! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 1/24/2020 23:02'!
waitForTerminationOf: anActor
	| p deadline |
	deadline _ DateAndTime now + 100 milliSeconds.
	p _ (anActor isKindOf: Process) ifTrue: [ anActor ] ifFalse: [ anActor actor ].
	"^ cope with Process, ActorProcess, or ActorProxy instances"
	self waitUntil: [
		deadline < DateAndTime now ifTrue: [self error: 'Termination expected but didn''t happen'].
		p isTerminated]! !

!SimpleTestActorTests methodsFor: 'as yet unclassified' stamp: 'tonyg 1/24/2020 22:42'!
waitUntil: aBlock
	[aBlock value] whileFalse: [(Delay forMilliseconds: 10) wait]! !

!ChatRoomTestResource methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 19:04'!
accepting
	
	^ accepting
! !

!ChatRoomTestResource methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 19:04'!
accepting: anObject
	
	accepting _ anObject.
! !

!ChatRoomTestResource methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 19:04'!
room
	
	^ room
! !

!ChatRoomTestResource methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 19:04'!
room: anObject
	
	room _ anObject.
! !

!ChatRoomTestResource methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 19:04'!
user
	
	^ user
! !

!ChatRoomTestResource methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 19:04'!
user: anObject
	
	user _ anObject.
! !

!ChatRoomTestResource methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 16:05'!
setUp
	| startTime |
	accepting _ false.
	room _ ChatRoom spawn.
	startTime _ Time now.
	[
		((Time now subtractTime: startTime) asDuration > 2 seconds)
			ifTrue: [
				room actor kill.
				self error: 'Unable to start ChatRoom listener'].
		room isListening wait
	] whileFalse: [Processor yield].
	user _ ChatRoomTestUser spawn.! !

!ChatRoomTestResource methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:04'!
tearDown
	room actor kill.
	user actor kill.! !

!ActorBehavior methodsFor: 'updating' stamp: 'tonyg 2/7/2018 11:58'!
changed
	self changed: Actor me! !

!ActorBehavior methodsFor: 'updating' stamp: 'tonyg 1/27/2020 10:15'!
changed: aParameter
	self dependents do: [:d |
		(Promise forUIMessage: [d update: aParameter])
			whenRejected: [:ex | self removeDependent: d] bindActor ]! !

!ActorBehavior methodsFor: 'updating' stamp: 'tonyg 1/27/2020 10:15'!
changed: aParameter with: anObject
	self dependents do: [:d |
		(Promise forUIMessage: [d update: aParameter])
			whenRejected: [:ex | self removeDependent: d] bindActor ]! !

!ActorBehavior methodsFor: 'experimental-logging' stamp: 'tonyg 2/18/2017 09:42'!
log: anObject
	self logAll: {anObject}! !

!ActorBehavior methodsFor: 'experimental-logging' stamp: 'tonyg 1/29/2018 11:48'!
logAll: aCollection
	Actor current tracer traceLogAll: aCollection! !

!ActorBehavior methodsFor: 'as yet unclassified' stamp: 'tonyg 2/19/2020 13:33'!
stopWith: aReason
	"Polite shutdown request. See Supervisor>>#stopWith:."
	Actor caller resolveWith: nil.
	Actor terminateWith: aReason.! !

!ActorBehavior class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 19:25'!
spawn
	^ self spawnName: nil! !

!ActorBehavior class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 19:25'!
spawnLink
	^ self spawnLinkName: nil! !

!ActorBehavior class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 19:25'!
spawnLinkName: aStringOrNil
	"Spawns a new actor, with an instance of this class as its behavior, and links it to
	the currently-running Actor, finally returning the ActorProxy for the new Actor."
	^ Actor bootLinkProxy: [ self new ] name: aStringOrNil! !

!ActorBehavior class methodsFor: 'instance creation' stamp: 'tonyg 2/6/2018 19:25'!
spawnName: aStringOrNil
	"Spawns a new actor, with an instance of this class as its behavior, and returns its ActorProxy."
	^ Actor bootProxy: [ self new ] name: aStringOrNil! !

!SingletonActor class methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2020 14:18'!
createInstance
	^ self spawn! !

!SingletonActor class methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2020 14:18'!
instance
	(Instance isNil or: [Instance actor isTerminated]) ifTrue: [Instance _ self createInstance].
	^ Instance! !

!Supervisor methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 18:58'!
children
	"Retrieve a collection of the ActorProcesses currently under supervision."
	^ children values! !

!Supervisor methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 18:59'!
intensity: aNumber period: aDuration
	"Resets restart statistics, in part to avoid unwanted termination when lowering the limits."
	intensity _ aNumber.
	period _ aDuration.
	restartCount _ 0.
	lastRestartCountReset _ Time now.
! !

!Supervisor methodsFor: 'initialization' stamp: 'tonyg 2/19/2020 12:01'!
initialize
	super initialize.
	children _ IdentityDictionary new.
	shutdownPending _ false.
	shutdownReason _ nil.
	self intensity: 1 period: 5 seconds.! !

!Supervisor methodsFor: 'private' stamp: 'tonyg 2/19/2020 11:03'!
instantiateSpec: spec
	"`spec` should be a nullary block yielding an ActorProcess to supervise."
	| actor |
	actor _ spec value ifNil: [^ nil].
	actor _ actor actor. "correct potential accidental return of an ActorProxy."
	actor link.
	children at: spec put: actor.
	^ actor
! !

!Supervisor methodsFor: 'private' stamp: 'tonyg 2/20/2017 12:42'!
logRestart
	"Update statistics on recent restarts. If over the limit, terminate the supervisor."
	(Time now subtractTime: lastRestartCountReset) asDuration > period ifTrue: [
		restartCount _ 0.
		lastRestartCountReset _ Time now].
	restartCount _ restartCount + 1.
	restartCount > intensity ifTrue: [self stopWith: MaxRestartIntensityExceeded new].! !

!Supervisor methodsFor: 'private' stamp: 'tonyg 2/19/2020 13:54'!
stopWith: anExceptionOrNil
	"Sets a `shutdownReason` and begins the termination process for all supervisees.
	Eventually, after all their links trigger, this will cause the supervisor to terminate.
	See #linkedPeer:terminatedWith:."
	shutdownPending _ true.
	shutdownReason _ anExceptionOrNil.

	children valuesDo: [ :actor |
		| p q |
		p _ ActorPromise new.
		q _ actor proxy sync stopWith: anExceptionOrNil.
		q whenResolved: [p resolveWith: nil].
		q whenRejected: [p resolveWith: nil].
		[ (p waitTimeoutSeconds: 5) ifFalse: [actor terminate] ] fork].

	Actor caller resolveWith: nil.
	self shutdownImmediately.! !

!Supervisor methodsFor: 'monitoring and linking' stamp: 'tonyg 2/19/2020 13:27'!
linkedPeer: anActor terminatedWith: anException
	"Handle a terminated supervisee."
	| spec |
	spec _ children keyAtValue: anActor ifAbsent: [
		"An exit signal from something we don't manage!!"
		^ Actor current terminate].
	children removeKey: spec.

	anException ifNotNil: [self logRestart]. "Only care about abnormal termination"

	shutdownPending
		ifFalse: [self instantiateSpec: spec]
		ifTrue: [children isEmpty ifTrue: [self shutdownImmediately]]! !

!Supervisor methodsFor: 'monitoring and linking' stamp: 'tonyg 2/19/2020 13:27'!
shutdownImmediately
	shutdownReason
		ifNil: [Actor current terminate]
		ifNotNil: [shutdownReason signal]! !

!Supervisor methodsFor: 'supervision' stamp: 'tonyg 2/19/2020 12:03'!
supervise: spec
	"If we're not shutting down already, instantiate a new supervisee specification."
	shutdownPending ifTrue: [^ Actor rejectCallerWith: shutdownReason].
	^ self instantiateSpec: spec
! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 14:08'!
asDictionary
	| d |
	d _ Dictionary new.
	entries keysAndValuesDo: [:topic :vals |
		d at: topic put: vals keys].
	^ d! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 2/19/2020 12:20'!
assert: topic value: value
	| vals peers peer broadcastNeeded item |

	peer _ Actor sender.

	item _ SimpleDataspaceAssertion new.
	item peer: peer.
	item topic: topic.
	item datum: value.

	broadcastNeeded _ false.
	vals _ entries at: topic ifAbsentPut: [Dictionary new].
	peers _ vals at: value ifAbsentPut: [broadcastNeeded _ true. IdentityDictionary new].

	(peers at: peer ifAbsentPut: [IdentitySet new]) add: item.
	(self cleanupsFor: peer) add: item.

	broadcastNeeded ifTrue: [
		(subscriptions at: topic ifAbsent: [nil]) ifNotNil: [ :subs |
			subs do: [:s | s assertionHandler cull: value]].
		filters do: [:f | f assert: topic value: value]].

	^ item! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 14:07'!
at: topic
	^ (entries at: topic ifAbsent: [^#()]) keys! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 2/19/2020 12:20'!
at: topic whenAsserted: a whenRetracted: r
	| peer item |

	peer _ Actor sender.

	item _ SimpleDataspaceSubscription new.
	item peer: peer.
	item topic: topic.
	item assertionHandler: (ActorCallback wrap: a forActor: peer).
	item retractionHandler: (ActorCallback wrap: r forActor: peer).

	(subscriptions at: topic ifAbsentPut: [IdentitySet new]) add: item.
	(self cleanupsFor: peer) add: item.

	(entries at: topic ifAbsent: [nil]) ifNotNil: [:vals |
		vals keysDo: [:value | item assertionHandler cull: value]].

	^ item! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 13:28'!
cancel: item
	| peer |
	peer _ item peer.
	item cleanup: self.
	cleanups at: peer ifPresent: [:items |
		items remove: item.
		items ifEmpty: [
			cleanups removeKey: peer.
			peer actor unlink]].! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 2/19/2020 10:32'!
cleanupAssertion: item
	| items peers vals broadcastNeeded |

	vals _ entries at: item topic.
	peers _ vals at: item datum.
	items _ peers at: item peer.

	broadcastNeeded _ false.
	items remove: item.
	items ifEmpty: [peers removeKey: item peer].
	peers ifEmpty: [broadcastNeeded _ true. vals removeKey: item datum].
	vals ifEmpty: [entries removeKey: item topic].

	broadcastNeeded ifTrue: [
		(subscriptions at: item topic ifAbsent: [nil]) ifNotNil: [ :subs |
			subs do: [:s | s retractionHandler cull: item datum]].
		filters do: [:f | f retract: item topic value: item datum]]! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 14:44'!
cleanupFilter: item
	filters remove: item.! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 13:58'!
cleanupSubscription: item
	| subs |
	subs _ subscriptions at: item topic.
	subs remove: item.
	subs ifEmpty: [subscriptions removeKey: item topic].! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 13:25'!
cleanupsFor: peer
	^ cleanups at: peer ifAbsentPut: [
			peer actor link.
			IdentitySet new]! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 13:20'!
initialize
	super initialize.
	entries _ Dictionary new.
	subscriptions _ Dictionary new.
	filters _ IdentitySet new.
	cleanups _ IdentityDictionary new.
! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 14:47'!
linkedPeer: peer terminatedWith: exn
	cleanups at: peer ifPresent: [:items |
		cleanups removeKey: peer.
		items do: [:item | item cleanup: self]].! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 2/19/2020 12:21'!
retract: topic value: value
	^ (self someAssertionOf: topic value: value byActor: Actor sender)
			ifNil: [false]
			ifNotNil: [:item | self cancel: item. true]! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 2/19/2020 12:21'!
select: filterBlock whenAsserted: a whenRetracted: r
	| peer item |

	peer _ Actor sender.

	item _ SimpleDataspaceFilter new.
	item peer: peer.
	item filterBlock: filterBlock.
	item assertionHandler: (ActorCallback wrap: a forActor: peer).
	item retractionHandler: (ActorCallback wrap: r forActor: peer).

	filters add: item.
	(self cleanupsFor: peer) add: item.

	entries keysAndValuesDo: [:topic :vals |
		vals keysDo: [:value | item assert: topic value: value]].

	^ item! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 2/19/2020 10:28'!
someAssertionOf: topic value: value byActor: anActor
	"Returns an *unspecified* assertion of the given topic and value by the given actor, or nil"
	^ entries at: topic ifPresent: [:vals |
			vals at: value ifPresent: [:peers |
				peers at: anActor ifPresent: [:items |
					items anyOne]]]! !

!SimpleDataspace methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 15:21'!
whenAsserted: a whenRetracted: r
	^ self select: [:topic :value | true] whenAsserted: a whenRetracted: r! !

!BarrierActor methodsFor: 'accessing' stamp: 'tonyg 2/18/2018 19:12'!
barrierWait
	waiters add: Actor caller.! !

!BarrierActor methodsFor: 'accessing' stamp: 'tonyg 2/17/2017 15:15'!
releaseWaiters
	self releaseWaiters: nil! !

!BarrierActor methodsFor: 'accessing' stamp: 'tonyg 2/17/2017 15:15'!
releaseWaiters: anObject
	waiters do: [ :c | c resolveWith: anObject ].
	waiters _ IdentitySet new.! !

!BarrierActor methodsFor: 'private' stamp: 'tonyg 2/18/2017 07:28'!
initialize
	super initialize.
	waiters _ IdentitySet new.
! !

!CellActor methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 19:54'!
contents
	waiters
		ifNil: [^ contents]
		ifNotNil: [waiters add: Actor caller]! !

!CellActor methodsFor: 'accessing' stamp: 'tonyg 4/23/2017 11:14'!
contents: anObject
	contents _ anObject.
	waiters ifNotNil: [ :w |
		waiters _ nil.
		w do: [ :c | c resolveWith: anObject ] ].! !

!CellActor methodsFor: 'private' stamp: 'tonyg 3/5/2017 19:19'!
initialize
	super initialize.
	waiters _ IdentitySet new.
	contents _ nil.! !

!ChatRoom methodsFor: 'private' stamp: 'tonyg 2/18/2017 12:48'!
agentDeparted: agent
	present at: agent ifPresent: [:username |
		present removeKey: agent.
		self announce: (MessageCatcher new departed: username).]! !

!ChatRoom methodsFor: 'private' stamp: 'tonyg 2/18/2017 10:12'!
announce: aMessage 
	present keys do: [:a | aMessage sendTo: a]! !

!ChatRoom methodsFor: 'private' stamp: 'tonyg 2/18/2017 16:30'!
generateUsername
	^ 'user', (counter _ counter + 1) asString! !

!ChatRoom methodsFor: 'private' stamp: 'tonyg 2/4/2018 12:19'!
initialize
	super initialize.
	present _ Dictionary new.
	counter _ 0.
	isListening _ false.
	serverSock _ ServerSocketActor listenOnPort: 5999.
	serverSock issueCredit wait.
! !

!ChatRoom methodsFor: 'private' stamp: 'tonyg 2/12/2018 17:10'!
linkedPeer: anActor terminatedWith: aReason
	(present includesKey: anActor proxy) ifTrue: [^ self agentDeparted: anActor proxy].
	Actor terminateWith: aReason.! !

!ChatRoom methodsFor: 'chat user events' stamp: 'tonyg 2/18/2017 13:14'!
changeUsernameFor: anActor to: aString
	| oldName |
	oldName _ present at: anActor ifAbsent: [nil].
	present at: anActor put: aString.
	oldName ifNotNil: [
		self announce: (MessageCatcher new usernameChangeFrom: oldName to: aString)].! !

!ChatRoom methodsFor: 'chat user events' stamp: 'tonyg 2/18/2017 20:19'!
user: who said: what
	self announce: (MessageCatcher new user: who said: what)! !

!ChatRoom methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 13:33'!
isListening
	^ isListening! !

!ChatRoom methodsFor: 'TCP listener events' stamp: 'tonyg 2/4/2018 12:19'!
tcpServer: serverSock accepted: conn
	| username agent room |
	serverSock issueCredit.
	username _ self generateUsername.
	room _ Actor me.
	agent _ Actor bootLinkProxy: [
		ChatUserAgent new initializeUsername: username conn: conn room: room ].
	(conn controllingActor: agent) wait.
	agent initialNames: present copy.
	self announce: (MessageCatcher new arrived: username).
	present at: agent put: username.
! !

!ChatRoom methodsFor: 'TCP listener events' stamp: 'tonyg 3/5/2017 13:32'!
tcpServer: serverSock ready: aBoolean
	isListening _ aBoolean.
	isListening
		ifTrue: [self log: 'Chat server listening.']
		ifFalse: [self log: 'Chat server not listening; server socket not ready.']! !

!ChatUserAgent methodsFor: 'chat room events' stamp: 'tonyg 3/5/2017 18:01'!
arrived: who
	self sendLine: who, ' arrived.'! !

!ChatUserAgent methodsFor: 'chat room events' stamp: 'tonyg 3/5/2017 18:01'!
departed: who 
	self sendLine: who, ' departed.'
! !

!ChatUserAgent methodsFor: 'chat room events' stamp: 'tonyg 1/28/2018 15:21'!
initialNames: names
	names isEmpty
		ifTrue: [ self sendLine: 'Noone is in the room but you.' ]
		ifFalse: [
			"Avoid Squeak's joinSeparatedBy: method here, since Pharo lacks it, having
			instead a join: method (where the receiver is the separator)."
			self sendLine: (String streamContents:
				[ :s |
					s nextPutAll: 'Users present: '.
					names do: [ :name | s nextPutAll: name ] separatedBy: [ s nextPutAll: ', ' ].
					s nextPutAll: '.' ]) ].
	self sendLine: 'Your name is ', username, '.'.
	conn delimiterMode: String lf.
	conn issueCredit.! !

!ChatUserAgent methodsFor: 'chat room events' stamp: 'tonyg 3/5/2017 18:04'!
sendLine: line
	conn sendLine: line! !

!ChatUserAgent methodsFor: 'chat room events' stamp: 'tonyg 3/5/2017 18:01'!
user: who said: what
	who = username ifFalse: [self sendLine: who, ': ', what]! !

!ChatUserAgent methodsFor: 'chat room events' stamp: 'tonyg 3/5/2017 18:01'!
usernameChangeFrom: oldName to: newName
	self sendLine: 'User ', oldName, ' changed name to ', newName, '.'.! !

!ChatUserAgent methodsFor: 'private' stamp: 'tonyg 2/18/2017 12:51'!
initializeUsername: u conn: c room: r
	username _ u.
	conn _ c.
	room _ r.! !

!ChatUserAgent methodsFor: 'TCP socket events' stamp: 'tonyg 3/5/2017 18:56'!
tcpSocket: sock data: line
	sock issueCredit.
	
	(line beginsWith: '/nick ') ifTrue: [
		username _ line allButFirst: 6.
		room changeUsernameFor: Actor me to: username.
		^ self].
	
	line = '/quit' ifTrue: [
		Actor current terminate.
		^ self].

	room user: username said: line.
! !

!ChatUserAgent methodsFor: 'TCP socket events' stamp: 'tonyg 2/7/2018 11:27'!
tcpSocketClosed: sock reason: reason
	Actor terminateNormally! !

!ControlledActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/7/2018 18:00'!
controllingActor: anActor
	"Public. Gives control over this ControlledActor to some other actor. Can only be
	called if either no controllingActor has been set, or if the calling actor is the existing
	controllingActor."
	controllingActor ifNotNil: [
		Actor sender = controllingActor ifFalse: [ ^ Actor callerError: 'Not owner' ].
		controllingActor unlink.
		self controllingActorRemoved: controllingActor ].
	controllingActor _ anActor actor.
	controllingActor link.
	self controllingActorAdded: controllingActor.! !

!ControlledActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/7/2018 18:00'!
controllingActorAdded: anActor
	"Subclasses may override this."! !

!ControlledActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/7/2018 18:00'!
controllingActorRemoved: anActor
	"Subclasses may override this."! !

!ServerSocketActor methodsFor: 'private' stamp: 'tonyg 2/18/2017 16:19'!
acceptOneFrom: s actor: a
	"Runs in a separate process."
	| conn |
	[
		[
			(s notNil and: [s isValid]) ifFalse:
				[(Delay forSeconds: 2) wait.
				^ a setupSocket ].
			conn _ socket waitForAcceptFor: 2 ifTimedOut: [nil].
			(conn notNil and: [conn isConnected])
				ifTrue: [^ a socketAccepted: conn ].
		] repeat
	] ensure: [
		a resetAcceptProcess
	]! !

!ServerSocketActor methodsFor: 'private' stamp: 'tonyg 2/18/2017 16:05'!
destroySocket
	socket ifNotNil: [socket destroy. socket _ nil].! !

!ServerSocketActor methodsFor: 'private' stamp: 'tonyg 2/4/2018 13:12'!
initialize
	super initialize.
	hostname _ nil.
	portNumber _ nil.
	backlog _ nil.
	socket _ nil.
	ready _ nil.
	credit _ 0.
	acceptProcess _ nil.! !

!ServerSocketActor methodsFor: 'private' stamp: 'tonyg 2/7/2018 11:30'!
postExitCleanup: reason
	self destroySocket.! !

!ServerSocketActor methodsFor: 'private' stamp: 'tonyg 2/4/2018 16:15'!
reportSocketReady: newReadiness
	(ready ~= newReadiness) ifTrue:
			[self logAll: {
				newReadiness ifTrue: ['Listening'] ifFalse: ['Unable to listen'].
				' on TCP host '. hostname. ', port '. portNumber. ' with backlog '. backlog}.
			controllingActor ifNotNil: [:a | a proxy async tcpServer: Actor me ready: newReadiness]].
	ready _ newReadiness.
	ready
		ifTrue: [self issueCredit: 0]
		ifFalse: [self destroySocket].! !

!ServerSocketActor methodsFor: 'private' stamp: 'tonyg 2/18/2017 10:00'!
resetAcceptProcess
	acceptProcess ifNotNil: [acceptProcess terminate].
	acceptProcess _ nil.
	self issueCredit: 0! !

!ServerSocketActor methodsFor: 'private' stamp: 'tonyg 2/18/2017 16:25'!
setupSocket
	socket ifNotNil: [socket destroy].
	socket _ Socket newTCP.
	socket initializeNetwork.
	[socket bindTo: ((NetNameResolver addressForName: hostname) asSocketAddress port: portNumber)]
		on: SocketPrimitiveFailed do: [:ex | ^ self reportSocketReady: false].
	socket listenOn: portNumber backlogSize: backlog.
	socket isValid ifFalse: [^ self reportSocketReady: false].
	self reportSocketReady: true.! !

!ServerSocketActor methodsFor: 'private' stamp: 'tonyg 2/4/2018 16:15'!
socketAccepted: conn
	| s |
	s _ SocketActor forSocket: conn controllingActor: controllingActor.
	controllingActor proxy async tcpServer: Actor me accepted: s.
	self issueCredit: -1.! !

!ServerSocketActor methodsFor: 'accepting' stamp: 'tonyg 2/18/2017 20:27'!
issueCredit
	"Allows the receiver to accept one more connection."
	self issueCredit: 1.
! !

!ServerSocketActor methodsFor: 'accepting' stamp: 'tonyg 2/18/2017 20:28'!
issueCredit: amount
	"Allows the receiver to accept `amount` more connections. The `amount` may be
	negative, in which case the final `credit` is clamped to be non-negative."
	| thisActor |
	credit _ (credit + amount) max: 0.
	((credit > 0) and: [acceptProcess isNil]) ifTrue: [
		thisActor _ Actor me.
		acceptProcess _ [ self acceptOneFrom: socket actor: thisActor ] fork ].
! !

!ServerSocketActor methodsFor: 'accepting' stamp: 'tonyg 2/18/2017 12:42'!
stop
	Actor terminateNormally.! !

!ServerSocketActor methodsFor: 'configuration' stamp: 'tonyg 2/18/2017 15:59'!
listenOnHost: hostname port: portNumber
	^ self listenOnHost: hostname port: portNumber backlogSize: 128 "Larger than the usual default of 4. Sensible (?) for today's faster internet and machines"! !

!ServerSocketActor methodsFor: 'configuration' stamp: 'tonyg 2/18/2017 15:59'!
listenOnHost: aString port: aPortNumber backlogSize: aBacklog
	hostname _ aString.
	portNumber _ aPortNumber.
	backlog _ aBacklog.
	self setupSocket.! !

!ServerSocketActor class methodsFor: 'instance creation' stamp: 'tonyg 2/18/2017 18:28'!
listenOnHost: hostname port: portNumber
	| initialController |
	initialController _ Actor current.
	^ Actor bootProxy: [ | beh |
		beh _ self new.
		initialController isActor ifTrue: [beh controllingActor: initialController].
		beh listenOnHost: hostname port: portNumber.
		beh]! !

!ServerSocketActor class methodsFor: 'instance creation' stamp: 'tonyg 2/18/2017 15:59'!
listenOnPort: portNumber
	^ self listenOnHost: '0.0.0.0' port: portNumber! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 2/18/2017 11:23'!
convertObjectForSending: anObject
	^ (anObject isKindOf: ByteArray)
		ifTrue: [ anObject ]
		ifFalse: [ anObject asString squeakToUtf8 asByteArray ]! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 2/6/2018 22:20'!
initialize
	super initialize.
	me _ Actor me.
	socket _ nil.
	stream _ nil.
	credit _ 0.
	readWorker _ SimpleWorkerActor spawnLink.
	writeWorker _ SimpleWorkerActor spawnLink.
	readAction _ nil.
	finalSignalSent _ false.
	lineTerminator _ String lf.
	self rawMode. "TODO: Good default?"! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 6/4/2020 21:49'!
initializeHost: hostname port: portNumber
	socket ifNotNil: [socket closeAndDestroy].
	[
		[
			(SocketAddressInformation
				forHost: hostname
				service: portNumber asString
				flags: 0
				addressFamily: SocketAddressInformation addressFamilyUnspecified
				socketType: SocketAddressInformation socketTypeStream
				protocol: SocketAddressInformation protocolTCP) do: [:sai |
				socket ifNil: [
					[self initializeSocket: sai connect]
						on: NetworkError do: [:ex | "Ignore, and try the next one in the list"]]].
		] on: SocketPrimitiveFailed do: [:ex | ^ self internalCloseSocket: ex]
	] on: NetworkError do: [:ex | ^ self internalCloseSocket: ex].
	(socket notNil and: [socket isValid]) ifFalse: [^ self internalCloseSocket: nil].
	socket ifNotNil: [
		controllingActor proxy async tcpSocketConnected: me].! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 2/18/2017 12:44'!
initializeSocket: aSocket
	socket _ aSocket.
	stream _ SocketStream on: aSocket.
	stream binary.
	stream noTimeout.! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 3/5/2017 18:35'!
internalCheckAtEnd
	(stream isDataAvailable not and: [stream atEnd]) ifTrue: [ConnectionClosed signal].! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 2/7/2018 11:22'!
internalCloseSocket: reason
	socket ifNotNil: [socket closeAndDestroy. socket _ nil].
	finalSignalSent ifTrue: [^ self] ifFalse: [finalSignalSent _ true].
	credit _ 0.
	controllingActor proxy async tcpSocketClosed: me reason: reason! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 1/28/2018 15:10'!
internalDelimiterModeAction: delimiter binary: aBoolean
	^ self
		internalSocketAction: [ | buf dataWasAvailable |
			self internalCheckAtEnd.
			stream shouldSignal: false.
			dataWasAvailable _ stream isDataAvailable.
			buf _ stream upToAll: delimiter.
			stream shouldSignal: true.
			
			"The following logic attempts to disambiguate between (A) the socket just closing, making buf empty, or (B) getting an empty line (for example), making buf empty, and *then* the socket closing. In case (A), we must signal ConnectionClosed. In case (B), we must not signal ConnectionClosed, and must instead return buf.

			If SocketStream maintained a count of bytes consumed, this would be trivial. As it stands, the logic is hairy.

			Case analysis:

			 - by cases of dataWasAvailable
			    - true: it is certain that buf will be nonempty.
			    - false: by cases of recentlyRead
			       - zero: by cases on upToAll:limit: having read any data at all
			         from the socket
			          - no: is buf empty?
			             - no: absurd
			             - yes: empty, but not from having reached the delimiter,
			               and we should internalCheckAtEnd.
			          - yes: is buf empty?
			             - no: we must not internalCheckAtEnd.
			             - yes: absurd, because by assumption upToAll:limit:
			               managed to read some data, so accumulated a nonempty
			               buffer before returning
			       - positive: upToAll:limit: either found the delimiter, or hit
			         its internal limit. we must not internalCheckAtEnd.

			Truth table:

			dataWasAvailable?	recentlyRead>0?	buf size = 0?	internalCheckAtEnd?
				Y					-					N				N
				N					Y					-				N
				N					N					Y				Y <--
				N					N					N				N

			The following statement captures the marked row."
			((dataWasAvailable not
				and: [stream recentlyRead = 0])
				and: [buf size = 0])
				ifTrue: [self internalCheckAtEnd].

			buf]
		andThen: [:chunk |
			aBoolean
				ifTrue: [ chunk ]
				ifFalse: [ chunk asString utf8ToSqueak ] ]! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 3/5/2017 12:07'!
internalRawModeActionBinary: useBinary
	^ self internalSocketAction: [
		[ | buf |
			buf _ stream nextAvailable.
			buf size > 0 ifTrue: [^ useBinary ifTrue: [buf] ifFalse: [buf asString]].
			self internalCheckAtEnd.
			stream waitForData.
		] repeat.
	] andThen: []! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 2/4/2018 16:13'!
internalSignalSocketTimeout
	credit _ 0.
	controllingActor proxy async tcpSocketTimeout: me.! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 2/7/2018 11:23'!
internalSocketAction: aBlock andThen: anotherBlock
	^ anotherBlock cull:
		([[aBlock
			on: ConnectionClosed do: [:ex | self internalCloseSocket: ex. ^ nil]]
				on: ConnectionTimedOut do: [:ex | self internalSignalSocketTimeout. ^ nil]]
					on: SocketPrimitiveFailed do: [:ex | self internalCloseSocket: ex. ^ nil])! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 2/7/2018 11:31'!
postExitCleanup: reason
	self internalCloseSocket: reason! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 2/4/2018 16:14'!
scheduleNextReadAction
	credit > 0 ifTrue: [ | currentReadAction |
		credit _ credit - 1.
		currentReadAction _ readAction. "In case it changes between now and the worker doing the work."
		(readWorker work: [ currentReadAction value ifNotNil: [:buf | controllingActor proxy async tcpSocket: me data: buf ]])
			whenResolved: [ self scheduleNextReadAction ]]! !

!SocketActor methodsFor: 'private' stamp: 'tonyg 2/12/2018 20:12'!
tailSendWorker: worker work: aBlock
	Actor caller redirectTo: worker selector: #work: argument: aBlock! !

!SocketActor methodsFor: 'configuration' stamp: 'tonyg 2/18/2017 13:05'!
delimiterMode: delimiter
	self delimiterMode: delimiter binary: false
! !

!SocketActor methodsFor: 'configuration' stamp: 'tonyg 2/18/2017 20:35'!
delimiterMode: delimiter binary: aBoolean
	"Sets the unit of work to be a ByteArray or String (according to `aBoolean`) up to the
	next occurence of the bytes/characters in `delimiter`. For example, to get CRLF-separated
	lines of text,

			sock delimiterMode: String crlf binary: false
	or		sock delimiterMode: String crlf
			
	or to get bytes up to the next *double* crlf, as seen in email and HTTP headers,
	
			sock delimiterMode: String crlfcrlf"

	readAction _ [ self internalDelimiterModeAction: delimiter binary: aBoolean ].! !

!SocketActor methodsFor: 'configuration' stamp: 'tonyg 2/19/2017 12:34'!
rawMode
	"Sets the unit of work to be the next arbitrarily large ByteArray to be read from the
	underlying Socket."
	readAction _ [ self internalRawModeActionBinary: true ].! !

!SocketActor methodsFor: 'configuration' stamp: 'tonyg 2/19/2017 12:34'!
rawModeAscii
	"Sets the unit of work to be the next arbitrarily large *ASCII* (not UTF-8!!) String to be read from the
	underlying Socket."
	readAction _ [ self internalRawModeActionBinary: false ].! !

!SocketActor methodsFor: 'receiving' stamp: 'tonyg 2/19/2017 10:47'!
infiniteCredit
	"Sets credit to infinity, allowing data to be read and delivered as fast as it arrives.
	THIS IS USUALLY NOT A GOOD IDEA. Useful for testing, and in tightly controlled situations,
	but in the wild this can overwhelm your image with input."
	self issueCredit: Float infinity.! !

!SocketActor methodsFor: 'receiving' stamp: 'tonyg 2/18/2017 20:36'!
issueCredit
	"Allows the receiver to relay one more unit of input from the underlying Socket."
	self issueCredit: 1! !

!SocketActor methodsFor: 'receiving' stamp: 'tonyg 2/18/2017 20:37'!
issueCredit: amount
	"Allows the receiver to accept `amount` more units of input from the underlying Socket.
	The `amount` may be negative, in which case the final `credit` is clamped to be
	non-negative."
	| oldCredit |
	oldCredit _ credit.
	credit _ (credit + amount) max: 0.
	oldCredit = 0 ifTrue: [self scheduleNextReadAction].
! !

!SocketActor methodsFor: 'receiving' stamp: 'tonyg 2/19/2017 10:46'!
zeroCredit
	"Sets credit to zero, preventing future read work (other than anything that has already completed
	or is currently running, but hasn't been fully delivered to the controlling actor yet)."
	credit _ 0.
	self issueCredit: 0. "Trigger scheduling checks etc."
! !

!SocketActor methodsFor: 'accessing' stamp: 'tonyg 6/4/2020 21:33'!
isConnected
	^ socket notNil! !

!SocketActor methodsFor: 'accessing' stamp: 'tonyg 2/6/2018 22:20'!
lineTerminator
	^ lineTerminator! !

!SocketActor methodsFor: 'accessing' stamp: 'tonyg 2/6/2018 22:20'!
lineTerminator: aString
	lineTerminator _ aString.! !

!SocketActor methodsFor: 'accessing' stamp: 'tonyg 2/7/2018 12:41'!
remoteAddressPortString
	^ socket ifNotNil: [:s | s remoteAddressPortString]! !

!SocketActor methodsFor: 'accessing' stamp: 'tonyg 2/4/2018 12:20'!
stop
	self zeroCredit.
	(writeWorker work: []) wait.
	readWorker actor terminate.
	Actor resolveCallerWith: nil.
	Actor terminateNormally.! !

!SocketActor methodsFor: 'sending' stamp: 'tonyg 2/18/2017 20:37'!
send: anObject
	"Sends the given ByteArray or `asString`able through the Socket."
	self sendAll: {anObject}.! !

!SocketActor methodsFor: 'sending' stamp: 'tonyg 6/4/2020 20:15'!
sendAll: aCollection
	"Sends each ByteArray or `asString`able in `aCollection` through the Socket."
	| s |
	s _ socket. "Local on-stack reference, in case while the worker is waiting to send our data, the socket is closed and nil'd"
	s ifNotNil: [
		self tailSendWorker: writeWorker work: [
			aCollection do: [ :anObject | s sendData: (self convertObjectForSending: anObject) ]]].
! !

!SocketActor methodsFor: 'sending' stamp: 'tonyg 2/6/2018 22:20'!
sendLine: aString 
	self sendAll: {aString. self lineTerminator}! !

!SocketActor class methodsFor: 'private' stamp: 'tonyg 2/19/2017 10:21'!
connectToHost: hostname port: portNumber
	| a |
	a _ Actor current.
	^ Actor bootProxy: [ self new controllingActor: a; initializeHost: hostname port: portNumber ]
! !

!SocketActor class methodsFor: 'private' stamp: 'tonyg 2/18/2017 10:06'!
forSocket: socket controllingActor: anActor
	^ Actor bootProxy: [ self new initializeSocket: socket; controllingActor: anActor ]! !

!MorphActor methodsFor: 'morphic' stamp: 'tonyg 1/27/2020 10:17'!
buildMorph
	| builder spec |
	morph ifNotNil: [^ Promise unit: morph].
	builder _ ToolBuilder default.
	spec _ self buildSpecWith: builder.
	^ (Promise forUIMessage: [spec buildWith: builder]) >>= [:m |
			morph _ m. 
			self customizeMorph: m builtWith: builder.
			m] bindActor! !

!MorphActor methodsFor: 'morphic' stamp: 'tonyg 2/12/2018 21:20'!
buildProxyStub
	^ {
		#windowClosed -> [ nil ].
	}! !

!MorphActor methodsFor: 'morphic' stamp: 'tonyg 2/12/2018 21:14'!
buildSpecWith: builder
	self subclassResponsibility! !

!MorphActor methodsFor: 'morphic' stamp: 'tonyg 2/12/2018 21:52'!
customizeMorph: aMorph builtWith: builder
	"Default is to do nothing here. Subclasses may extend this."! !

!MorphActor methodsFor: 'morphic' stamp: 'tonyg 1/27/2020 10:18'!
open
	^ self buildMorph >>= [:m |
			Promise forUIMessage: [m openAsTool]. "Ensure UI operations happen in the UI process."
			m]! !

!MorphActor methodsFor: 'morphic' stamp: 'tonyg 2/12/2018 21:21'!
windowTitle
	^ self class name! !

!MorphActor methodsFor: 'initialize-release' stamp: 'tonyg 2/12/2018 21:14'!
initialize
	super initialize.
	model _ ActorProxyModel new proxy: Actor me.! !

!MorphActor methodsFor: 'initialize-release' stamp: 'tonyg 2/12/2018 21:20'!
postExitCleanup: reason
	morph ifNotNil: [
		model proxyStub: self buildProxyStub.
		morph abandon.
		morph _ model _ nil]! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/12/2018 16:11'!
appendBoldText: aStringOrText
	output async appendText: aStringOrText asText allBold! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/12/2018 16:13'!
appendItalicText: aStringOrText
	| t |
	t _ aStringOrText asText.
	t addAttribute: TextEmphasis italic from: 1 to: t size.
	output async appendText: t! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/12/2018 16:09'!
appendText: aStringOrText
	output async appendText: aStringOrText! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/7/2018 17:40'!
connectionButtonLabel
	^ self isConnected ifTrue: ['disconnect'] ifFalse: ['connect']! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/7/2018 17:24'!
connectionSpecsValid
	^ nextHostName notNil and: [nextPortNumber notNil]! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/7/2018 17:39'!
connectionStateChanged
	self changed: #connectionState.
	self changed: #windowTitle.! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/12/2018 21:53'!
customizeMorph: aMorph builtWith: builder
	(builder widgetAt: #inputField) acceptOnCR: true.! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/7/2018 13:25'!
tcpSocket: s data: line
	s == sock ifFalse: [^self].
	self log: 'Got line: ', line.
	s issueCredit.
	self appendText: line, String cr.! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/12/2018 16:11'!
tcpSocketClosed: s reason: reason
	s == sock ifFalse: [^self].
	self logAll: {'TCP socket closed: '. reason}.
	self appendBoldText: '---------------- disconnection reason: ', reason printString, String cr.
	self disconnect.! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/13/2018 02:44'!
tcpSocketConnected: aSocketActor
	self appendBoldText: '---------------- connected to ', currentHostName, ' port ', currentPortNumber asString, String cr.! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/12/2018 22:33'!
userInput: aText fromMorph: aMorph
	self sendLine: aText asString.
	aMorph setText: '' asText.! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/7/2018 12:50'!
windowClosed
	Actor caller resolveWith: nil.
	Actor current terminate! !

!DemoSocketTerminal methodsFor: 'private' stamp: 'tonyg 2/12/2018 21:29'!
windowTitle
	^ super windowTitle,
		(sock
			ifNil: [' (disconnected)']
			ifNotNil: [' (connected to ', currentHostName, ' port ', currentPortNumber asString, ')'])! !

!DemoSocketTerminal methodsFor: 'morphic' stamp: 'tonyg 2/12/2018 21:22'!
buildSpecWith: builder
	| spec |
	spec _ builder pluggableWindowSpec new
		model: model;
		label: #windowTitle;
		closeAction: #windowClosed;
		children: OrderedCollection new;
		yourself.
	spec children add: ((output blocking buildSpecWith: builder)
		frame: (0@0 corner: 1@0.9);
		yourself).
	spec children add: (builder pluggableTextSpec new
		model: model;
		getText: #nextHostName;
		editText: #nextHostName:;
		indicateUnacceptedChanges: false;
		frame: (0@0.9 corner: 0.4@0.95);
		yourself).
	spec children add: (builder pluggableTextSpec new
		model: model;
		getText: #nextPortNumber;
		editText: #nextPortNumber:;
		indicateUnacceptedChanges: false;
		frame: (0.4@0.9 corner: 0.8@0.95);
		yourself).
	spec children add: (builder pluggableButtonSpec new
		model: model;
		action: #toggleConnection;
		label: #connectionButtonLabel;
		changeLabelWhen: #connectionState;
		frame: (0.8@0.9 corner: 1@0.95);
		yourself).
	spec children add: (builder pluggableTextSpec new
		model: model;
		name: #inputField;
		setText: #userInput:fromMorph:;
		indicateUnacceptedChanges: false;
		frame: (0@0.95 corner: 1@1);
		yourself).
	^ spec! !

!DemoSocketTerminal methodsFor: 'connecting and disconnecting' stamp: 'tonyg 2/15/2018 17:13'!
connect
	self connectionSpecsValid ifFalse: [^self].
	sock ifNotNil: [ sock actor unlink. sock blocking stop. sock _ nil ].
	sock _ SocketActor connectToHost: nextHostName port: nextPortNumber.
	currentHostName _ nextHostName.
	currentPortNumber _ nextPortNumber.
	sock delimiterMode: String lf.
	sock issueCredit.
	self connectionStateChanged.! !

!DemoSocketTerminal methodsFor: 'connecting and disconnecting' stamp: 'tonyg 2/12/2018 18:21'!
disconnect
	sock ifNil: [^self].
	sock actor unlink.
	sock blocking stop.
	sock _ nil.
	currentHostName _ nil.
	currentPortNumber _ nil.
	self connectionStateChanged.
	self appendBoldText: '---------------- disconnected', String cr.! !

!DemoSocketTerminal methodsFor: 'connecting and disconnecting' stamp: 'tonyg 2/7/2018 17:39'!
toggleConnection
	self isConnected ifTrue: [ self disconnect ] ifFalse: [ self connect ]! !

!DemoSocketTerminal methodsFor: 'initialize-release' stamp: 'tonyg 2/12/2018 21:32'!
initialize
	super initialize.
	output _ TerminalOutputMorphActor spawnLink.
	nextHostName _ 'localhost'.
	nextPortNumber _ 5999.! !

!DemoSocketTerminal methodsFor: 'testing' stamp: 'tonyg 2/7/2018 17:38'!
isConnected
	^ sock notNil! !

!DemoSocketTerminal methodsFor: 'accessing' stamp: 'tonyg 2/7/2018 17:32'!
nextHostName
	^ nextHostName! !

!DemoSocketTerminal methodsFor: 'accessing' stamp: 'tonyg 2/7/2018 17:25'!
nextHostName: aText
	nextHostName _ aText asString! !

!DemoSocketTerminal methodsFor: 'accessing' stamp: 'tonyg 2/7/2018 17:32'!
nextPortNumber
	^ nextPortNumber asString! !

!DemoSocketTerminal methodsFor: 'accessing' stamp: 'tonyg 2/7/2018 17:31'!
nextPortNumber: aText
	aText asString asInteger ifNotNil: [ :n | nextPortNumber _ n ]! !

!DemoSocketTerminal methodsFor: 'accessing' stamp: 'tonyg 2/12/2018 22:34'!
sendLine: aString
	self appendItalicText: aString, String cr.
	sock ifNotNil: [ sock sendLine: aString ].! !

!TerminalOutputMorphActor methodsFor: 'accessing' stamp: 'tonyg 2/12/2018 15:35'!
appendText: aStringOrText
	buffer _ buffer, aStringOrText.
	self changed: #appendEntry.! !

!TerminalOutputMorphActor methodsFor: 'accessing' stamp: 'tonyg 2/12/2018 15:37'!
characterLimit
	^ 4096 "Backlog size"! !

!TerminalOutputMorphActor methodsFor: 'accessing' stamp: 'tonyg 2/12/2018 21:35'!
clear
	self changed: #clearText.! !

!TerminalOutputMorphActor methodsFor: 'morphic' stamp: 'tonyg 2/12/2018 21:31'!
buildSpecWith: builder
	^ builder pluggableTextSpec new
		model: model;
		getText: #contents;
		indicateUnacceptedChanges: false;
		yourself! !

!TerminalOutputMorphActor methodsFor: 'private' stamp: 'tonyg 2/12/2018 15:37'!
contents
	| chunk |
	chunk _ buffer.
	 "Apparently, for appendEntry, the protocol is that the getText selector should answer the text to add - so we must reset?"
	buffer _ '' asText.
	^ chunk! !

!TerminalOutputMorphActor methodsFor: 'initialize-release' stamp: 'tonyg 2/12/2018 15:35'!
initialize
	super initialize.
	buffer _ '' asText.! !

!SimpleWorkerActor methodsFor: 'job submission' stamp: 'tonyg 2/18/2017 11:10'!
work: aBlock
	^ aBlock value! !

!ChatRoomTestUser methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 14:10'!
allStanzas
	
	^ allStanzas
! !

!ChatRoomTestUser methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 14:10'!
currentStanza
	
	^ currentStanza
! !

!ChatRoomTestUser methodsFor: 'accessing' stamp: 'tonyg 6/4/2020 20:48'!
myName
	^ myName! !

!ChatRoomTestUser methodsFor: 'accessing' stamp: 'tonyg 6/4/2020 20:48'!
myName: n
	myName resolveWith: n! !

!ChatRoomTestUser methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 14:10'!
presentUsers
	
	^ presentUsers
! !

!ChatRoomTestUser methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 19:30'!
seenUsers
	^ seenUsers! !

!ChatRoomTestUser methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 14:10'!
speakingUser
	
	^ speakingUser
! !

!ChatRoomTestUser methodsFor: 'accessing' stamp: 'tonyg 3/5/2017 19:24'!
speakingUser: aString
	speakingUser = aString ifTrue: [^self].
	speakingUser _ aString.
	speakingUser
		ifNil: [currentStanza _ nil]
		ifNotNil: [
			currentStanza _ OrderedCollection new.
			allStanzas add: speakingUser -> currentStanza]
! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 6/4/2020 21:33'!
initialize
	sock _ SocketActor connectToHost: 'localhost' port: 5999.
	sock isConnected wait ifFalse: [self error: 'Could not connect'].
	sock delimiterMode: String lf.
	sock issueCredit.
	seenUsers _ Set new.
	presentUsers _ Set new.
	speakingUser _ nil.
	currentStanza _ nil.
	allStanzas _ OrderedCollection new.
	myName _ ActorPromise new.! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 14:17'!
line: aString match: aRegexString do: aBlock
	| m captures |
	m _ aRegexString asRegex.
	(m matches: aString) ifFalse: [^self].
	captures _ (1 to: m subexpressionCount) collect: [:i | m subexpression: i].
	^ aBlock valueWithArguments: captures! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 19:30'!
markUserAbsent: n
	presentUsers remove: n! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 19:30'!
markUserPresent: n
	seenUsers add: n.
	presentUsers add: n! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 6/4/2020 20:48'!
postExitCleanup: reason
	myName rejectWith: nil! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 6/4/2020 20:23'!
say: utterance
	self send: utterance, String lf! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 6/4/2020 20:22'!
send: utterance
	sock ifNotNil: [sock send: utterance]! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 20:11'!
tcpSocket: aSocketActor data: aString
	| line |
	aSocketActor issueCredit.
	line _ aString withBlanksTrimmed.
	"self log: myName asString, ' >>> ', line."
	(line = 'Noone is in the room but you.') ifTrue: [
		presentUsers removeAll.
		^self].
	self line: line match: 'Your name is ([^.]+)\.' do: [ :whole :n |
		self myName: n.
		self markUserPresent: n.
		^self].
	self line: line match: '([^ ]+) arrived.' do: [ :whole :n |
		self markUserPresent: n.
		^self].
	self line: line match: '([^ ]+) departed.' do: [ :whole :n |
		self markUserAbsent: n.
		^self].
	self line: line match: 'Users present\: ([^.]+).' do: [ :whole :ns |
		(ns findTokens: ', ') do: [:n | self markUserPresent: n].
		^self].
	self line: line match: '([^:]+)\:' do: [ :whole :n |
		self user: n said: ''.
		^self].
	self line: line match: '([^:]+)\: (.*)' do: [ :whole :n :utterance |
		self user: n said: utterance.
		^self].
	self error: 'Unexpected input: ', line.! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 6/4/2020 20:57'!
tcpSocketClosed: anActorProxy reason: reason
	sock == anActorProxy ifFalse: [^ self].
	sock actor unlink.
	sock blocking stop.
	sock _ nil.
	myName rejectWith: reason.
	presentUsers removeAll.
	self speakingUser: nil.! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 2/13/2018 02:43'!
tcpSocketConnected: aSocketActor! !

!ChatRoomTestUser methodsFor: 'as yet unclassified' stamp: 'tonyg 3/5/2017 19:10'!
user: who said: what
	self speakingUser: who.
	currentStanza add: what.! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 1/28/2018 15:25'!
addOneTo: aNumber
	^ aNumber + 1! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 15:48'!
answerAfterMilliseconds: msec
	(Delay forMilliseconds: msec) wait.! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 1/29/2018 13:45'!
asynchronouslyDelegateComputationTo: anActorProxy using: aNumber
	^ (anActorProxy divideOneBy: aNumber)
		>>= [:tmp | anActorProxy addOneTo: tmp]
! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 1/28/2018 17:27'!
asynchronouslyTransformResultOfCallTo: anActorProxy
	| thisProcess |
	thisProcess _ Actor current.
	^ (anActorProxy addOneTo: 6)
		>>= [:tmp |
			(Actor current == thisProcess) ifFalse: [self error: 'Running callback in incorrect context!!'].
			tmp * 11]! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/4/2018 12:20'!
delegateComputationTo: anActorProxy using: aNumber
	| tmp |
	tmp _ (anActorProxy divideOneBy: aNumber) wait.
	tmp _ (anActorProxy addOneTo: tmp) wait.
	^ tmp! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 1/28/2018 15:26'!
divideOneBy: aNumber
	^ 1 / aNumber
! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 11:39'!
haltAndAnswer: anObject
	self halt.
	^ anObject! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 20:30'!
indirectNullaryRedirect
	^ self nullaryRedirect! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 20:29'!
nullaryRedirect
	Actor caller redirectTo: (self spawnOneshotSelectorEchoer)! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:27'!
slowlyAddOneTo: aNumber
	(Delay forMilliseconds: 50) wait.
	^ self addOneTo: aNumber
! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:35'!
slowlyIndirectlyAddOneTo: aNumber
	(Delay forMilliseconds: 50) wait.
	"Use an actual message send rather than an internal call."
	^ Actor current proxy addOneTo: aNumber
! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/5/2018 12:37'!
slowlyRedirectToAddOneTo: aNumber
	(Delay forMilliseconds: 50) wait.
	"Pass the request message on; cf. slowlyIndirectlyAddOneTo:."
	Actor caller redirectTo: Actor current message: (MessageCatcher new addOneTo: aNumber).! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 20:29'!
spawnOneshotSelectorEchoer
	^ ActorProcess boot: [ | r |
			r _ Actor receiveNext.
			r resolveWith: r message selector ]! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/19/2020 13:57'!
stopWith: aReason
	(aReason isKindOf: Number) ifTrue: [aReason milliseconds wait].
	super stopWith: aReason.! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/13/2018 16:06'!
update: anAspect
	^ updateHandler cull: anAspect cull: nil! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/13/2018 16:06'!
update: anAspect with: anObject
	^ updateHandler cull: anAspect cull: anObject! !

!SimpleTestActor methodsFor: 'as yet unclassified' stamp: 'tonyg 2/13/2018 16:05'!
updateHandler: aBlock
	updateHandler _ aBlock! !

!ActorCallback methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 22:24'!
cull: firstArg
	^ self promiseFor: [ block cull: firstArg ]! !

!ActorCallback methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 15:45'!
cull: firstArg cull: secondArg
	^ self promiseFor: [ block cull: firstArg cull: secondArg ]! !

!ActorCallback methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 22:13'!
initializeActor: anActor block: aBlock
	actor _ anActor.
	block _ aBlock.! !

!ActorCallback methodsFor: 'as yet unclassified' stamp: 'tonyg 2/13/2018 16:43'!
numArgs
	^ block numArgs! !

!ActorCallback methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 22:23'!
promiseFor: aBlock
	| p |
	p _ ActorPromise new.
	actor evaluateBlockInternally: [p resolveWith: aBlock value].
	^ p! !

!ActorCallback methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 22:23'!
value
	^ self promiseFor: block! !

!ActorCallback methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 22:24'!
value: firstArg
	^ self promiseFor: [ block value: firstArg ]! !

!ActorCallback methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 12:55'!
value: firstArg value: secondArg
	^ self promiseFor: [ block value: firstArg value: secondArg ]! !

!ActorCallback methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 22:23'!
valueWithArguments: anArray
	^ self promiseFor: [ block valueWithArguments: anArray ]! !

!ActorCallback class methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 12:52'!
wrap: aBlock
	^ self wrap: aBlock forActor: Actor current! !

!ActorCallback class methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 12:52'!
wrap: aBlock forActor: anActor
	^ self new initializeActor: anActor actor block: aBlock! !

!ActorEventTracer methodsFor: 'tracing' stamp: 'tonyg 1/29/2018 12:04'!
beDefault
	"Install the receiver as the default ActorEventTracer for the system. Note that each ActorProcess may have its own tracer, which is inherited by any children it spawns. See ActorProcess >> tracer:."
	ActorProcess defaultTracer: self! !

!ActorEventTracer methodsFor: 'tracing' stamp: 'tonyg 1/29/2018 12:46'!
doesNotUnderstand: aMessage
	^ (aMessage selector beginsWith: 'trace')
		ifTrue: [self handleTraceEvent: aMessage]
		ifFalse: [super doesNotUnderstand: aMessage]! !

!ActorEventTracer methodsFor: 'tracing' stamp: 'tonyg 1/29/2018 12:47'!
handleTraceEvent: aMessage
	^ self handleTraceEvent: aMessage sender: Actor current timestamp: DateAndTime now! !

!ActorEventTracer methodsFor: 'tracing' stamp: 'tonyg 1/29/2018 12:00'!
handleTraceEvent: aMessage sender: anActor timestamp: aDateAndTime
	"Subclasses may override this to capture trace data."! !

!ActorEventTracer methodsFor: 'tracing' stamp: 'tonyg 2/7/2018 10:52'!
traceException: exn
	self handleTraceEvent: (Message selector: #traceException: argument: exn).
	self logExceptionDetails: exn.
	debugExceptions ifTrue: [ exn pass ].! !

!ActorEventTracer methodsFor: 'tracing' stamp: 'tonyg 2/7/2018 10:47'!
traceLogAll: aCollection
	self logAll: aCollection withTimestamp: DateAndTime now! !

!ActorEventTracer methodsFor: 'accessing' stamp: 'tonyg 2/7/2018 09:46'!
debugExceptions
	^ debugExceptions! !

!ActorEventTracer methodsFor: 'accessing' stamp: 'tonyg 2/7/2018 09:46'!
debugExceptions: aBoolean
	debugExceptions _ aBoolean! !

!ActorEventTracer methodsFor: 'initialize-release' stamp: 'tonyg 2/7/2018 11:10'!
initialize
	super initialize.
	debugExceptions _ false.! !

!ActorEventTracer methodsFor: 'logging' stamp: 'tonyg 1/29/2018 12:10'!
logAll: aCollection withTimestamp: aDateAndTime
	self streamItems: aCollection to: Transcript fromProcess: Actor current withTimestamp: aDateAndTime! !

!ActorEventTracer methodsFor: 'logging' stamp: 'tonyg 1/24/2020 22:40'!
logExceptionDetails: exn
	| now |
	now _ DateAndTime now.
	{FileStream stderr. Transcript} do: [:s |
		self streamItems: {'Exception in '. Actor current printString. String cr} to: s fromProcess: Actor current withTimestamp: now.
		self class printException: exn verboselyOn: s. ]! !

!ActorEventTracer methodsFor: 'logging' stamp: 'tonyg 1/29/2018 12:19'!
streamItems: aCollection to: aStream fromProcess: aProcess withTimestamp: aDateAndTime
	aStream cr.
	aDateAndTime printYMDOn: aStream.
	aStream nextPutAll: ' '.
	aDateAndTime printHMSOn: aStream.
	aProcess ifNotNil:
		[ | isAlive |
		isAlive _ aProcess isTerminated not.
		aStream
			nextPutAll: (isAlive ifTrue: ' (' ifFalse: ' [[');
			nextPutAll: aProcess name;
			nextPutAll: (isAlive ifTrue: ') ' ifFalse: ']] ')].
	aCollection do: [:c | aStream nextPutAll: c asString].
	aStream flush.! !

!ActorEventTracer class methodsFor: 'printing' stamp: 'tonyg 1/24/2020 22:40'!
printException: exn verboselyOn: aStream 
	"Based on Squeak's Exception>>printVerboseOn:."
	aStream	nextPutAll: '------------------ '; nextPutAll: exn description; nextPutAll: ' ------------------'; cr.
	aStream nextPutAll: DateAndTime now asString; cr.
	aStream	nextPutAll: exn signalerContext longStack; cr.
	aStream nextPutAll: '================== '; nextPutAll: exn description; nextPutAll: ' =================='; cr.
	aStream flush.! !

!ActorEventStreamTracer methodsFor: 'accessing' stamp: 'tonyg 2/9/2018 13:08'!
addStream: aStreamBlock
	"NB. aStreamBlock is to be a block that *yields* a stream.
	This is used in 'rebooting' streams if they fail during writing (such as a standard-error stream does if you quit and then reload the image)."
	streams at: aStreamBlock put: aStreamBlock value! !

!ActorEventStreamTracer methodsFor: 'tracing' stamp: 'tonyg 2/7/2018 12:14'!
handleTraceEvent: aMessage sender: anActor timestamp: aDateAndTime
	self streamsDo: [:stream |
		self streamItems: aMessage printString to: stream fromProcess: anActor withTimestamp: aDateAndTime]! !

!ActorEventStreamTracer methodsFor: 'tracing' stamp: 'tonyg 1/24/2020 22:38'!
streamsDo: aBlock
	| toRemove errStream |
	toRemove _ errStream _ nil.
	streams associationsDo: [:a |
		[aBlock value: a value]
			on: FileWriteError do: [:ex1 |
				a value: a key value.
				[aBlock value: a value]
					on: FileWriteError do: [:ex2 |
						toRemove ifNil: [toRemove _ OrderedCollection new].
						toRemove add: a key.
						errStream ifNil: [errStream _ FileStream stderr].
						errStream nextPutAll: 'Could not reinitialize failed ', self class name, ' stream.'; cr; lf.
						self class printException: ex2 verboselyOn: errStream.
						errStream flush ] ] ].
	toRemove ifNotNil: [
		toRemove do: [:aStreamBlock |
			streams removeKey: aStreamBlock ifAbsent: [] ] ]! !

!ActorEventStreamTracer methodsFor: 'initialize-release' stamp: 'tonyg 2/7/2018 12:16'!
initialize
	super initialize.
	streams _ IdentityDictionary new.! !

!ActorEventStreamTracer methodsFor: 'logging' stamp: 'tonyg 2/7/2018 12:14'!
logAll: aCollection withTimestamp: aDateAndTime
	self streamsDo: [:stream |
		self streamItems: aCollection to: stream fromProcess: Actor current withTimestamp: aDateAndTime]! !

!ActorEventStreamTracer methodsFor: 'logging' stamp: 'tonyg 1/24/2020 22:38'!
logExceptionDetails: exn
	self streamsDo: [:stream | self class printException: exn verboselyOn: stream].! !

!ActorEventStreamTracer class methodsFor: 'as yet unclassified' stamp: 'tonyg 2/7/2018 12:24'!
forStderr
	^ self new
		addStream: [ FileStream stderr ];
		yourself! !

!ActorEventStreamTracer class methodsFor: 'as yet unclassified' stamp: 'tonyg 2/7/2018 12:25'!
forTranscript
	^ self new
		addStream: [ Transcript ];
		addStream: [ FileStream stderr ];
		yourself! !

!ActorProxy methodsFor: 'accessing' stamp: 'tonyg 2/17/2017 14:37'!
actor
	^ actor! !

!ActorProxy methodsFor: 'accessing' stamp: 'tonyg 2/18/2017 12:52'!
proxy
	^ self! !

!ActorProxy methodsFor: 'dependents access' stamp: 'tonyg 2/13/2018 16:19'!
addDependent: anObject
	"Asynchronously adds the dependency. To wait for it, use `self sync addDependent:`
	or `self blocking addDependent:`."
	Actor sendAsyncRequest: (Message selector: #addDependent: argument: anObject) to: actor.
	^ anObject! !

!ActorProxy methodsFor: 'dependents access' stamp: 'tonyg 2/13/2018 16:20'!
removeDependent: anObject
	"Asynchronously removes the dependency. To wait for it, use `self sync removeDependent:`
	or `self blocking removeDependent:`."
	Actor sendAsyncRequest: (Message selector: #removeDependent: argument: anObject) to: actor.
	^ anObject! !

!ActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/10/2018 16:19'!
async
	^ AsyncTransientActorProxy new initializeActor: actor! !

!ActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/10/2018 16:19'!
blocking
	^ BlockingTransientActorProxy new initializeActor: actor! !

!ActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/17/2017 16:21'!
doesNotUnderstand: aMessage
	^ Actor sendRequest: aMessage to: actor.! !

!ActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/3/2020 12:37'!
future
	^ (FutureMaker new) setDeltaMSecs: 0.0 target: self sync! !

!ActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/3/2020 12:38'!
future: deltaMSecs
	^ (FutureMaker new) setDeltaMSecs: deltaMSecs target: self sync! !

!ActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/10/2018 16:19'!
sync
	^ SyncTransientActorProxy new initializeActor: actor! !

!ActorProxy methodsFor: 'initialization' stamp: 'tonyg 2/18/2017 19:54'!
initializeActor: anActor
	actor _ anActor! !

!ActorProxy methodsFor: 'message handling' stamp: 'tonyg 2/6/2018 19:00'!
perform: selector
	^ self doesNotUnderstand: (Message selector: selector)! !

!ActorProxy methodsFor: 'message handling' stamp: 'tonyg 2/6/2018 17:22'!
perform: selector withArguments: arguments
	^ self doesNotUnderstand: (Message selector: selector arguments: arguments)! !

!ActorProxy methodsFor: 'updating' stamp: 'tonyg 2/13/2018 17:13'!
update: anAspect
	^ self doesNotUnderstand: (Message selector: #update: argument: anAspect)! !

!ActorProxy methodsFor: 'updating' stamp: 'tonyg 2/13/2018 17:13'!
update: anAspect with: anObject
	^ self doesNotUnderstand: (Message selector: #update:with: arguments: {anAspect. anObject})! !

!ActorRequest methodsFor: 'initialization' stamp: 'tonyg 2/17/2017 16:26'!
initializeMessage: m sender: s promise: p
	message _ m.
	sender _ s.
	promise _ p.! !

!ActorRequest methodsFor: 'testing' stamp: 'tonyg 2/9/2018 15:25'!
isAsync
	"An ActorRequest may have nil promise, in which case it is 'asynchronous'."
	^ promise isNil! !

!ActorRequest methodsFor: 'accessing' stamp: 'tonyg 2/17/2017 16:26'!
message
	^ message! !

!ActorRequest methodsFor: 'accessing' stamp: 'tonyg 2/17/2017 16:26'!
promise
	^ promise! !

!ActorRequest methodsFor: 'accessing' stamp: 'tonyg 2/17/2017 16:26'!
sender
	^ sender! !

!ActorRequest methodsFor: 'private' stamp: 'tonyg 2/18/2017 19:57'!
notifyWorker
	"Private. If we have a registered worker, let it know this request is no longer its responsibility."
	worker ifNotNil: [worker finishRequest: self].
	worker _ nil! !

!ActorRequest methodsFor: 'private' stamp: 'tonyg 2/18/2017 19:57'!
worker: anActor
	worker _ anActor! !

!ActorRequest methodsFor: 'sending' stamp: 'tonyg 1/24/2020 23:57'!
redirectTo: anActor
	"Redirects this request to anActor, asking it to perform the task described by
	the IMMEDIATE CALLER OF #redirectTo:. This allows improved locality of reasoning
	about what #redirectTo: will do."
	| sen sel args m |
	
	"We build a Message by hand here, following Squeak's `thisContext asMessage`, because Pharo lacks that method."
	sen _ thisContext sender.
	sel _ sen method selector.
	args _ Array new: sel numArgs.
	1 to: sel numArgs do: [:i | args at: i put: (sen tempAt: i)].
	m _ Message selector: sel arguments: args.

	^ self redirectTo: anActor message: m! !

!ActorRequest methodsFor: 'sending' stamp: 'tonyg 1/29/2018 12:32'!
redirectTo: anActor message: aMessage
	"Public. Performs a kind of *tail call*: if the method invoked in response to this request
	calls #redirectTo:message: (perhaps after calling Actor class>>#caller) then the request
	is rewritten, preserving the (still unanswered!!) sender and promise, but replacing the
	message, and is then delivered to `anActor`."
	self notifyWorker.
	Actor current tracer traceRequest: self redirectedTo: anActor message: aMessage.
	message _ aMessage.
	anActor actor sendMessage: self! !

!ActorRequest methodsFor: 'sending' stamp: 'tonyg 2/12/2018 20:11'!
redirectTo: anActor selector: selector
	^ self redirectTo: anActor message: (Message selector: selector)! !

!ActorRequest methodsFor: 'sending' stamp: 'tonyg 2/6/2018 19:41'!
redirectTo: anActor selector: selector argument: argument
	^ self redirectTo: anActor message: (Message selector: selector argument: argument)! !

!ActorRequest methodsFor: 'sending' stamp: 'tonyg 2/6/2018 19:41'!
redirectTo: anActor selector: selector arguments: arguments
	^ self redirectTo: anActor message: (Message selector: selector arguments: arguments)! !

!ActorRequest methodsFor: 'sending' stamp: 'tonyg 1/29/2018 12:32'!
sendTo: anActor
	"Public. Delivers this request as a user-level request message to the given Actor."
	Actor current tracer traceRequest: self sentTo: anActor.
	anActor sendMessage: self! !

!ActorRequest methodsFor: 'resolving' stamp: 'tonyg 2/4/2018 16:20'!
rejectWith: v
	"Public. Causes the remote peer's promise to be rejected with the given exception value."
	self notifyWorker.
	self isAsync ifFalse: [
		sender evaluateBlockInternally: [
			Actor current tracer traceRequest: self rejectedWith: v.
			promise rejectWith: v ]]! !

!ActorRequest methodsFor: 'resolving' stamp: 'jpb 6/21/2020 13:23:20'!
resolveWith: v
	"Public. Causes the remote peer's promise to be resolved with the given value."
	(v is: #Promise)
		ifTrue: [
			v whenResolved: [:w | self resolveWith: w].
			v whenRejected: [:e | self rejectWith: e ] ]
		ifFalse: [
			self notifyWorker.
			self isAsync ifFalse: [
				sender evaluateBlockInternally: [
					Actor current tracer traceRequest: self resolvedWith: v.
					promise resolveWith: v ]]]! !

!ActorRequest class methodsFor: 'instance creation' stamp: 'tonyg 2/9/2018 15:30'!
asyncMessage: aMessage
	"Constructs an *asynchronous* ActorRequest."
	^ self message: aMessage sender: Actor current promise: nil! !

!ActorRequest class methodsFor: 'instance creation' stamp: 'tonyg 2/18/2017 20:16'!
message: aMessage sender: anActor promise: aPromise
	"Constructs a *synchronous* ActorRequest. The reply will be received via
	the promise."
	^ self new initializeMessage: aMessage sender: anActor promise: aPromise! !

!ActorTerminated methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 17:06'!
actor
	^ actor! !

!ActorTerminated methodsFor: 'as yet unclassified' stamp: 'tonyg 2/12/2018 17:06'!
actor: anActor
	actor _ anActor actor! !

!ActorTerminated methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 17:26'!
exitReason
	^ exitReason! !

!ActorTerminated methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 17:26'!
exitReason: anException
	exitReason _ anException! !

!ActorTerminated class methodsFor: 'as yet unclassified' stamp: 'tonyg 2/15/2018 17:39'!
actor: anActor reason: exitReason
	^ self new actor: anActor; exitReason: exitReason; yourself! !

!SimpleDataspaceItem methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 13:07'!
cleanup: dataspace
	self subclassResponsibility! !

!SimpleDataspaceItem methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 13:00'!
peer

	^ peer! !

!SimpleDataspaceItem methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 13:00'!
peer: anObject

	peer _ anObject.! !

!SimpleDataspaceAssertion methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 13:14'!
cleanup: dataspace
	dataspace cleanupAssertion: self! !

!SimpleDataspaceAssertion methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 13:42'!
datum

	^ datum! !

!SimpleDataspaceAssertion methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 13:42'!
datum: anObject

	datum _ anObject.! !

!SimpleDataspaceAssertion methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 13:01'!
topic

	^ topic! !

!SimpleDataspaceAssertion methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 13:01'!
topic: anObject

	topic _ anObject.! !

!SimpleDataspaceFilter methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 15:39'!
assert: topic value: value
	(filterBlock value: topic value: value) ifTrue: [
		assertionHandler cull: topic cull: value]! !

!SimpleDataspaceFilter methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 13:23'!
cleanup: dataspace
	dataspace cleanupFilter: self! !

!SimpleDataspaceFilter methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 15:39'!
retract: topic value: value
	(filterBlock value: topic value: value) ifTrue: [
		retractionHandler cull: topic cull: value]! !

!SimpleDataspaceFilter methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 13:00'!
assertionHandler: anObject

	assertionHandler _ anObject.! !

!SimpleDataspaceFilter methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 15:25'!
filterBlock: anObject

	filterBlock _ anObject.! !

!SimpleDataspaceFilter methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 13:00'!
retractionHandler: anObject

	retractionHandler _ anObject.! !

!SimpleDataspaceSubscription methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 12:42'!
assertionHandler

	^ assertionHandler! !

!SimpleDataspaceSubscription methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 12:42'!
assertionHandler: anObject

	assertionHandler _ anObject.! !

!SimpleDataspaceSubscription methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 12:42'!
retractionHandler

	^ retractionHandler! !

!SimpleDataspaceSubscription methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 12:42'!
retractionHandler: anObject

	retractionHandler _ anObject.! !

!SimpleDataspaceSubscription methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 12:43'!
topic

	^ topic! !

!SimpleDataspaceSubscription methodsFor: 'accessing' stamp: 'tonyg 1/27/2020 12:43'!
topic: anObject

	topic _ anObject.! !

!SimpleDataspaceSubscription methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 13:24'!
cleanup: dataspace
	dataspace cleanupSubscription: self! !

!ActorPromise methodsFor: 'waiting' stamp: 'tonyg 1/27/2020 15:07'!
then
	^ PromiseMessageChain new initializeTargetPromise: self! !

!ActorPromise methodsFor: 'waiting' stamp: 'tonyg 2/12/2018 18:04'!
wait
	"Crudely override Promise's implementation of #wait to special-case ActorProcess
	instances, as per class comment. A more elegant approach might be to alter
	Promise's #wait to invoke a method on Process, and to move the Promise #wait
	implementation there."
	| p |
	p _ Actor current.
	p isActor ifTrue: [ ^ p waitForPromise: self for: nil ifTimedOut: nil ].
	^ super wait! !

!ActorPromise methodsFor: 'waiting' stamp: 'tonyg 2/14/2018 15:13'!
waitFor: msecsOrNil ifTimedOut: timeoutBlock
	"Alternate approach to waiting for a Promise to settle for a given number of milliseconds."
	| p |
	p _ Actor current.
	p isActor ifTrue: [ ^ p waitForPromise: self for: msecsOrNil ifTimedOut: timeoutBlock ].
	^ msecsOrNil
		ifNil: [ super wait ]
		ifNotNil: [ :msecs |
			(super waitTimeoutMSecs: msecs)
				ifTrue: [ "Resolved." self value ]
				ifFalse: [ "Not resolved. Rejected or timed out."
					self isRejected
						ifTrue: [ BrokenPromise new promise: self; signal ]
						ifFalse: [ timeoutBlock value ] ] ]	! !

!ActorPromise methodsFor: 'waiting' stamp: 'tonyg 2/14/2018 15:24'!
waitTimeoutMSecs: msecs
	"Alternate approach to waiting for a Promise to settle for a given number of milliseconds."
	| p |
	p _ Actor current.
	p isActor ifTrue: [
		[ p waitForPromise: self for: msecs ifTimedOut: [] ] on: BrokenPromise do: [:ex | ].
		^ self isResolved].
	^ super waitTimeoutMSecs: msecs! !

!PromiseMessageChain methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 15:09'!
doesNotUnderstand: aMessage
	^ promise then: [:result | result perform: aMessage]! !

!PromiseMessageChain methodsFor: 'as yet unclassified' stamp: 'tonyg 1/27/2020 15:08'!
initializeTargetPromise: aPromise
	promise _ aPromise! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:37'!
= anObject
	^ self == anObject! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:39'!
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

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:39'!
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

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:39'!
basicSize
	"Primitive. Answer the number of indexable variables in the receiver. 
	This value is the same as the largest legal subscript. Essential. Do not 
	override in any subclass. See Object documentation whatIsAPrimitive."

	<primitive: 62>
	"The number of indexable fields of fixed-length objects is 0"
	^0! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:39'!
defaultLabelForInspector
	"Answer the default label to be used for an Inspector window on the receiver."
	^self class name! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/3/2020 12:18'!
hash
	^self identityHash! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:39'!
inspectorClass
	"Answer the class of the inspector to be used on the receiver.  Called by inspect; 
	use basicInspect to get a normal (less useful) type of inspector."

	^ Inspector! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:39'!
instVarAt: index 
	"Primitive. Answer a fixed variable in an object. The numbering of the 
	variables corresponds to the named instance variables. Fail if the index 
	is not an Integer or is not the index of a fixed variable. Essential. See 
	Object documentation whatIsAPrimitive."

	<primitive: 73>
	"Access beyond fixed variables."
	^self basicAt: index - self class instSize		! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:40'!
instVarAt: anInteger put: anObject 
	"Primitive. Store a value into a fixed variable in the receiver. The 
	numbering of the variables corresponds to the named instance variables. 
	Fail if the index is not an Integer or is not the index of a fixed variable. 
	Answer the value stored as the result. Using this message violates the 
	principle that each object has sovereign control over the storing of 
	values into its instance variables. Essential. See Object documentation 
	whatIsAPrimitive."

	<primitive: 74>
	"Access beyond fixed fields"
	^self basicAt: anInteger - self class instSize put: anObject! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:40'!
isKindOf: aClass 
	"--- needed for debugging ---"
	self class == aClass
		ifTrue: [^true]
		ifFalse: [^self class inheritsFrom: aClass]! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:40'!
isMemberOf: aClass 
	"Answer whether the receiver is an instance of the class, aClass."
	^self class == aClass! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:40'!
isText
	^false! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:46'!
longPrintOn: aStream limitedTo: sizeLimit indent: indent
	indent timesRepeat: [aStream tab].
	aStream nextPutAll: '(TransientActorProxy instance variable report elided)'; cr.! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:42'!
printString
	"Answer a String whose characters are a description of the receiver. 
	If you want to print without a character limit, use fullPrintString."
	^ self printStringLimitedTo: 50000! !

!TransientActorProxy methodsFor: 'minimal tool support' stamp: 'tonyg 2/15/2018 14:42'!
printStringLimitedTo: limit
	"Answer a String whose characters are a description of the receiver.
	If you want to print without a character limit, use fullPrintString."
	| limitedString |
	limitedString _ String streamContents: [:s | self printOn: s] limitedTo: limit.
	limitedString size < limit ifTrue: [^ limitedString].
	^ limitedString , '...etc...'! !

!TransientActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/10/2018 16:18'!
doesNotUnderstand: aMessage
	self subclassResponsibility! !

!TransientActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/6/2018 18:09'!
perform: selector
	^ self doesNotUnderstand: (Message selector: selector)! !

!TransientActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/6/2018 17:22'!
perform: selector withArguments: arguments
	^ self doesNotUnderstand: (Message selector: selector arguments: arguments)! !

!TransientActorProxy methodsFor: 'futures' stamp: 'tonyg 2/10/2018 16:31'!
future
	"See Object >> future"
	^ (FutureMaker new) setDeltaMSecs: 0.0 target: self! !

!TransientActorProxy methodsFor: 'futures' stamp: 'tonyg 2/10/2018 16:31'!
future: deltaMSecs
	"See Object >> future:"
	^ (FutureMaker new) setDeltaMSecs: deltaMSecs target: self! !

!TransientActorProxy methodsFor: 'futures' stamp: 'tonyg 2/10/2018 16:32'!
futureDo: aSelector at: deltaMSecs args: args
	"See Object >> #futureDo:at:args:"
	Project current future: self do: aSelector at: deltaMSecs args: args.
	^ nil! !

!TransientActorProxy methodsFor: 'futures' stamp: 'tonyg 2/10/2018 16:36'!
futureSend: aSelector at: deltaMSecs args: args
	"See Object >> #futureSend:at:args:"
	^ Project current future: self send: aSelector at: deltaMSecs args: args! !

!TransientActorProxy methodsFor: 'initialize-release' stamp: 'tonyg 2/10/2018 16:19'!
initializeActor: anActor
	actor _ anActor! !

!AsyncTransientActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/10/2018 16:20'!
doesNotUnderstand: aMessage
	^ Actor sendAsyncRequest: aMessage to: actor! !

!BlockingTransientActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/10/2018 16:20'!
doesNotUnderstand: aMessage
	^ (Actor sendRequest: aMessage to: actor) wait
! !

!SyncTransientActorProxy methodsFor: 'proxying' stamp: 'tonyg 2/10/2018 16:21'!
doesNotUnderstand: aMessage
	^ Actor sendRequest: aMessage to: actor
! !

!ActorProxyModel methodsFor: 'proxying' stamp: 'tonyg 2/7/2018 11:52'!
doesNotUnderstand: aMessage
	^ self proxySend: aMessage! !

!ActorProxyModel methodsFor: 'proxying' stamp: 'tonyg 2/7/2018 13:19'!
proxySend: aMessage
	proxy ifNil: [ self error: 'Proxy unavailable' ].
	(proxy isKindOf: Dictionary) ifTrue: [ | h |
		h _ proxy at: aMessage selector ifAbsent: [ self error: 'Proxy stub does not handle ', aMessage selector ].
		^ h valueWithArguments: aMessage arguments ].
	^ (aMessage sendTo: proxy) waitFor: self requestTimeout ifTimedOut: [ self error: 'Proxy timed out' ]! !

!ActorProxyModel methodsFor: 'toolbuilder' stamp: 'tonyg 2/7/2018 11:53'!
labelString
	^ self windowTitle! !

!ActorProxyModel methodsFor: 'toolbuilder' stamp: 'tonyg 2/7/2018 11:53'!
windowTitle
	^ self proxySend: (Message selector: #windowTitle)! !

!ActorProxyModel methodsFor: 'accessing' stamp: 'tonyg 2/7/2018 11:45'!
proxy
	^ proxy! !

!ActorProxyModel methodsFor: 'accessing' stamp: 'tonyg 2/13/2018 16:16'!
proxy: anActorProxy
	proxy ifNotNil: [proxy removeDependent: self].
	proxy _ anActorProxy.
	proxy ifNotNil: [proxy addDependent: self].! !

!ActorProxyModel methodsFor: 'accessing' stamp: 'tonyg 2/13/2018 16:17'!
proxyStub: aDictionaryLike
	proxy ifNotNil: [proxy removeDependent: self].
	proxy _ Dictionary newFrom: aDictionaryLike.! !

!ActorProxyModel methodsFor: 'timeout' stamp: 'tonyg 2/7/2018 11:48'!
requestTimeout
	^ 5000 "mliliseconds"! !

!ActorProxyModel methodsFor: 'updating' stamp: 'tonyg 2/7/2018 12:35'!
update: aParameter
	self changed: aParameter! !

!ActorProxyModel methodsFor: 'updating' stamp: 'tonyg 2/12/2018 21:04'!
update: aParameter with: anObject
	self changed: aParameter with: anObject! !

!UndefinedObject methodsFor: '*Actors' stamp: 'tonyg 1/27/2020 10:15'!
forUIMessage: aValuable
	| p |
	p _ self new.
	WorldState addDeferredUIMessage: [
		p fulfillWith: aValuable passErrors: true].
	^ p! !

!BlockClosure methodsFor: '*Actors-promises' stamp: 'tonyg 2/17/2018 13:26'!
bindActor
	"Returns an ActorCallback that invokes the receiver in the Actor that was current
	at the time of the call to #bindActor."
	^ ActorCallback wrap: self! !

!MonitoredSharedQueue methodsFor: '*Actors-accessing' stamp: 'tonyg 2/15/2018 09:45'!
nextTimeout: anIntegerOrNil
	| attempts |
	attempts _ 0.
	monitor critical: [
		monitor
			waitWhile: [
				items isEmpty and: [
					attempts > 0 ifTrue: [^ nil].
					attempts _ attempts + 1.
					true]]
			maxMilliseconds: anIntegerOrNil.
		^ items removeFirst ]! !

!Process methodsFor: '*Actors-private' stamp: 'tonyg 2/18/2017 18:47'!
addLinkedActor: peer
	"Private. Called from ActorProcess>>#link to register `peer` as an actor that is listening for
	our exit signal when we terminate."

	"Non-ActorProcess Processes can only receive exit signals, not generate them; nothing to do here."! !

!Process methodsFor: '*Actors-private' stamp: 'tonyg 2/18/2017 18:49'!
evaluateBlockInternally: actionBlock
	"Private. Called when an ActorRequest ceases to be pending. The `actionBlock` should run
	in the context of the receiver and trigger the promise waiting for the result of the ActorRequest."

	actionBlock fork. "Kludge to allow ordinary Processes to receive replies"! !

!Process methodsFor: '*Actors-testing' stamp: 'tonyg 2/18/2017 18:28'!
isActor
	^ false! !

!Process methodsFor: '*Actors-private' stamp: 'tonyg 1/29/2018 11:19'!
ownTracer
	"Private. Allows startup code to generically set a new ActorProcess's tracer to that of its parent, whether its parent was an ActorProcess or not."
	^ nil! !

!Process methodsFor: '*Actors-private' stamp: 'tonyg 2/18/2017 18:51'!
removeLinkedActor: peer
	"Private. Called to remove `peer` from the set of actors listening for
	our exit signal when we terminate."

	"Non-ActorProcess Processes can only receive exit signals, not generate them; nothing to do here."! !

!Process methodsFor: '*Actors-private' stamp: 'tonyg 1/29/2018 12:27'!
tracer
	"Private. Allows code to generically emit Actor trace events."
	^ ActorProcess defaultTracer! !

!Process methodsFor: '*Actors-private' stamp: 'tonyg 2/12/2018 17:21'!
triggerLinkTo: peer withExitReason: aReason
	"Private. Called from ActorProcess>>#signalLinkedActor:, which is invoked indirectly
	during Actor cleanup, in order to notify the receiver that `peer` has just terminated."

	"Convention: vanilla processes are just killed when a linked peer exits abnormally."
	aReason ifNotNil: [self terminate].! !

!Process methodsFor: '*Actors-private' stamp: 'tonyg 2/12/2018 17:21'!
triggerMonitor: aReference on: peer withExitReason: aReason
	"Private. Called from ActorProcess>>#signalMonitor:actor:, which is invoked indirectly
	during Actor cleanup, in order to notify the receiver that `peer` has just terminated."

	"Convention: vanilla processes should give a block as a reference argument to ActorProcess>>#monitor:."
	[ aReference cull: aReason cull: peer  ] fork! !
