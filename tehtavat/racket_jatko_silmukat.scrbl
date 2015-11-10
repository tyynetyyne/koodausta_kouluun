#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-intermediate))
@(require (for-label teachpacks/racket-turtle))
@(require (for-label (except-in math sqr)))
@(require scribble/core
          scribble/html-properties)
@(require scribble/racket)
@(require scribble/eval)
@(require fin-doc/pr-math)
@setup-math

@(begin
   (require scribble/manual scribble/eval fin-doc/sl-eval)
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require 2htdp/image)
        (require math)
        (define a 5)
        (define b "kissa")
        (define c (circle 20 "solid" "red"))))
     (set! bsl (lambda () *bsl))
     *bsl))

@title[#:tag "jatko_silmukat"]{Silmukat A}

Tietokoneen voima on siinä, että se jaksaa toistaa samaa asiaa monta kertaa. Yksi tapa toteuttaa silmukoita ovat
@italic[@link["http://racket.koodiaapinen.fi/manuaali/racket_isl_higher_order_funktiot.html"]{higher order - funktiot}]. Tutustu niihin Koodarin käsikirjan avulla.

Harjoittele simukoiden tekemistä näiden tehtävien avulla.

@section[#:tag "racket_jatko_kuvatehtavat"]{Kuvatehtävät}

@bold{Kuvatehtäviä silmukoille}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(left center)       
         (list (list "Tee funktio, joka tuottaa oheisen kuvan mukaisia ympyräkuvioita silmukan avulla."
                     @image[#:scale 0.5 "kuvat/ympyrat_sisakkain.png"])
               (list "Tee funktio, joka tuottaa kuvia, jossa on eri määriä satunnaisilla paikoilla satunnaisen kokoisia palloja,
satunnaisen värisinä. Tässä mallikuvassa on 300 palloa."
                     @image[#:scale 0.5 "kuvat/pallotaide.png"])
(list "Oheinen kuva on saatu aikaan laittamalla yksi ympyrä kuvan vasempaan reunaan ja pyörittämällä näin
saatua \"epäkeskoa\" kuvaa silmukassa.
Kokeile millaisia kuvia saat aikaan, kun vaihdat kuvion muotoa ja sijaintia sekä silmukan argumentteja."
                     @image[#:scale 0.5 "kuvat/epakesko.png"]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[circle] @racket[map] @racket[foldl] @racket[foldr] @racket[range] @racket[overlay])
               (list @racket[overlay/xy]@racket[place-image] @racket[rotate] @racket[make-color] @racket[empty-scene] @racket[random]))]

@section[#:tag "racket_turtle_jatko"]{Racket Turtle - jatko}

Harjoittele silmukkarakenteita Racket Turtle:n avulla.

@bold{Racket Turtle - silmukoita}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Ohjaa Racket Turtle tekemään kuvan mukainen spiraali käyttämällä silmukkaa."
                     @image[#:scale 0.6 "kuvat/turtle_spiraali.png"])
               (list "Tee silmukan avulla lista, joka sisältää kooltaan kasvavia satunnaisen värisiä tähtiä."
                     @image[#:scale 0.5 "kuvat/tahtilista.png"])

               (list "Liitä edellä tekemäsi tähtilista yhteen ensimmäisen kohdan spiraalin ohjeiden kanssa.
Saatko aikaan jotain tämän tyylistä?"
                     @image[#:scale 0.4 "kuvat/tahtispiraali.png"]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen, 2htdp/image-kirjaston ja Racket Turtle -kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[star] @racket[make-color] @racket[random] @racket[map] @racket[foldl] @racket[foldr] @racket[range])
               (list @racket[forward] @racket[turn-left] @racket[turn-right] @racket[stamper-on] @racket[pen-up] @racket[list] @racket[draw]))]
