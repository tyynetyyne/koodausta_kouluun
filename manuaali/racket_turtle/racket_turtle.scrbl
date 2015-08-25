#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/racket-turtle))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@title[#:tag "racket_turtle" #:style 'toc]{Racket Turtle}

@defmodule[teachpacks/racket-turtle]

Tässä osassa esitellään Racket Turtle - kirjasto, jonka avulla voi piirtää turtle-grafiikkaa ja tehdä monipuolisia
taideteoksia. Racket Turtle on helppo ohjelmoida tekemään kuvioita, ja se soveltuu aivan aloittelijoillekin. Sen avulla voidaan
kuitenkin opetella myös vaikeampia ohjelmointikäsitteitä kuten listoja ja rekursiota.

Racket Turtlella piirrettyjä kuvia:

@image[#:scale 0.5 "racket_turtle1_img.png"]
@image[#:scale 0.5 "racket_turtle2_img.png"]
@image[#:scale 0.5 "racket_turtle3_img.png"]
@image[#:scale 0.5 "racket_turtle4_img.png"]
                                                                           
@local-table-of-contents[#:style 'unnumbered]

@include-section["racket_turtle_toiminta.scrbl"]
@include-section["racket_turtle_komennot.scrbl"]
@include-section["racket_turtle_funktiot.scrbl"]
@include-section["racket_turtle_esimerkit.scrbl"]
@include-section["racket_turtle_esimerkit_rekursio.scrbl"]


