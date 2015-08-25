;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)

@(require teachpack/2htdp/scribblings/img-eval
          scribble/decode)
@(define img-eval (make-img-eval))

@(define-syntax-rule 
   (image-examples exp ...)
   (examples #:eval img-eval exp ...))

@(define-syntax-rule 
   (image-interaction exp ...)
   (interaction #:eval img-eval exp ...))

@(define-syntax-rule
   (image-interaction/margin num exp)
   (begin
     (racketinput exp)
     (img-eval '(extra-margin num))
     (interaction-eval-show #:eval img-eval exp)
     (img-eval '(extra-margin 0))))
     
@declare-exporting[fin-doc/fi-image]

@title[#:tag "2htdp_image_kuvan_ominaisuudet" #:style 'toc]{Kuvan ominaisuudet}

@defproc[(image-width [k kuva]) positiivinen-kokonaisluku]{

  Palauttaa kuvan @racket[k] @index["kuvan leveys"]{leveyden} pikseleissä.

  @image-examples[(image-width (circle 15 "solid" "red"))
                  (image-width (beside (square 20 "solid" "red")
                                       (triangle 20 "solid" "red")))]
}

@defproc[(image-height [k kuva]) positiivinen-kokonaisluku]{

  Palauttaa kuvan @racket[k] @index["kuvan korkeus"]{korkeuden} pikseleissä.
  
  @image-examples[(image-height (triangle 20 "solid" "red"))
                  (image-height (above (square 20 "solid" "red")
                                       (square 30 "solid" "red")))]
  }

@defproc[(mode? [x ei-tyyppivaatimusta]) totuusarvo]{
 Tutkii onko @racket[x] kuvalle sopiva @index["kuvan tyyppi"]{tyyppi}. 
 
 Sallittuja tyyppejä ovat:
 @racket["solid"] (myös @racket['solid]) tai @racket["outline"] (myös @racket['outline]).
 Näillä osoitetaan täytetäänkö kuvio värillä @racket[solid] vai piirretäänkö pelkkä reunaviiva @racket[outline].
 
 Kuvan tyyppi voi olla myös kokonaisluku välillä @racket[0] - @racket[255] (mukaanlukien välin päätepisteet).
 Tämä arvo kuvaa kuvan läpinäkyvyyttä. Arvo @racket[255] tarkoittaa läpinäkymätöntä kuvaa eli samaa kuin 
 @racket["solid"]. Arvo @racket[0] tarkoittaa täysin läpinäkyvää kuvaa.
}