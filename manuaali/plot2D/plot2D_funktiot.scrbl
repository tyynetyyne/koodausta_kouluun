#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-intermediate))
@(require (for-label teachpacks/plot2D))
@(require scribble/core
          scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@declare-exporting[teachpacks/plot2D]

@title[#:tag "plot2D_funktiot"]{Plot2D-funktiot}

@defproc*[([(func [funktion-nimi funktio]
                  [x0 reaaliluku]
                  [xn reaaliluku])
            funktio]
           [(func [funktion-nimi funktio]
                  [x0 reaaliluku]
                  [xn reaaliluku]
                  [selite merkkijono]) funktio])]{
                                                  
 Määrittelee piirrettävän funktion nimen @racket[funktion-nimi] sekä piirtovälin @racket[x0]-@racket[xn]. Halutessasi voit antaa
 myös funktion kuvaajaan väriin liitettävän @racket[selite]-tekstin. }

@defproc*[([(dots [pisteet lista<posn?>/lista<cons?>/lista<vector?>])
             funktio]
           [(dots [pisteet lista<posn?>/lista<cons?>/lista<vector?>]
                  [x0 reaaliluku]
                  [xn reaaliluku]
                  [y0 reaaliluku]
                  [yn reaaliluku])
            funktio]
           [(dots [pisteet lista<posn?>/lista<cons?>/lista<vector?>]
                  [x0 reaaliluku]
                  [xn reaaliluku]
                  [y0 reaaliluku]
                  [yn reaaliluku]
                  [selite merkkijono]) funktio])]{
                                                  
 Määrittelee piirrettävät pisteet listana @racket[pisteet]. Voit halutessasi säätää aluetta, jolle pisteet piirretään
 antamalla x:n rajat @racket[x0]-@racket[xn] sekä y:n rajat @racket[y0]-@racket[yn]. Halutessasi voit antaa myös
 pisteiden väriin liitettävän @racket[selite]-tekstin. Piirrettävät pisteet voidaan antaa joko listana @racket[posn]-tietueita tai
 x- ja y-koordinaatit sisältäviä listoja. Voit antaa pisteet myös @racket[vector]-muodossa mutta tarvitset
 silloin käyttöösi @italic{Advanced Student Language}:n.}

@defproc*[([(plot2D [funktion-tai-pisteiden-kuvaus funktio/lista<funktio>])
            kuva]
           [(plot2D [funktion-tai-pisteiden-kuvaus funktio/lista<funktio>]
                    [x-teksti merkkijono]
                    [y-teksti merkkijono]
                    [otsikko merkkijono])
            kuva])]{
                    
 Piirtää annetun funktion tai pisteet @racket[funktion-tai-pisteiden-kuvaus] koordinaatistoon.
 @racket[funktion-tai-pisteiden-kuvaus] muodostetaan apufunktion @racket[func] tai @racket[dots] avulla.
 Jos halutaan piirtää useampia kuvaajia ja/tai pistesarjoja samaan kuvaan annetaan lista, joka sisältää
 useamman funktion (@racket[func]) tai pistesarjan (@racket[dots]) määrittelyn. @racket[plot2D]-palauttaa kuvan.
 
 Halutessasi voit uudelleen nimetä kuvan x- ja y-akselit antamalla niille nimet @racket[x-teksti] ja @racket[y-teksti]. Kuvalle voi myös
 halutessaan antaa nimen @racket[otsikko].
}

Esimerkkejä:

@racketblock[(plot2D (func sin (- pi) pi))]

@centered[@image[#:scale 0.7 "plot2D/sin.png"]]

@racketblock[(plot2D (list (func sin (- pi) pi "sin(x)")
                           (func cos (- pi) pi "cos(x)")))]

@centered[@image[#:scale 0.7 "plot2D/sincos.png"]]

@racketblock[(define (y x)(* 2 x))
             (plot2D (func y -10 10 "y=2x"))]

@centered[@image[#:scale 0.7 "plot2D/2x.png"]]

@racketblock[(define (f x)(* x x))
             (define (g x)(+ (* 6 x) 15))
             (plot2D (list (func f -10 10 "paraapeli")
                           (func g -5 10 "suora"))
                     "x-akseli" "y-akseli" "Tehtävä 1")]

@centered[@image[#:scale 0.7 "plot2D/paraabelisuora.png"]]

@racketblock[(plot2D (dots (list '(1 2) '(2 3) '(3 4)) 0 4 0 5))] 

@centered[@image[#:scale 0.7 "plot2D/dots3.png"]]

@racketblock[(define p1 (list (make-posn 1 2)(make-posn 2 3)(make-posn 3 4)))
             (define p2 (list '(1 -3) '(2 -2) '(3 -1)))
             (define p3 (map vector (list -3 -2 -1)(list 3 2 1)))
             (plot2D (list (dots p1 0 5 0 6 "p1")
                           (dots p2 0 5 -5 0 "p2")
                           (dots p3 -5 0 0 5 "p3"))
                     "x-akseli" "y-akseli" "Tehtävä 2")]

@centered[@image[#:scale 0.7 "plot2D/dots.png"]]

@racketblock[(define (f1 x)(* 2 x))
             (plot2D (list (func f1 0 7 "y=2x")
                           (dots (list '(1 2) '(2 4) '(3 5) '(4 7) '(5 11) '(6 12))))
                     "x-akseli" "y-akseli" "Tehtävä 3")]

@centered[@image[#:scale 0.7 "plot2D/dots2.png"]]
