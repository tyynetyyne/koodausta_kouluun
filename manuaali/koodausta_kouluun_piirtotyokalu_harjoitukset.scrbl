#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label lang/htdp-beginner))
@(require (for-label (except-in 2htdp/image image?)))
@(require scribble/core
           scribble/html-properties)
@(require scribble/racket)
           
@title[#:tag "harjoittele"]{Harjoittele}

Nyt sinulla on kaikki tarvittavat työkalut, jotta voit ohjelmoida Japanin ja Suomen lipun sekä auton.

@section[#:tag "japanin_lippu"]{Japanin lippu}

@(define POHJA2 (rectangle 165 110  "outline" "black"))
@(define POHJA3 (rectangle 166 111  "outline" "black"))
@(define VAIHE1 (overlay (circle 36 "solid" "red") POHJA2)) 
@(define JAPANINLIPPU (overlay/xy VAIHE1 0 0 POHJA3))

Vinkki: Määrittele ensin lipun pohja ja "aurinko" define:llä, yhdistä ne lopuksi. 

@JAPANINLIPPU

@section[#:tag "suomen_lippu"]{Suomen lippu}

@(define POHJA1 (rectangle 179 109 "outline" "black"))
@(define VAAKA (rectangle 180 30 "solid" "blue"))
@(define PYSTY (rectangle 30 110 "solid" "blue"))
@(define VAIHE (overlay/xy PYSTY -50 0  POHJA1))
@(define SUOMENLIPPU (overlay/xy VAAKA 0 -40 VAIHE))

Vinkki: Lähde liikkeellee ristin osista, kokoa risti ja liitä se pohjaan.

@SUOMENLIPPU

@section[#:tag "auto"]{Auto}

@(define RENGAS (circle 20 "solid" "black"))
@(define RENKAAT (overlay/xy RENGAS 60 0 RENGAS))
@(define KORI (rectangle 110 60 "solid" "lightblue"))
@(define AUTO (scale 1.5 (overlay/xy RENKAAT -5 -40 KORI)))

Vinkki: Rakenna auto paloista, määrittele ensin yksi rengas. Määrittele sen avulla uusi kuva, jossa on kaksi rengasta. Määrittele kori 
ja lopuksi liitä renkaat korin kanssa samaan kuvaan.

@AUTO

Hauskoja koodaushetkiä! 