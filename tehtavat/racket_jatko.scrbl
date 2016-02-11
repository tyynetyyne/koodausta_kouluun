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

@title[#:tag "racket_jatko" #:style 'toc]{Racket jatko}

Tässä jaksossa käydään läpi edistyneempiä ohjelmointitekniikoita, kuten tietorakenteiden
käsittelyä sekä Higher Order - funktioita.

@centered[@image["kuvat/tahtispiraali.png" #:scale 0.4]]

@local-table-of-contents[#:style 'immediate-only]

@include-section{racket_jatko_silmukat.scrbl}
