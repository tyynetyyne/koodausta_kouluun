#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-intermediate))
@(require (for-label teachpacks/racket-turtle))
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

@title[#:tag "jatko_rekursio"]{Rekursio}

@margin-note[@link["https://youtu.be/et-l5eBAOaw"]{@image[#:scale 0.015 "kuvat/video.png"] Rekursio alkeistapauksella, kesto 11:44}]

Tietokoneen voima on siinä, että se jaksaa toistaa samaa asiaa monta kertaa. Yksi tapa toteuttaa silmukoita on rekursiiviset funktiot.
Ne ovat funktioita, jotka kutsuvat itse itseään. Jotta silmukasta päästään joskus ulos, tarvitaan ehtolausetta.

@margin-note[@link["https://youtu.be/WHX9pTIM0oI"]{@image[#:scale 0.015 "kuvat/video.png"] Rekursio akkumulaattorilla, kesto 8:16}]

Harjoittele rekursiivisten funktioiden tekemistä näiden tehtävien avulla.

@section[#:tag "racket_jatko_rekursio_kuvatehtavat"]{Rekursiiviset kuvatehtävät}

@bold{Rekursiiviset kuvatehtävät}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(left center)       
         (list (list "Tee funktio, joka tuottaa oheisen kuvan mukaisia tikkatauluja rekursion avulla."
                     @image[#:scale 0.6 "kuvat/tikkataulu.png"])
               (list "Tee funktio, joka oheisen kuvan mukaisia ruudukoita. Vinkki: Tee ensin rivejä tuottava funktio."
                     @image[#:scale 0.5 "kuvat/ruudukko.png"])
               (list "Tee funktio, joka tuottaa oheisen kuvan mukaisen sarjan palloja."
                     @image[#:scale 0.6 "kuvat/pallorivi.png"]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai 2htdp-image -kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[circle] @racket[square] @racket[overlay] @racket[beside] @racket[above])
               (list @racket[overlay/xy]@racket[place-image] @racket[rotate] @racket[empty-scene] @racket[*])
               (list @racket[/]@racket[+]@racket[-]@racket[add1]@racket[sub1])
               (list @racket[if]@racket[<]@racket[>]@racket[<=]@racket[>=]))]

@margin-note[@link["https://www.slideshare.net/TiinaPartanen/racket-alkeet-5-oppitunti"]{Opettajan diat.}]

@section[#:tag "epakesko"]{Epäkesko}

Oheinen kuva on saatu aikaan laittamalla yksi ympyrä kuvan vasempaan reunaan ja pyörittämällä näin
saatua "epäkeskoa" kuvaa rekursiivisen funktion avulla ja kokoamalla kierrokset yhdeksi kuvaksi.
Kokeile saatko tehtyä samanlaisen. Kokeile myös samaa ideaa muulaisilla kuvilla.

@image[#:scale 0.5 "kuvat/epakesko.png"]

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/jatko/rekursio/epakesko.rkt"]{Epäkesko (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/epakesko.html"]{Epäkesko (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai 2htdp-image -kirjaston funktioita:
@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[circle] @racket[overlay] @racket[rotate] @racket[*]@racket[/])
               (list @racket[+]@racket[-]@racket[add1]@racket[sub1] @racket[if])
               (list @racket[<]@racket[>]@racket[<=]@racket[>=] @racket[check-expect]))]

@section[#:tag "fraktaalit"]{Fraktaalit}

Rekursion avulla voit toteuttaa myös fraktaaleja, kuten kuvan Sierpinskin kolmio.

@image["kuvat/sierpinski_triangle.png" #:scale 0.5]

Tutustu oheiseen koodiin ja muuta se tekemään Sierpinskin neliöitä.

@image["kuvat/sierpinski_square.png" #:scale 0.4]

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/jatko/rekursio/sierpinski_kolmio_esimerkkiratkaisuja.rkt"]{Sierpinski (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/sierpinski_kolmio_esimerkkiratkaisuja.html"]{Sierpinski (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai 2htdp-image -kirjaston funktioita:
@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[triangle] @racket[square] @racket[above] @racket[beside]@racket[if] @racket[overlay/xy])
                (list @racket[<]@racket[>]@racket[<=]@racket[>=] @racket[sub1] @racket[let]))]