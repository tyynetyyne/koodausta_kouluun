#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/plot))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@title[#:tag "plot" #:style 'toc]{Kuvaajat yms. - Plot}

@defmodule[teachpacks/plot]

@margin-note{Jotta plot toimii DrRacket:ssa, sinun pitää asentaa @bold{teachpacks} paketti.
 Katso asennusohjeet @link["sanasto.html#(part._paketti)"]{täältä}.
 @italic{Huom!} Tämä kirjasto vaatii käyttöönsä @italic{Advanced Student Language}.
 @italic{WeScheme}:ssä ei tarvitse asentaa teachpacts pakettia mutta kirjastolla on eri nimi:
 @racket[(require wescheme/2W8inC9p82)]}

Tässä osassa esitellään plot -kirjasto, jonka avulla voi piirtää kuvaajia, sijoittaa pisteitä, viivoja
tai kuvia koordinaatistoon sekä piirtää pylväsdiagrammeja.
Kirjaston avulla voit piirtää samaan kuvaan useamman kuvaajan, nimetä akselit sekä antaa kuvalle otsikon.
             
@centered[@image[#:scale 0.8 "plot/paraabelisuora.png"]]

@centered[@image[#:scale 0.7 "plot/dots2.png"]]

@centered[@image[#:scale 0.7 "plot/geometry.png"]]

@centered[@image[#:scale 0.7 "plot/bars.png"]]

@local-table-of-contents[#:style 'unnumbered]

@include-section["plot_funktiot.scrbl"]
@include-section["plot_bars.scrbl"]
