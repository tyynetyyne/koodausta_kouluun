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

@title[#:tag "plot_2D" #:style 'toc]{Kuvaajien piirto (myös WeSchemessä) - Plot}

@defmodule[teachpacks/plot]

@margin-note{Jotta plot toimii DrRacket:ssa, sinun pitää asentaa @bold{teachpacks} paketti.
 Katso asennusohjeet @link["sanasto.html#(part._paketti)"]{täältä}.
 @italic{Huom!} Tämä kirjasto vaatii käyttöönsä @italic{Advanced Student Language}.
 @italic{WeScheme}:ssä ei tarvitse asentaa teachpacts pakettia mutta kirjastolla on eri nimi:
 @racket[(require wescheme/JHv1z3atgU)]}

Tässä osassa esitellään plot -kirjasto, jonka avulla voi piirtää kuvaajia sekä sijoittaa pisteitä koordinaatistoon.
Kirjaston avulla voit piirtää samaan kuvaan useamman kuvaajan, nimetä akselit sekä antaa kuvalle otsikon.
             
@centered[@image[#:scale 0.8 "plot/paraabelisuora.png"]]

@centered[@image[#:scale 0.8 "plot/sincos.png"]]

@centered[@image[#:scale 0.8 "plot/dots2.png"]]

@local-table-of-contents[#:style 'unnumbered]

@include-section["plot_funktiot.scrbl"]
