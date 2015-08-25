;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image)))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)

@title[#:tag "2htdp_image" #:style 'toc]{Kuvat - 2htdp/image}

@defmodule[2htdp/image]

Kuvienpiirtokirjasto @italic{2htdp/image} tarjoaa funktioita peruskuvioiden piirtämiseen, muokkaamiseen
sekä yhdistelyyn isommiksi kuviksi. Peruskuviot voivat olla erilaisia monikulmioita, ellipsejä, ympyröitä tai tekstiä.
Kirjaston avulla voidaan käsitellä myös @italic{bitmap}-kuvia (jpg, png). Valmiita kuvia voidaan kiertää, skaalata,
kääntää pelikuvaksi sekä asetella päällekkäin. 

Tässä osiossa esitellään tärkeimmät @italic{2htdp/image}-kirjaston toiminnot. Täydellinen kuvaus löytyy osoitteesta:
@url{http://docs.racket-lang.org/teachpack/2htdpimage.html}
    
@include-section{2htdp_image_peruskuviot.scrbl}
@include-section{2htdp_image_kuvien_yhdistely.scrbl}
@include-section{2htdp_image_kuvien_asettelu.scrbl}
@include-section{2htdp_image_kuvien_muokkaus.scrbl}
@include-section{2htdp_image_kuvien_ominaisuudet.scrbl}
@include-section{2htdp_image_bmp_kaytto.scrbl}
@include-section{2htdp_image_varit.scrbl}

@(define VÄRI1 "violet")
@(define VÄRI2 "slateblue")
@(define VÄRI3 "aqua")

@(define K1-LEHTI (rhombus 80 15 "solid" VÄRI1))
@(define K1-LEHDET2 (beside K1-LEHTI K1-LEHTI))
@(define K1-LEHDET1 (rotate 90 K1-LEHDET2))
@(define K1-KUKKA (overlay K1-LEHDET1 K1-LEHDET2))
@(define K1-KUKKA2  (overlay (circle 10 "solid" "white") K1-KUKKA (rotate 45 K1-KUKKA)))

@(define K2-LEHTI (overlay/xy (beside (circle 15 "solid" VÄRI2 ) 
                                  (overlay/xy (rotate 30 (rhombus 80 15 "solid" VÄRI3)) 0 0 
                                              (rotate -30 (rhombus 50 20 "solid" "white"))))
                          -50 60
                          (radial-star 5 4 50 "solid" "gold")))
@(define K2-LEHDET (beside K2-LEHTI (flip-horizontal K2-LEHTI)))
@(define K2-LEHDYKÄT (above (flip-vertical K2-LEHDET) K2-LEHDET)) 
@(define K2-TIMANTTI (rhombus 50 20 "solid" "white"))
@(define K2-PEILAUSKUVA (overlay K2-TIMANTTI K2-LEHDYKÄT))

@(define K3-LEHTI (ellipse 200 50 "solid" VÄRI1))
@(define K3-LEHDET2 (beside K3-LEHTI K3-LEHTI))
@(define K3-LEHDET1 (rotate 90 K3-LEHDET2))
@(define K3-KUKKA (overlay K3-LEHDET1 K3-LEHDET2))
@(define K3-VALMIS (scale 0.4 (overlay (circle 25 "solid" "white") K3-KUKKA (rotate 45 K3-KUKKA))))

@(centered @tabular[#:sep @hspace[1]
                          (list (list K1-KUKKA2 K2-PEILAUSKUVA K3-VALMIS))])

