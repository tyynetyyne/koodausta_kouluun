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

@title[#:tag "varit" #:style 'toc]{Värit}

@defproc[(image-color? [x ei-tyyppivaatimusta]) totuusarvo]{

  Tutkii, onko @racket[x] merkkijono (tai symboli) joka vastaa jotakin väriä.
  Väri voi olla myös @racket[make-color]:lla tehty tietue.

  Esimerkiksi:
  @racket["magenta"], @racket["black"], @racket['orange], ja @racket['purple]
  sallittuja värejä. Värin nimessä sallitaan myös isot kirjaimet, eli   
  @racket["MAGENTA"], @racket["Black"], @racket['oRange], ja @racket['PurpLE]
  ovat sallittuja värejä.
  
  Jos merkkijonoa tai symbolia ei tunnisteta väriksi, värinä käytetään mustaa.
  
  Voit katsoa värin nimen @link["http://racket.koodiaapinen.fi/manuaali/varilista.html"]{värilistasta}. Näiden lisäksi väriksi hyväksytään myös @racket["transparent"].
}

@include-section["2htdp_image_varilista.scrbl"]

@defproc[(make-color [red luonnollinen-luku-välillä-0-255]
                     [green luonnollinen-luku-välillä-0-255]
                     [blue luonnollinen-luku-välillä-0-255]) color?]{

 Luo tietueen, joka kuvaa uutta väriä, jonka @racket[red], @racket[green] ja @racket[blue]
 arvot on annettu. Kaikkien argumenttien arvot on oltava välillä @racket[0] - @racket[255]. 
      
 Mitä suurempi arvo argumenteilla @racket[red], @racket[green], ja @racket[blue] on, sitä enemmän kyseistä väriä otetaan mukaan
 uuden värin luomiseen. Esimerkiksi @racket[(make-color 255 0 0)] luo kirkkaan punaisen värin ja
 @racket[(make-color 255 0 255)] aikaansaa violetin värin.

 @racket[make-color]:lle voi antaa myös neljännen argumentin @racket[alpha]. Se kuvaa värin läpinäkyvyyttä:
 arvolla @racket[255] vastaa täysin peittävä väriä ja @racket[0] täysin läpinäkyvä. Jos @racket[alpha]:lle
 ei anneta arvoa, sen on @racket[255].
 }

@defproc[(color? [x ei-tyyppivaatimusta]) totuusarvo]{

 Tutkii onko annettu argumentti @racket[x] tietue, jonka on tehty käyttämällä @racket[make-color]:ia.
}