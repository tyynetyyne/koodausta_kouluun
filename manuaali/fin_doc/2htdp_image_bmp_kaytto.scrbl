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

@title[#:tag "bitmapit" #:style 'toc]{Bitmapit}

@defproc[(bitmap/url [url merkkijono]) kuva]{

  Lataa netistä kuvan osoitteesta @racket[url].

  Kuva ladataan jokakerta, kun tätä funktiota kutsutaan, joten voi olla parempi ladata kuva käsin
  ja liittää se suoraan ohjelmakoodiin tallentamalla se ensin levylle ja käyttämällä funktiota @racket[bitmap/file].
}

@defproc[(bitmap/file [tiedoston-sijainti merkkijono]) kuva]{

  Lataa kuvan annetusta polusta @racket[tiedoston-sijainti].

  Jos @racket[tiedoston-sijainti] on suhteellinen polku, nykyinen sijainti määritellään siksi hakemistoksi, johon @italic{.rkt} tiedosto
  on tallennettu. 
}