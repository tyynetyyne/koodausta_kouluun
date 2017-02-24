;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/math-utils))
@(require scribble/core
          scribble/html-properties)
@(require scribble/eval)

@declare-exporting[fin-doc/fi-beginner]

@title[#:tag "racket_bsl_luvut" #:style 'toc]{Luvut}

@local-table-of-contents[#:style 'immediate-only ]

@(begin
   (require scribble/manual scribble/eval "sl-eval.rkt")
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require 2htdp/image)
        (require math)
        (define c1 (circle 10 "solid" "green"))
        
        (define zero 0)
        
        (define one (list 1))
        
        (define q (make-posn "bye" 2))
        (define p (make-posn 2 -3))
        
        (define a (list (list 'a 22) (list 'b 8) (list 'c 70)))
        (define v (list 1 2 3 4 5 6 7 8 9 'A))
        (define w (list (list (list (list "bye") 3) #true) 42))
        (define z (list (list (list (list 'a 'b) 2 3) ) (list #false #true) "world"))
        (define y (list (list (list 1 2 3) #false "world")))
        (define x (list 2 "hello" #true))
        (define z (list 2 "hello" #true "hello"))))
     (set! bsl (lambda () *bsl))
     *bsl))

@section[#:style 'unnumbered #:tag "peruslaskutoimitukset"]{Peruslaskutoimitukset}

@defproc[(+ [x luku][y luku][z luku] ...) luku]{
 @index["summa"]{}@index["yhteenlasku"]{Laskee yhteen} annetut luvut.
 @interaction[#:eval (bsl) (+ 2 3) (+ 3 2 -8) (+ 2/3 1/16)]
}
@defproc[(- [x luku][y luku] ...) luku]{
 @index["erotus"]@index["vähennyslasku"]@index["vastaluku"]{Vähentää} toisena annetun luvun (sekä kaikki seuraavat luvut) ensimmäisestä.
 Palauttaa luvun vastaluvun, jos argumentteja on vain yksi.
 @interaction[#:eval (bsl) (- 5 3) (- 5 3 1) (- 5)]
}
@defproc[(* [x luku][y luku][z luku] ...) luku]{
 @index["tulo"]@index["kertolasku"]{Kertoo} annetut luvut keskenään. 
 @interaction[#:eval (bsl) (* 5 3) (* 5 -3 2)]
}
@defproc[(/ [x luku][y luku][z luku] ...) luku]{
 @index["osamäärä"]@index["jakolasku"]{Jakaa} ensimmäisenä annetun luvun toisella (sekä kaikilla seuraavilla luvuilla).
 @interaction[#:eval (bsl) (/ 12 2) (/ 12 2 -3)]
}

@section[#:style 'unnumbered #:tag "vertailuoperaattorit"]{Vertailuoperaattorit}

@defproc[(= [x luku][y luku][z luku] ...) totuusarvo]{
 Palauttaa @racket[#true], jos annetut luvut ovat yhtäsuuria, muuten @racket[#false].
 @interaction[#:eval (bsl) (= 42 42.0)(= 42 42.0 42.01)]
}
@defproc[(< [x reaaliluku][y reaaliluku][z reaaliluku] ...) totuusarvo]{
 Vertailee reaalilukuja toisiinsa @italic{pienempi kuin}-operaattorin avulla.
 Palauttaa @racket[#true], jos annetut luvut ovat suuruusjärjestyksessä (pienin ensin), muuten @racket[#false].
 
 @interaction[#:eval (bsl) (< 5 10) (< 0 5 10)(< 5 0 10)]
}
@defproc[(> [x reaaliluku][y reaaliluku][z reaaliluku] ...) totuusarvo]{
 Vertailee reaalilukuja toisiinsa @italic{suurempi kuin}-operaattorin avulla.
 Palauttaa @racket[#true], jos annetut luvut ovat suuruusjärjestyksessä (suurin ensin), muuten @racket[#false].
 
 @interaction[#:eval (bsl) (> 10 5) (> 10 5 0)(> 10 0 5)]   
}
@defproc[(<= [x reaaliluku][y reaaliluku][z reaaliluku] ...) totuusarvo]{
 Vertailee reaalilukuja toisiinsa @italic{pienempi tai yhtäsuuri kuin}-operaattorin avulla.
 @interaction[#:eval (bsl) (<= 5 10)(<= 5 5.0)]
}
@defproc[(>= [x reaaliluku][y reaaliluku][z reaaliluku] ...) totuusarvo]{
 Vertailee reaalilukuja toisiinsa @italic{suurempi tai yhtäsuuri kuin}-operaattorin avulla.
 @interaction[#:eval (bsl) (>= 10 5)(>= 10 10.0)]
}

@section[#:style 'unnumbered #:tag "perusfunktiot"]{Perusfunktiot}  

@defproc[(sqr [x luku]) luku]{
 Laskee luvun @racket[x] @index["neliö"]{neliön} eli korottaa sen potenssiin 2.
 @interaction[#:eval (bsl) (sqr 3)(sqr -5)]
}
@defproc[(sqrt [x luku]) luku]{
 Laskee luvun @racket[x] @index["neliöjuuri"]{neliöjuuren}.
 @interaction[#:eval (bsl) (sqrt 9) (sqrt 2)]
}
@defproc[(abs [x reaaliluku]) reaaliluku]{
 Palauttaa luvun @racket[x] @index["itseisarvo"]{itseisarvon}.
 @interaction[#:eval (bsl) (abs -12)(abs 2)]
}

@defproc[(expt [x luku][y luku]) luku]{
 Korottaa luvun @racket[x] @index["potenssiin korotus"]{potenssi}in @racket[y].
 @interaction[#:eval (bsl) (expt 2 3) (expt -3 2)]
}

@defproc[(max [x reaaliluku][y reaaliluku] ...) reaaliluku]{
 Määrittelee suurimman luvun eli @index["maksimi"]@italic{maksimin}.
 @interaction[#:eval (bsl) (max 3 2 8 7 2 9 0)]
}
@defproc[(min [x reaaliluku][y reaaliluku] ...) reaaliluku]{
 Määrittelee pienimmän luvun eli @index["minimi"]@italic{minimin}.
 @interaction[#:eval (bsl) (min 3 2 8 7 2 9 0)]
}
@defproc[(random [x luonnollinen-luku]) luonnollinen-luku]{
 Palauttaa @index["satunnaisluku"]{satunnaisluvun}, joka on annettua lukua @racket[x] pienempi,
 ei-negatiivinen kokonaisluku.
 @interaction[#:eval (bsl) (random 42)]
}

@defproc[(add1 [x luku]) luku]{
 Kasvattaa annettua lukua yhdellä.
 @interaction[#:eval (bsl) (add1 2)]
}
@defproc[(sub1 [x luku]) luku]{
 Pienentää annettua lukua yhdellä.
 @interaction[#:eval (bsl) (sub1 2)]
 
 @defproc[(modulo [x kokonaisluku][y kokonaisluku]) kokonaisluku]{
  Palauttaa @index["jakojäännös"]{jakojäännöksen}, joka syntyy kun ensimmäinen luku @racket[x] jaetaan toisella @racket[y].
  @interaction[#:eval (bsl) (modulo 3 2) (modulo 11 3)] 
 }
}

@section[#:style 'unnumbered #:tag "trigonometria"]{Trigonometria}  

Huomaa, että nämä trigonometriset funktiot käyttävät radiaaneja. Jos haluat käyttää asteita,
sinun pitää muuntaa asteet radiaaneiksi @racket[degrees->radians]-funktiolla (@racket[sin], @racket[cos], @racket[tan]):

@margin-note{Miksi radiaanit? Tietokoneet laskevat trigonometriset funktiot tarkemmin radiaaneissa,
 joten käytä niitä aina kuin voit.}

@interaction[#:eval (bsl) (sin (degrees->radians 60))]

Samoin radiaanit pitää muuttaa asteiksi @racket[radians->degrees]-funktiolla (@racket[asin], @racket[acos], @racket[atan]):
@interaction[#:eval (bsl) (radians->degrees(asin 0.5))]

Nämä muunnosfunktiot on määritelty teachpacks/math-utils-kirjastossa, joten ota se käyttöön ensin:
@racket[(require teachpacks/math-utils)]

@margin-note{Jos teachpacks/math-utils:ia ei löydy tai se ei toimi oikein, asenna uusin teachpacks-paketti (update).
Katso asennusohjeet @link["sanasto.html#(part._paketti)"]{täältä}.}

@margin-note{Muunnosfunktiot saat käyttöösi WeScheme:ssä @racket[(require wescheme/f08DD6x94M)].}

@defproc[(sin [x luku]) luku]{
 Laskee luvun @racket[x] @index["sini"]{sinin} arvon (@racket[x] annetaan radiaaneina).
 @interaction[#:eval (bsl) (sin pi)]
 @interaction[#:eval (bsl) (sin (degrees->radians 60))]
}
@defproc[(cos [x luku]) luku]{
 Laskee luvun @racket[x] @index["kosini"]{kosinin} arvon (@racket[x] annetaan radiaaneina).
 @interaction[#:eval (bsl) (cos pi)]
 @interaction[#:eval (bsl) (cos (degrees->radians 60))]
 
}
@defproc[(tan [x luku]) luku]{
 Laskee luvun @racket[x] @index["tangentti"]{tangentin} arvon (@racket[x] annetaan radiaaneina).
 @interaction[#:eval (bsl) (tan pi)]
 @interaction[#:eval (bsl) (tan (degrees->radians 60))]
}
@defproc[(asin [x luku]) luku]{
 Laskee arkussinin (sinin käänteisfunktion) arvon annetulla luvulla @racket[x].
 @interaction[#:eval (bsl) (asin 0)]
 @interaction[#:eval (bsl) (radians->degrees (asin 1/2))]
 
}
@defproc[(acos [x luku]) luku]{
 Laskee arkuskosinin (kosinin käänteisfunktion) arvon annetulla luvulla @racket[x]. 
 @interaction[#:eval (bsl) (acos 0)]
 @interaction[#:eval (bsl) (radians->degrees (acos 2/3))]
}
@defproc[(atan [x luku]) luku]{
 Laskee arkustangentin (tangentin käänteisfunktion) arvon annetulla luvulla @racket[x].
 @interaction[#:eval (bsl) (atan 0) (atan 0.5)]
 @interaction[#:eval (bsl) (radians->degrees (atan 0.5))]
}
@section[#:style 'unnumbered #:tag "pyoristaminen"]{Pyöristäminen}  

@defproc[(floor [x reaaliluku]) kokonaisluku]{
 Palauttaa reaalilukua @racket[x] lähimpänä olevan pienemmän kokonaisluvun.
 @interaction[#:eval (bsl) (floor 12.3)]
}
@defproc[(ceiling [x reaaliluku]) kokonaisluku]{
 Palauttaa reaalilukua @racket[x] lähimpänä olevan suuremman kokonaisluvun.
 @interaction[#:eval (bsl) (ceiling 12.3)]
}

@defproc[(round [x reaaliluku]) kokonaisluku]{
 Pyöristää reaaliluvun lähimpään kokonaisluvuksi (puolivälissä olevat luvut pyöristetään parilliseen lukuun). Katso myös 
 @racket[floor] ja @racket[ceiling].
 @margin-note[@italic{Tämä pyöristystapa on yleinen tietotekniikassa. Sillä pyritään minimoidaan useamman tekijän
                pyöristämisestä aiheutuva pyöristysvirhe (eng. bias).}]
 @interaction[#:eval (bsl) (round 12.3)]
 @interaction[#:eval (bsl) (round 12.5)]
 @interaction[#:eval (bsl) (round 0.5)]
}

@margin-note{Huom! WeScheme:n @racket[round] pyöristää puolivälissä olevat positiiviset luvut ylöspäin ja
 negatiiviset luvut alaspäin (eli "nollasta poispäin").}

@section[#:style 'unnumbered #:tag "predikaatit_lukuvuille"]{Predikaatit}  

@defproc[(number? [n ei-tyyppivaatimusta]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on luku, muuten @racket[#false]. 
 @interaction[#:eval (bsl) (number? "hello world") (number? 42)] 
}

@defproc[(zero? [x luku]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on nolla, muuten @racket[#false].
 @interaction[#:eval (bsl) (zero? 0)(zero? 2)(zero? 0.0)]
}

@defproc[(odd? [x kokonaisluku]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on pariton kokonaisluku, muuten @racket[#false]. 
 @interaction[#:eval (bsl) (odd? 1)(odd? 2)(odd? 1.0)]
}

@defproc[(even? [x kokonaisluku]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on parillinen kokonaisluku, muuten @racket[#false]. 
 @interaction[#:eval (bsl) (even? 2) (even? 1)(even? 2.0)]
}
@defproc[(positive? [x luku]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on suurempi kuin nolla.}

@defproc[(negative? [x luku]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on pienempi kuin nolla.}

@defproc[(integer? [x ei-tyyppivaatimusta]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on kokonaisluku, muuten @racket[#false].
 @interaction[#:eval (bsl) (integer? (sqrt 2))]
}

@defproc[(rational? [x ei-tyyppivaatimusta]) totuusarvo]{
  Palauttaa @racket[#true], jos argumentti on rationaaliluku, muuten @racket[#false]. 
   @interaction[#:eval (bsl) 
     (rational? 1)
     (rational? -2.349)
     (rational? #i1.23456789)
     (rational? (sqrt -1))
     (rational? pi)]
 Kuten esimerkeistä voi huomata, opetuskielet tulkitsevat rationaaliluvuiksi enemmän lukuja kuin voisi olettaa.
 Erityisesti @racket[pi] on rationaaliluku, koska se on vain rajallinen likiarvo matemaattisesta π:stä.
 @racket[rational?] predikaattia kannattaakin käyttää lähinnä silloin kun haluaa testata onko kyseessä murtoluku.
  }

@defproc[(real? [x ei-tyyppivaatimusta]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on reaaliluku, muuten @racket[#false].
 @interaction[#:eval (bsl) (real? 1-2i)]
}

@defproc[(inexact? [x numero]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on likiarvo, muuten @racket[#false].
 @interaction[#:eval (bsl) (inexact? pi)(inexact? #i3.0)]
}

@section[#:style 'unnumbered #:tag "tyyppimuunnokset"]{Tyyppimuunnokset}

@defproc[(number->string [x luku]) merkkijono]{
 Muuntaa luvun merkkijonoksi.
 @interaction[#:eval (bsl) (number->string 42)(number->string (sqrt 2))]
}

@defproc[(exact->inexact [x luku]) luku]{
 Muuttaa tarkan arvon likiarvoksi. 
 @interaction[#:eval (bsl) (exact->inexact 3/4)]
}

@section[#:style 'unnumbered #:tag "aikafunktiot"]{Aikafunktiot}  

@defproc[(current-seconds) kokonaisluku]{
 Palauttaa ajan, joka on kulunut jostakin (ennalta määritellystä) alkupäivämäärästä alkaen. Aika annetaan sekunteina. 
 @interaction[#:eval (bsl) (current-seconds)]
}

@section[#:style 'unnumbered #:tag "vakiot"]{Vakiot}  
@defthing[pi reaaliluku]{
 Ympyrän kehän pituuden ja sen halkaisijan suhde toisiinsa (@code[(string #\u03C0)]). 
 @interaction[#:eval (bsl) pi]
}
