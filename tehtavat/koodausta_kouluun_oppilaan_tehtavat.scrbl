;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
           scribble/html-properties)
@(require scribble/pdf-render)

@title[#:tag "oppilaan_tehtavat" #:style 'toc]{Oppilaan tehtävät}
Näillä sivuilta löytyy Koodausta kouluun - materiaalin oppilaan tehtävät.

Jos et ole koodannut Racket-kielellä aikaisemmin, aloita Racket-alkeet oppitunneista.
Kun alkeet ovat hallussa, voit tehdä Racket-perusteet oppitunteja siinä järjestyksessä, kun
itse haluat. Kun perusteet ovat hallussa voitkin siirtyä Racket-jatkon oppitunneille (tulossa myöhemmin). 

Tehtävät täydentyvät koko ajan, joten vieraile sivuilla ahkerasti, joka kerralla
löydät uutta kivaa koodattavaa.

@tabular[(list (list @local-table-of-contents[#:style 'unnumbered ]
                     @centered[@image["tehtavat.png" #:scale 0.3]]))]

@; ------------------------------------------------------------------------

@include-section["racket_alkeet.scrbl"]

@include-section["racket_perusteet.scrbl"]

@include-section["racket_jatko.scrbl"]

@index-section[]
