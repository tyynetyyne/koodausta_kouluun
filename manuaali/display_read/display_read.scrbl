#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/display-read))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@title[#:tag "display_read" #:style 'toc]{Display-Read}

@defmodule[teachpacks/display-read]

@margin-note{Jotta Display-Read toimii DrRacket:ssa, sinun pitää asentaa @bold{teachpacks} paketti.
 Katso asennusohjeet @link["sanasto.html#(part._paketti)"]{täältä}.
 @italic{WeScheme}:ssä ei tarvitse asentaa pakettia mutta kirjastolla on eri nimi:
 @racket[(require wescheme/1Q1f9pSrg8)]. Tämä WeScheme:n versio toimii nuolinäppäinten ja enterin osalta
myös iPadin/iPhonen kosketusnäytöillä, ks. sivun alin kuva. Tekstieditori ei toimi mobiililaitteilla.}

Tässä osassa esitellään Display-Read -kirjasto, jonka avulla voi pyytää käyttäjää antamaan merkkijonon tai luvu, tai valitsemaan lukuja,
merkkijonoja tai kuvia annetusta listasta. Kirjaston avulla voi myös esittää käyttäjälle ohjelman tulokset (luku, merkkijono tai kuva). Kirjaston avulla voi ohjelmoida yksinkertaisia
interaktiivisia ohjelmia tai pelejä kuten "arvaa mitä lukua ajattelen".

@centered[@image[#:scale 0.8 "display_read/dr_koira.png"]]
@centered[@image[#:scale 0.8 "display_read/dr_select.png"]]
@centered[@image[#:scale 0.8 "display_read/dr_select_image.png"]]
@centered[@image[#:scale 0.8 "display_read/display_select_touch.png"]]

@local-table-of-contents[#:style 'unnumbered]

@include-section["display_read_funktiot.scrbl"]
@;@include-section["display_read_esimerkit.scrbl"]
