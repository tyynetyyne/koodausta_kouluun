;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-universe))
@(require scribble/core
           scribble/html-properties)
@;@(require scribble/eval)

@declare-exporting[fin-doc/fi-universe]

@title[#:tag "2htdp_universe" #:style 'toc]{Pelit yms. - 2htdp/universe}

@defmodule[2htdp/universe]

@italic{2htdp/universe} kirjaston avulla voidaan toteuttaa interaktiivisia graafisia ohjelmia, kuten animaatioita ja pelejä, kirjoittamalla
yksinkertaisia matemaattisia funktioita. Näitä ohjelmia kutsutaan @italic{World}-ohjelmiksi. Useammasta @italic{World}-ohjelmasta voi
koota kokonaisen universumin @italic{universe}, jossa @italic{World}-ohjelmat vaihtavat viestejä keskenään.

Tässä osiossa esitellään tärkeimmät @italic{2htdp/universe}-kirjaston toiminnot.
Täydellinen kuvaus löytyy osoitteesta:
@url{http://docs.racket-lang.org/teachpack/2htdpuniverse.html}

@italic{2htdp/universe}-kirjasto on tehty käytettäväksi oppikirjan 
@link["http://www.ccs.neu.edu/home/matthias/HtDP2e/part_prologue.html"]{How
 to Design Programs, Second Edition} kanssa. @italic{World}-ohjelmia käsitellään myös 
 @link["http://world.cs.brown.edu/"]{How to Design Worlds}-kirjasessa.
    
@include-section{2htdp_universe_animaatiot.scrbl}
@include-section{2htdp_universe_interaktiiviset_ohjelmat.scrbl}

@centered[@image[#:scale 0.6 "fin_doc/my_packman.png"]]

