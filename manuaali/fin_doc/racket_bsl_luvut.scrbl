;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
          scribble/html-properties)
@(require scribble/eval)

@declare-exporting[fin-doc/fi-beginner]

@title[#:tag "racket_bsl_luvut" #:style 'toc]{Luvut: kokonais-, rationaali- ja reaaliluvut}

@local-table-of-contents[#:style 'immediate-only ]

@(begin
   (require scribble/manual scribble/eval "sl-eval.rkt")
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require 2htdp/image)
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
 Palauttaa @index["satunnaisluku"]{satunnaisluvun}, joka on annettua lukua @racket[x] pienempi, positiivinen kokonaisluku.
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

@section[#:style 'unnumbered #:tag "pyoristaminen"]{Pyöristäminen}  

@defproc[(floor [x reaaliluku]) kokonaisluku]{
 Palauttaa reaalilukua @racket[x] lähimpänä olevan pienemmän kokonaisluvun.
 @interaction[#:eval (bsl) (floor 12.3)]
}
@defproc[(ceiling [x reaaliluku]) kokonaisluku]{
 Palauttaa reaalilukua @racket[x] lähimpänä olevan suuremman kokonaisluvun.
 @interaction[#:eval (bsl) (ceiling 12.3)]
}

@section[#:style 'unnumbered #:tag "predikaatit_lukuvuille"]{Predikaatit}  

@defproc[(number? [n ei-tyyppivaatimusta]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on luku, muuten @racket[#false]. 
 @interaction[#:eval (bsl) (number? "hello world") (number? 42)] 
}

@defproc[(integer? [x ei-tyyppivaatimusta]) totuusarvo]{
 Palauttaa @racket[#true], jos argumentti on kokonaisluku, muuten @racket[#false].
 @interaction[#:eval (bsl) (integer? (sqrt 2))]
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

@section[#:style 'unnumbered #:tag "tyyppimuunnokset"]{Tyyppimuunnokset}

@defproc[(number->string [x luku]) merkkijono]{
 Muuntaa luvun merkkijonoksi.
 @interaction[#:eval (bsl) (number->string 42)(number->string (sqrt 2))]
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
