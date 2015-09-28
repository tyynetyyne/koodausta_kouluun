;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-universe))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)

@declare-exporting[fin-doc/fi-universe]

@(define UFO1 (scale 0.7 (bitmap/file "fin_doc/ufo1.png")))
@(define UFO2 (scale 0.7 (bitmap/file "fin_doc/ufo2.png")))
@(define UFO3 (scale 0.7 (bitmap/file "fin_doc/ufo3.png")))

@title[#:tag "2htdp_universe_animaatiot" #:style 'finnish]{Animaatiot}

Yksinkertaisin @italic{World}-ohjelma on animaatio, jossa ajan kuluessa esitetään sarja kuvia. Ohjelmoija kirjoittaa funktion,
joka tuottaa uuden kuvan, jokaista luonnolista lukua kohden. Tämä funktio annetaan argumenttina @racket[animate]-funktiolle, joka suorittaa animoinnin.

@defproc[(animate [tee-kuva (luonnollinen-luku -> kuva)])
         luonnollinen-luku]{

 Avaa animaatioikkunan ja käynnistää kellon, joka @italic{tikittää} 28 kertaa sekunnissa.
 Jokaisella kellon tikityksellä @racket[animate] kutsuu @racket[tee-kuva]-funktiota ja antaa argumenttina tikitysten määrän animaation alusta laskettuna.
 Kuvat esitetään avatussa animaatioikkunassa. Animaatio on käynnissä kunnes animaatioikkuna suljetaan punaisesta rastista. 
 Lopuksi @racket[animate]-funktio palauttaa tikitysten määrän animaation lopussa.}

Esimerkki:
@racketblock[
(require 2htdp/image)
(require 2htdp/universe)

(define UFO (overlay/xy (ellipse 120 40 "solid" "violet")
                        30 -25
                        (circle 30 "outline" "black")))

(define (ufo-laskeutuu y)
  (place-image UFO 150 y (empty-scene 300 500)))

(animate ufo-laskeutuu)
]

@(centered @tabular[#:sep @hspace[1]
                         (list (list UFO1 UFO2 UFO3))])
