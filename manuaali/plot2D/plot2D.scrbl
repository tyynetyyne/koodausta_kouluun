#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/plot2D))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@title[#:tag "plot_2D" #:style 'toc]{Kuvaajien piirto - Plot2D}

@defmodule[teachpacks/plot2D]

@margin-note{Jotta Plot2D toimii DrRacket:ssa, sinun pitää asentaa @bold{teachpacks} paketti.
 Katso asennusohjeet @link["sanasto.html#(part._paketti)"]{täältä}.
 @italic{Huom!} Tämä kirjasto vaatii käyttöönsä @italic{Advanced Student Language}. Kirjasto puuttuu WeScheme:stä.}

Tässä osassa esitellään Plot2D -kirjasto, jonka avulla voi piirtää 2D-kuvaajia sekä sijoittaa pisteitä koordinaatistoon.
Kirjaston avulla voit piirtää samaan kuvaan useamman kuvaajan, nimetä akselit sekä antaa kuvalle otsikon.
             
@centered[@image[#:scale 0.8 "plot2D/paraabelisuora.png"]]

@margin-note{plot2D-kirjasto käyttää laajempaa @link["http://docs.racket-lang.org/plot/"]{plot-kirjastoa}. Tutustu siihen, jos
 plot2D-kirjaston toiminnot eivät riitä.}

@centered[@image[#:scale 0.8 "plot2D/sincos.png"]]

@centered[@image[#:scale 0.8 "plot2D/dots2.png"]]

@local-table-of-contents[#:style 'unnumbered]

@include-section["plot2D_funktiot.scrbl"]
