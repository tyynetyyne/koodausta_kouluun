;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image)))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)

@declare-exporting[fin-doc/fi-image]

@title[#:tag "2htdp_image" #:style 'toc]{2htdp/image}

@defmodule[2htdp/image]

The image teachpack provides a number of basic image construction
functions, along with combinators for building more complex images out of
existing images. Basic images include various polygons, ellipses and
circles, and text, as well as bitmaps.@margin-note*{In the context of this
documentation, a @defterm{bitmap} denotes a special form of
@racket[image?], namely a collection of pixels associated with an image. It
does not refer to the @racket[bitmap%] class. Typically such image-bitmaps
come about via the @onscreen{Insert Image...} menu item in DrRacket}
Existing images can be rotated, scaled, flipped, and overlaid on top of each other.

In some situations images are rendered into bitmaps (e.g. when being shown in
the DrRacket Interactions window) In order to avoid bad performance
penalties, the rendering process limits the area of the images to
about 25,000,000 pixels (which requires about 100 MB of storage).

Tässä osiossa esitellään tärkeimmät 2htdp/image - kirjaston toiminnot. Täydellinen kuvaus löytyy osoitteesta:
@url{http://docs.racket-lang.org/teachpack/2htdpimage.html}

    
@include-section{2htdp_image_peruskuviot.scrbl}
@include-section{2htdp_image_kuvien_yhdistely.scrbl}
@include-section{2htdp_image_kuvien_asettelu.scrbl}
@include-section{2htdp_image_kuvien_muokkaus.scrbl}
@include-section{2htdp_image_kuvien_ominaisuudet.scrbl}
@include-section{2htdp_image_bmp_kaytto.scrbl}
@include-section{2htdp_image_varit.scrbl}