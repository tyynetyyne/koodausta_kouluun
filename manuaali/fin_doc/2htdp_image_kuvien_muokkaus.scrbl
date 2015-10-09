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

@title[#:tag "2htdp_image_kuvien_muokkaus" #:style 'toc]{Kuvien muokkaus}

@defproc[(rotate [asteluku reaaliluku] [k kuva]) kuva]{

 @index["kuvan kiertäminen"]{Kiertää} kuvaa @racket[k] annetun määrän @racket[asteluku] verran vastapäivään.
          
          @image-examples[(rotate 45 (ellipse 60 20 "solid" "purple"))
                          (rotate 30 (triangle 40 "solid" "red"))]
}

@defproc[(scale [kerroin positiivinen-reaaliluku] [k kuva]) kuva]{

  Skaalaa annetun kuvan @racket[k] suuremmaksi tai pienemmäksi riippuen siitä mikä @racket[kerroin] on.
  Jos @racket[kerroin] on suurempi kuin @racket[1], kuvan koko suurenee.
         
  @image-examples[(ellipse 20 30 "solid" "blue")
                  (scale 2 (ellipse 20 30 "solid" "blue"))]
}

@defproc[(flip-horizontal [k kuva]) kuva]{

 Tekee kuvasta @racket[k] peilikuvan (vasemmalta oikealle).
         
 Tekstiä sisältäviä (@racket[text]) kuvia ei tueta, tämä ilmenee virheilmoituksena.
 
         @image-examples[(beside (square 50 "solid" "red")
                                 (circle 25 "outline" "black"))
                         (flip-horizontal
                          (beside (square 50 "solid" "red")
                                  (circle 25 "outline" "black")))]
}

@defproc[(flip-vertical [k kuva]) kuva]{

 Tekee kuvasta @racket[k] peilikuvan (ylhäältä alas).
         
 Tekstiä sisältäviä (@racket[text]) kuvia ei tueta, tämä ilmenee virheilmoituksena.

         @image-examples[(above (square 50 "solid" "red")
                                 (circle 25 "outline" "black"))
                         (flip-vertical
                          (above (square 50 "solid" "red")
                                  (circle 25 "outline" "black")))]
}

@defproc[(crop [x reaaliluku]
               [y reaaliluku] 
               [leveys positiivinen-reaaliluku]
               [korkeus positiivinen-reaaliluku]
               [k kuva])
         kuva]{

 Rajaa kuvasta @racket[k] suorakulmion sisään jäävän alueen. Alueen yläkulma sijaitsee pisteessä (@racket[x],@racket[y])
 ja sen @racket[leveys] ja @racket[korkeus] annetaan. 
 
 @image-examples[(crop 0 0 40 40 (circle 40 "solid" "red"))
                 (crop 40 40 40 40 (circle 40 "solid" "red"))]
}

@defproc[(frame [k kuva]) kuva]{
 Palautaa kuvan, joka on täysin samanlainen kuin kuva @racket[k], mutta siihen sille on lisätty 
 yhden pikselin levyinen musta reuna.
  
  @image-examples[(frame (ellipse 40 40 "solid" "pink"))]

  Tämän funktion avulla voidaan debugata yhdistettyjä kuvia, eli nähdä missä kohtaa yksittäinen kuva loppuu. 
    
  @image-examples[(beside
                   (ellipse 20 70 "solid" "lightsteelblue")
                   (frame (ellipse 20 50 "solid" "mediumslateblue"))
                   (ellipse 20 30 "solid" "slateblue")
                   (ellipse 20 10 "solid" "navy"))]
}

@;@defproc[(center-pinhole [image image?]) image?]{
@;  Creates a pinhole in @racket[image] at its center.
@;  @image-examples[(center-pinhole (rectangle 40 20 "solid" "red"))
@;                  (rotate 30 (center-pinhole (rectangle 40 20 "solid" "orange")))]}
