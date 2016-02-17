#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/math-utils))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@title[#:tag "math_utils" #:style 'toc]{Math-utils}

@defmodule[teachpacks/math-utils]

@margin-note{Jotta math-utils toimii DrRacket:ssa, sinun pitää asentaa @bold{teachpacks} paketti.
 Katso asennusohjeet @link["sanasto.html#(part._paketti)"]{täältä}.
  @italic{WeScheme}:ssä ei tarvitse asentaa pakettia mutta kirjastolla on eri nimi:
 @racket[(require wescheme/nPi5tpye0C)]}

Tässä osassa esitellään math-utils -kirjasto, josta löytyy funktioita, jotka auttavat matematiikkaan liittyvissä ohjelmointitehtävissä esim. 
tulosten pyöristämisessä sekä yksiköiden lisäämisessä tulokseen.
             
@local-table-of-contents[#:style 'unnumbered]

@include-section["math_utils_funktiot.scrbl"]
