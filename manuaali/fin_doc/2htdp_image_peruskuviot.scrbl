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

@title[#:tag "peruskuviot" #:style 'toc]{Peruskuviot}

@local-table-of-contents[#:style 'immediate-only ]

@(define YMPYRÄ (circle 25 "solid" "aqua"))
@(define SUORAKULMIO (rectangle 100 50 "solid" "slateblue"))
@(define ELLIPSI (ellipse 100 50 "solid" "turquoise"))
@(define TÄHTI (star 50 "solid" "violet"))
@(define MONI  (regular-polygon 60 3 "solid" "tomato"))
@(define MONI2  (regular-polygon 45 5 "solid" "maroon"))
@(define TÄHTI2  (radial-star 10 35 30 "solid" "springgreen"))

@(centered @tabular[#:sep @hspace[1]
                         (list (list YMPYRÄ TÄHTI SUORAKULMIO TÄHTI2 MONI ELLIPSI MONI2 ))])

@section[#:style 'unnumbered #:tag "nelikulmiot"]{Nelikulmiot}

@defproc[(square [sivun-pituus positiivinen-reaaliluku]
                   [tyyli mode?]
                   [väri image-color?])
            kuva]{

 Luo halutun kokoisen, tyyppisen ja värisen @index["neliö"]{neliö}n.

 @image-examples[(square 70 "solid" "slateblue")
                 (square 80 "outline" "turquoise")]
}

@defproc[(rectangle [leveys positiivinen-reaaliluku]
                       [korkeus positiivinen-reaaliluku]
                       [tyyli mode?]
                       [väri image-color?])
            kuva]{

 Luo halutun kokoisen, tyyppisen ja värisen @index["suorakulmio"]{suorakulmio}n.
  
  @image-examples[(rectangle 80 100 "solid" "violet")
                  (rectangle 100 80 "outline" "maroon")]
}

@defproc[(rhombus [sivun-pituus positiivinen-reaaliluku]
                     [kulma reaaliluku]
                     [tyyli mode?]
                     [väri image-color?])
            kuva]{

Luo @index["neljäkäs"]{neljäkkään} eli @italic{suunnikkaan}, jonka kaikki sivut ovat yhtä pitkiä (ja vastakkaiset kulmat yhtäsuuria). Annettu @racket[kulma] määrittelee
    ylimmän (ja alimman) kulman suuruuden.

@image-examples[(rhombus 60 50 "solid" "purple")
                (rhombus 80 150 "solid" "pink")]
}

@section[#:style 'unnumbered #:tag "kolmiot"]{Kolmiot}

@defproc[(triangle [sivun-pituus positiivinen-reaaliluku] 
                      [tyyli mode?]
                      [väri image-color?])
            kuva]{

 Luo kannallaan seisovan @index["tasasivuinen kolmio"]{tasasivuisen kolmion}, jonka @racket[sivun-pituus] on annettu.
  
    @image-examples[(triangle 90 "solid" "springgreen")]

}

@defproc[(right-triangle [kateetin1-pituus positiivinen-reaaliluku]
                            [kateetin2-pituus positiivinen-reaaliluku]
                            [tyyli mode?]
                            [väri image-color?])
            kuva]{

 Luo @index["suorakulmainen kolmio"]{suorakulmaisen kolmio}n, jonka kateettien pituudet ovat @racket[kateetin1-pituus] ja @racket[kateetin2-pituus].
                                                            
  @image-examples[(right-triangle 80 120 "solid" "turquoise")]
}

@defproc[(isosceles-triangle [kyljen-pituus positiivinen-reaaliluku] 
                                [kantakulma reaaliluku]
                                [tyyli mode?]
                                [väri image-color?])
            kuva]{

 Luo @index["tasakylkinen kolmio"]{tasakylkisen kolmion}, jonka @racket[kyljen-pituus] ja @racket[kantakulma] on annettu.                   
 Jos @racket[kantakulma] on pienempi kuin @racket[180], kolmio seisoo kannallaan, muuten se seisoo kärjellään.
 
 @image-examples[(isosceles-triangle 110 45 "solid" "tomato")]
}


@section[#:style 'unnumbered #:tag "monikulmiot"]{Monikulmiot}

@defproc[(regular-polygon [sivun-pituus positiivinen-reaaliluku] 
                             [sivujen-määrä kokonaisluku-3-tai-suurempi]
                             [tyyli mode?]
                             [väri image-color?])
            kuva]{
                    
  Luo @index["säännöllinen monikulmio"]{säännöllisen monikulmion}, jonka @racket[sivujen-määrä] on annettu.
  @racket[sivujen-määrä]:n pitää olla minimissään 3.

  @image-examples[(regular-polygon 80 3 "solid" "aqua")
                  (regular-polygon 70 4 "solid" "slateblue")
                  (regular-polygon 40 8 "outline" "maroon")]
}

@defproc[(star [sivun-pituus positiivinen-reaaliluku] 
                  [tyyli mode?]
                  [väri image-color?])
            kuva]{

Luo viisisakaraisen @index["tähti"]{tähden}, jonka sisään piirretyn viisikulmion @racket[sivun-pituus] on annettu.

  @image-examples[(star 70 "solid" "tomato")]
  
}

@defproc[(radial-star [sakaramäärä kokonaisluku-suurempi-kuin-2]
                         [sisäsäde positiivinen-reaaliluku]
                         [ulkosäde positiivinen-reaaliluku]
                         [tyyli mode?]
                         [väri image-color?])
            kuva]{

Luo tähdenmuotoisen monikulmion, joka määritellään kahden säteen ja @racket[sakaramäärä]:n avulla.                      
@racket[sisäsäde] määrittelee etäisyyden, josta sakara lähtee ja @racket[ulkosäde] etäisyyden, johon sakara päättyy. 
@racket[sakaramäärä] määrittelee sakaroiden kokonaismäärän.

@image-examples[(radial-star 8 8 64 "solid" "slateblue")
                (radial-star 32 40 60 "outline" "springgreen")]

}

@section[#:style 'unnumbered #:tag "ympyrat_ja_ellipsit"]{Ympyrät ja ellipsit}

@defproc[(circle [säde positiivinen-reaaliluku]
                    [tyyli mode?]
                    [väri image-color?])
            kuva]{
                    
  Luo @index["ympyrä"]{ympyrän}, jonka @racket[säde], @racket[tyyli] ja @racket[väri] on annettu.
  
   @image-examples[(circle 50 "solid" "violet")
                   (circle 40 100 "violet")]

}

@defproc[(ellipse [leveys positiivinen-reaaliluku]
                     [korkeus positiivinen-reaaliluku]
                     [tyyli mode?] 
                     [väri image-color?])
            kuva]{

  Luo @index["ellipsi"]{ellipsin}, jonka @racket[leveys], @racket[korkeus], @racket[tyyli] ja @racket[väri] on annettu.                   
  
  @image-examples[(ellipse 110 60 "outline" "slateblue")
                  (ellipse 40 90 "solid" "maroon")] 
}

@section[#:style 'unnumbered #:tag "muut"]{Muut kuviot}

@defproc[(add-line [tausta kuva]
                   [x1 reaaliluku] [y1 reaaliluku]
                   [x2 reaaliluku] [y2 reaaliluku]
                   [väri image-color?])
         kuva]{

  Luo @index["viivan piirtäminen"]{viivan} @racket[tausta]-kuvan päälle, lähtien pisteestä (@racket[x1], @racket[y1])
  ja päättyen pisteeseen (@racket[x2], @racket[y2]).
  Jos viiva menee @racket[tausta]-kuvan reunojen ulkopuolelle, kuvan kokoa kasvatetaan automaattisesti niin että viiva mahtuu
  kokonaisuudessaan mukaan.
  
  @image-examples[(add-line (circle 40 "outline" "tomato")
                            0 80 80 0 "maroon")
                  (add-line (square 60 "solid" "aqua")
                            -30 30 90 30 "slateblue")]
}

@defproc[(text [teksti merkkijono] [fontin-koko kokonaisluku-välillä-1-255] [väri image-color?])
         kuva]{

 Muuntaa annetun merkkijonon @racket[teksti] @index["merkkijono kuvaksi"]{kuvaksi} käyttämällä annettua
 @racket[fontin-koko]:a ja @racket[väri]:ä.
                 
  @image-examples[(text "Moro" 40 "slateblue")
                  (text "Terve" 36 "springgreen")]

  Huom! @racket[fontin-koko] tarkoittaa tässä pikseleitä (ei pisteitä). Jos annat @racket[40]
  argumenttina @racket[text]-funktiolle, lopputuloksena on kuva jonka korkeus on @racket[40] pikseliä. 
}

@defthing[empty-image kuva]{

 @index["tyhjä kuva"]{Tyhjä kuva}. Tämän kuvan leveys ja korkeus ovat nollia eikä se piirry millään tavalla. Jos
 lisäät @racket[empty-image]:n toiseen kuvaan, saat alkuperäisen kuvan.

 @italic{Huom!} Tämä toiminto puuttuu WeSchemestä.}
  
  @image-examples[(image-width empty-image)
                  (equal? (above empty-image
                                 (rectangle 10 10 "solid" "red"))
                          (beside empty-image
                                  (rectangle 10 10 "solid" "red")))]





