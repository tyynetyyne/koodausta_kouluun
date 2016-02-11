#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
           scribble/html-properties)
@(require scribble/racket)
@(require fin-doc/pr-math)
@setup-math

@title[#:tag "racket_perusteet" #:style 'toc]{Racket perusteet}

Tässä jaksossa opitaan algorimisen ajattelun peruspilarit: ehtolauseet, funktiot sekä silmukat.
Pääset koodaamaan animaatioita sekä yksinkertaisia pelejä.

@centered[@image["kuvat/piilokuvaA.png" #:scale 0.3]]

@local-table-of-contents[#:style 'immediate-only ]

@include-section{racket_perusteet_funktiot.scrbl}
@include-section{racket_perusteet_ehtolauseet.scrbl}
@include-section{racket_perusteet_sovelluksia_universe.scrbl}
@include-section{racket_perusteet_sovelluksia_display_read.scrbl}

