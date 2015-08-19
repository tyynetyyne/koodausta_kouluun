;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
           scribble/html-properties)
           
@title[#:tag "aloita_tasta" #:style 'toc]{Aloita tästä}
 
Koodausta kouluun materiaali soveltuu ohjelmoinnin opettamiseen peruskoulun 5.- 9.luokilla. 

Voit aloittaa ohjelmoinnin vaikka sinulla ei olisi aikaisempaa kokemusta aiheesta. Seuraamalla "Aloita tästä"-osion ohjeita saat 
yleiskuvan siitä mitä on Racket-ohjelmointi.

Jakson lopuksi osaat ohjelmoida mm. nämä kuvat:

@(define POHJA1 (rectangle 179 109 "outline" "black"))
@(define VAAKA (rectangle 180 30 "solid" "blue"))
@(define PYSTY (rectangle 30 110 "solid" "blue"))
@(define VAIHE (overlay/xy PYSTY -50 0  POHJA1))
@(define SUOMENLIPPU (overlay/xy VAAKA 0 -40 VAIHE))

@(define POHJA2 (rectangle 165 110  "outline" "black"))
@(define POHJA3 (rectangle 166 111  "outline" "black"))
@(define VAIHE1 (overlay (circle 36 "solid" "red") POHJA2)) 
@(define JAPANINLIPPU (overlay/xy VAIHE1 0 0 POHJA3))

@(define RENGAS (circle 20 "solid" "black"))
@(define RENKAAT (overlay/xy RENGAS 60 0 RENGAS))
@(define KORI (rectangle 110 60 "solid" "lightblue"))
@(define AUTO (scale 1.5 (overlay/xy RENKAAT -5 -40 KORI)))

@(centered @tabular[#:sep @hspace[1]
                          (list (list SUOMENLIPPU JAPANINLIPPU AUTO))])

@local-table-of-contents[#:style 'immediate-only ]

@include-section["asenna_drracket.scrbl"]
@include-section["peruslaskuja.scrbl"]
@include-section["piirtotyokaluja.scrbl"]
@include-section["piirtotyokalu_harjoitukset.scrbl"]
