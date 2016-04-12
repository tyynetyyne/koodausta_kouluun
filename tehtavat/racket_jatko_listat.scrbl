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

@section[#:tag "racket_jatko_rekursiiviset_listat"]{Listan "syöntiä" ja luontia rekursiivisesti}

Harjoittele listojen ja rekursion käyttöä seuraavien tehtävien avulla.

@bold{Listan "syöntiä" ja luontia rekursiivisesti}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left)
         
         (list (list "Tee funktio, joka laskee listassa olevista luvuista keskiarvon.")
               (list "Tee funktio, joka laskee listassa oleville hinnoille alennetun/korotetun hinnan, kun
funktiolle annetaan haluttu muutosprosentti (esim. -10 tarkoittaa -10%, 20 tarkoittaa +20%).")
               (list "Tee funktio, joka ottaa sisäänsä oppilaiden nimet listana, ja palauttaa listan
jossa on arvottu uudet oppilasparit. Esim. alkuperäinen lista: (list \"Jenni\" \"Ulla\" \"Pasi\" \"Panu\" )

Uusi parit-lista:
(list (list \"Jenni\" \"Pasi\")
      (list \"Panu\" \"Ulla\"))"))]
         
Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[/] @racket[list-ref] @racket[length] @racket[string=?] @racket[random])
               (list @racket[remove] @racket[cons] @racket[first] @racket[rest] @racket[empty?] @racket[let*]))]

@section[#:tag "racket_jatko_listat_kuvat"]{Kuvatehtäviä listoilla}

Listaa voi käydä läpi myös niin, että se ei tyhjene vaan käytetty alkio siirretään listan loppuun, jolloin
se tulee käyttöön jälleen omalla vuorollaan. Käytä tätä ideaa apunasi seuraavassa tehtävässä. 

@bold{Kuvatehtäviä listoilla}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(left center)       
         (list (list "Tee funktio, joka tuottaa oheisen kuvion mukaisen \"Death Star\" -tähden.
Vinkki: Värit kannattaa tallentaan listaan, joka annetaan parametrina rekursiiviselle funktiolle."
      @image[#:scale 0.5 "kuvat/deathstar.png"]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[overlay] @racket[star] @racket[random] @racket[first]@racket[rest])
               (list @racket[append]@racket[list] @racket[+] @racket[-] @racket[if])
               (list @racket[<]@racket[>]@racket[<=]@racket[>=]@racket[=]))]

@section[#:tag "racket_jatko_laskut"]{Laskutoimituksia listoilla ja Higher Order - funktioilla}

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