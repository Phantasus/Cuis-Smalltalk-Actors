# Authors

Here the authors of parts of 3rd party components are collected. To
give each of these exceptional individuals room for their authorship.

# Original Authors of Squeak Actors (20th June 2020)

The original Author of the Squeak Actors package was Tony Garnock-Jones (tonyg)
who is also hosting a [github page about the Actors package](https://tonyg.github.io/squeak-actors).

I took the `Actors-tonyg.107.mcz` from his [Actors squeaksource.com project page](http://www.squeaksource.com/Actors.html).A screenshot of the project [overview page](file://References/squeaksource_overview_20200620.png)
was made to record the license, which is automatically MIT on squeaksource.

From that information an "original" Squeak-Actors MIT License file was derived and placed
in this project repository. A screenshot of the versions page was also made, so the exact
downloaded version can be identified, which was at the time of writing the newest one.

It was downloaded by Josef Philip Bernhart on 20th June 2020 at around 20:00 UTC.

For completeness the relevant files have these sha256sums:

> 5f36fcf36436c06576a28c2f987fe9c6879b3782b416256b33622961b5118b89  References/Actors-tonyg.107.mcz
> eaf2049647a8150c379615cdcc5886ecf17ca4d08f9bbba33fdec32bb1f2bdf6  References/squeaksource_overview_20200620.png
> 1ce4d999e6b5f55eb1b0887a05967d25f2c29efe09b4c7042d5632ca69a01030  References/squeaksource_versions_20200620.png

## Original Authors of Squeak5.3 promise classes (21th June 2020)

As the Squeak Actors package depended on a couple of selected Squeak
core classes, these were exported from a `Squeak5.3-19431-64bit` image.
As these were contributed to [Squeak](https://squeak.org) they are MIT licensed.
The files were converted from carriage returns to newlines by the shell command:
> cat <file> | tr '\r' '\n' > References/<file>

The contributors of these classes were extracted by the shell command:
> grep 'methodsFor:.*stamp:' References/*Promise* | sed "s/^.*stamp: '([^ ]*) [^']+'.*$/\1/g" -E | sort | uniq
> grep 'methodsFor:.*stamp:' References/SharedQueue2 | sed "s/^.*stamp: '([^ ]*) [^']+'.*$/\1/g" -E | sort | uniq

The sha256sums of these files are:
> 423449cc891466e5d1143514872f7b623e14ed0dab78da7ceec490c8f9a20b23  References/Promise.st
> 8d77f7f881a4f7a00c7a52a714093e8b0b27a14304f9b3f351c325e9833e4cfb  References/PromiseTest.st
> c6f6b9fe73072e372c9c88e2a8dd97b5314a092fc0075ce6a0d23e980ba3f886  References/SharedQueue2.st
> 798ff01736445341dfe50161f3a840cb98edd0764acc85883580354c1bbc9430  References/BrokenPromise.st

As written above, before applying the sha256sum over these files, they were converted
from `\r` to `\n` as this makes later filing-in more convenient.

And the full list of contributors of these files are:

    - Frank Shearar (fbs)
    - Joshua Gargus (jcg)
    - Marcel Taeumel (mt)
    - Patrick Rein (pre)
    - Tony Garnock-Jones (tonyg)
    - Lex Spoon (ls)
    - Nicolas Cellier (nice)
    - Levente Uzonyi (ul)
    

# Author of the (initial) porting effort

Josef Philip Bernhart (jpb) did download the package so that it runs on Cuis-Smalltalk.
The whole Cuis Smalltalk related repository was set up by him initially.
