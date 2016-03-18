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

@title[#:tag "jatko_listat"]{Listat}

Kun käsitellään isoa määrä tietoa, on kätevää tallentaa se tietorakenteeseen, jonka koko voi
kasvaa ja pienentyä tarvittaessa. Lista on juuri tällainen tietorakenne. Listaan voi lisätä
alkioita, siitä voi poistaa alkioita, listoja voi yhdistellä jne. Listamuotoista tietoa on
myös helppo käsitellä rekursiivisilla funktioilla tai  
@italic[@link["http://racket.koodiaapinen.fi/manuaali/racket_isl_higher_order_funktiot.html"]{Higher Order - funktioilla}].
Tutustu niihin Koodarin käsikirjan avulla.

Harjoittele listojen käyttöä seuraavien tehtävien avulla.

@section[#:tag "racket_jatko_turtle"]{Racket Turtle - jatko}

Harjoittele listoja, rekursiivisia funktioita tai Higher Order - funktioita piirtämällä
Turtlella silmukkakuvioita.

@bold{Racket Turtle - silmukkakuviot}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Ohjaa Racket Turtle tekemään kuvan mukainen spiraali käyttämällä rekursiivista funktiota tai Higher Order - funktioita."
                     @image[#:scale 0.6 "kuvat/turtle_spiraali.png"])
               (list "Tee rekursiivisen funktion tai Higher Order - funktion avulla lista, joka sisältää kooltaan kasvavia satunnaisen värisiä tähtiä."
                     @image[#:scale 0.5 "kuvat/tahtilista.png"])
               (list "Liitä edellä tekemäsi tähtilista yhteen ensimmäisen kohdan spiraalin ohjeiden kanssa.
Saatko aikaan jotain tämän tyylistä?"
                     @image[#:scale 0.4 "kuvat/tahtispiraali.png"])
               (list "Ohjaa Turtle kulkemaan satunnaiseen suuntaan satunnaisen pituisia matkoja."
                     @image[#:scale 0.4 "kuvat/randomturtle.png"]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen, 2htdp/image-kirjaston ja Racket Turtle -kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[star] @racket[make-color] @racket[random] @racket[map] @racket[foldl] @racket[foldr] @racket[range])
               (list @racket[forward] @racket[turn-left] @racket[turn-right] @racket[stamper-on] @racket[pen-up] @racket[list] @racket[draw]))]


@section[#:tag "racket_jatko_laskut"]{Laskutoimituksia listoilla}

Harjoittele listojen kanssa laskemista seuraavien tehtävien avulla.

@bold{Laskutoimitukset listoilla}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left left)
         
         (list (list "Keskiarvo, mediaani ja moodi" "Tee funktiot, jotka laskevat listassa olevista luvuista keskiarvon, mediaanin sekä moodin.")
               (list "Eratostheneen seula alkulukujen etsimiseen" "Algoritmi:
Muodostetaan lista (2, 3, ... 100). Poistetaan listasta kaikki luvut, jotka ovat jaollisia kymmentä pienemmillä alkuluvuilla: 2, 3, 5 ja 7. Jäljelle jääneet luvut ovat jaollisia vain itsellään ja ykkösellä eli ne ovat alkulukuja. Sataan asti tarkistamiseen riittää tutkia jaollisuus kymmentä pienemmillä luvuilla (10*10=100). Eratosthenen seula sataa pienemmillä alkuluvuilla antaisi siis alkuluvut, jotka ovat pienempiä kuin 10000 (100*100) jne."))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/] @racket[map] @racket[foldl] @racket[foldr] @racket[range])
               (list @racket[add1] @racket[sub1] @racket[max]@racket[filter]@racket[remove]@racket[cons] @racket[floor] @racket[first])
               (list @racket[rest] @racket[empty?] @racket[<]@racket[>]@racket[<=]@racket[>=]@racket[=]@racket[lambda]))]


@section[#:tag "racket_jatko_listat_kuvat"]{Kuvatehtävät}

Voit hyödyntää Higher Order -funktioita sekä listoja myös kuvien piirtämisessä. @racket[map]:in ja
@racket[range]:n avulla saat tehtyä esim. erikokoisia kuvia sisältävän listan. Nämä saa samaan
kuvaan @racket[foldl]:in avulla.

Harjoittele Higher Order -funktioita sekä listojen käyttöä seuraavien harjoitusten avulla.

@bold{Kuvatehtävät}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(left center)       
         (list (list "Tee funktio, joka tuottaa oheisen kuvan mukaisia ympyräkuvioita silmukan avulla."
                     @image[#:scale 0.5 "kuvat/ympyrat_sisakkain.png"])
               (list "Tee funktio, joka tuottaa kuvia, jossa on eri määriä satunnaisilla paikoilla satunnaisen kokoisia palloja,
satunnaisen värisinä. Tässä mallikuvassa on 300 palloa."
                     @image[#:scale 0.5 "kuvat/pallotaide.png"])
(list "Tee funktio, joka tuottaa oheisen kuvion mukaisen tähden. Vinkki: Värit kannattaa tallentaan listaan,
joka annetaan parametrina rekursiiviselle funktiolle."
      @image[#:scale 0.5 "kuvat/deathstar.png"]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[circle] @racket[map] @racket[foldl] @racket[foldr] @racket[range] @racket[overlay])
               (list @racket[overlay/xy]@racket[place-image] @racket[star] @racket[make-color] @racket[empty-scene] @racket[random]))]



