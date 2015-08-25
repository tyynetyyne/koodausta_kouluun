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

@title[#:tag "2htdp_image_kuvien_asettelu_ruudulle" #:style 'toc]{Kuvien asettelu ruudulle}

Kuvien asettelua ruudulle tarvitaan, kun tehdään animaatioita tai pelejä käyttämällä @italic{2htdp/universe}-kirjastoa.
@defproc*[([(empty-scene [leveys positiivinen-reaaliluku]
                         [korkeus positiivinen-reaaliluku])
            kuva]
            [(empty-scene [leveys positiivinen-reaaliluku]
                          [korkeus positiivinen-reaaliluku]
                          [väri image-color?])
            kuva])]{

 Luo valkoisen mustareunaisen ruudun, jonka @racket[leveys] ja @racket[korkeus] annetaan.
 Kolmantena argumenttina voidaan antaa ruudun @racket[väri].
 
@image-examples[(empty-scene 160 90)(empty-scene 160 90 "black")]
}

@defproc[(place-image [k1 kuva] [x reaaliluku] [y reaaliluku] [k2 kuva]) kuva]{

 Sijoittaa kuvan @racket[k1] pisteeseen (@racket[x],@racket[y]) kuvan @racket[k2] päälle. 
 Koordinaatit ilmoitetaan suhteessa kuvan @racket[k2] vasempaan yläkulmaan. @racket[place-image] palauttaa aina
 saman kokoisen kuvan kuin kuva @racket[k2] eli sen ulkopuolelle jäävät kuvan @racket[k1] osat leikkautuvat pois.
 
 @image-examples[(place-image 
                  (circle 20 "solid" "red")
                  0 0
                  (empty-scene 150 100))
                 (place-image 
                  (circle 20 "solid" "red")
                  0 50
                  (empty-scene 150 100))
                 (place-image 
                  (circle 20 "solid" "red")
                  75 50
                  (empty-scene 150 100))]
}