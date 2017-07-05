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

@title[#:tag "racket_alkeet" #:style 'toc]{Racket alkeet}

Racket alkeet jaksolla opetellaan käyttämään Racket-ohjelmointiympäristöä
DrRacket:iä ja/tai WeScheme-nettisivustoa. Jaksossa piirretään paljon kuvia, ja harjoitusten
tarkoituksena on oppia ratkomaan ongelmia koodaamalla sekä oppia etsimään tietoa Koodarin
käsikirjasta.

@margin-note[@link["https://youtu.be/F5_ZIPsj0xI"]{@image[#:scale 0.015 "kuvat/video.png"] Työkalut (DrRacket ja WeScheme), kesto 2:51}]

@centered[@image["kuvat/kukka.png"]]

@local-table-of-contents[#:style 'immediate-only ]

@include-section{racket_alkeet_peruslaskut.scrbl}
@include-section{racket_alkeet_peruskuvat.scrbl}
@include-section{racket_alkeet_turtle.scrbl}

