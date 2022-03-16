# <img src="https://raw.githubusercontent.com/Chinchillord/Bedellibrary/master/img/BedelibryLogo.png" width="175"> Bedelibry

Bedelibry is a platform that aims to provide a number of simple, inter-connected, open-source tools to facilitate research work and the organization of knowledge. This was motivated by the author's own frustrations with both traditional (paper) note-keeping, as well as with existing proprietary solutions such as Mendeley.
 
This project is currently in the experimental/prototyping stages -- and has gone through a series of large changes and a set of different prototypes of different components of the system throughout the years. Thus, most of the interesting work thus far will be in those repositories -- not here.

Meriv is a statically-typed logic programming language for knowledge representation that will eventually be used to power bedelibry. The original working prototype of this was originally called [Bedelibry Prolog](https://github.com/Sintrastes/bli-prolog), and so the most complete prototype of Bedelibry's functionality can currently be found there. Whereas Bedelibry Prolog originally tried to tackle the complete integrated design and implementation of a statically-typed _functional-logic_ programming language all in one place, _Meriv_ is being designed (at least initially) as an _embedded statically-typed logic programming language in Haskell_ -- which together with Haskell as it's host language gives us a _functional-logic_ language for free. The implementation of this embedded language can be found at [meriv-core](https://github.com/Sintrastes/meriv-core).

One of the original ideas for a feature of Bedelibry Prolog was to allow for the user to specify _syntactic types_ for their relations based on the lambek calculus with subtying -- thus allowing for a natural language interface for the language. However, due to the already mounting complexities of this original prototype, development of this feature has instead been continued as it's own domain-specific-language/library [Montague](https://github.com/Sintrastes/Montague).

A mobile/web app for Montague is currently being developed at [montague-reflex](https://github.com/Sintrastes/montague-reflex). However, this app will most likely evolve into an app for Bedelibry more generally.

Some of the original prototypes for Bedelibry can be found at [chinchillord/bedellibrary](https://github.com/Chinchillord/Bedellibrary), where they have been preserved for posterity.
