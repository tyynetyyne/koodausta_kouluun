#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-intermediate))
@(require (for-label teachpacks/plot))
@(require scribble/core
          scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@declare-exporting[teachpacks/plot]

@title[#:tag "plot_funktiot"]{Plot-funktiot}

@defproc[(function [funktion-nimi funktio]
                   [x0 reaaliluku]
                   [xn reaaliluku]
                   [väri image-color?]
                   [selite merkkijono]) funktio]{
                                                  
 Määrittelee piirrettävän funktion nimen @racket[funktion-nimi] sekä piirtovälin @racket[x0]-@racket[xn].
 Funktiolle annetaan myös funktion kuvaajan @racket[väri]:n sekä siihen liitettävä @racket[selite]-tekstin.
 Jos selitettä ei haluta antaa, käytä selitteenä tyhjää merkkijonoa "".}

@defproc[(points [pisteet lista<posn?>/lista<cons?>/lista<vector?>]
                 [x0 reaaliluku]
                 [xn reaaliluku]
                 [y0 reaaliluku]
                 [yn reaaliluku]
                 [väri image-color?]
                 [tyyli mode?]
                 [selite merkkijono]) funktio])]{
                                                  
 Määrittelee piirrettävät pisteet listana @racket[pisteet]. Voit halutessasi säätää aluetta, jolle pisteet piirretään
 antamalla x:n rajat @racket[x0]-@racket[xn] sekä y:n rajat @racket[y0]-@racket[yn]. Functiolle annetaan myös
pisteiden @racket[väri] ja @racket[tyyli] sekä niihin liitettävä @racket[selite]-teksti.  Jos selitettä ei haluta antaa,
käytä selitteenä tyhjää merkkijonoa "".
Piirrettävät pisteet voidaan antaa joko listana @racket[posn]-tietueita tai
 x- ja y-koordinaatit sisältäviä listoja. Voit antaa pisteet myös @racket[vector]-muodossa mutta tarvitset
 silloin käyttöösi @italic{Advanced Student Language}:n.}

@defproc[(plot [funktion-tai-pisteiden-kuvaus funktio/lista<funktio>]
               [x-teksti merkkijono]
               [y-teksti merkkijono]
               [otsikko merkkijono])
         kuva]{
                    
 Piirtää annetun funktion tai pisteet @racket[funktion-tai-pisteiden-kuvaus] koordinaatistoon.
 @racket[funktion-tai-pisteiden-kuvaus] muodostetaan apufunktion @racket[function] tai @racket[points]
 avulla.
 Jos halutaan piirtää useampia kuvaajia ja/tai pistesarjoja samaan kuvaan annetaan lista, joka sisältää
 useamman funktion (@racket[function]) tai pistesarjan (@racket[points]) määrittelyn.
 @racket[plot]-palauttaa kuvan.
 
 Functiolle annetaan lisäksi x- ja y-akselien nimet @racket[x-teksti] ja @racket[y-teksti] sekä kuvan
 otsikko @racket[otsikko].
}

Esimerkkejä:

@racketblock[(plot (function sin (- pi) pi "red" "sin") "x" "y" "tehtävä 1")]

@centered[@image[#:scale 0.7 "plot/sin.png"]]

@racketblock[(plot (list (function cos  (- pi) pi "red" "cos" )
            (function sin (- pi) pi "blue" "sin" ))
            "x" "y" "tehtävä 2")]

@centered[@image[#:scale 0.7 "plot/sincos.png"]]

@racketblock[(define (y x)(* 2 x))
             (plot2D (func y -10 10 "y=2x"))]

@centered[@image[#:scale 0.7 "plot2D/2x.png"]]

@racketblock[(define (f x)(* x x))
             (define (g x)(+ (* 6 x) 15))
             (plot (list (function f -10 10 "red" "y=x^2")
                         (function g -5 10 "blue" "y=6x+15"))
                     "x-akseli" "y-akseli" "Tehtävä 1")]

@centered[@image[#:scale 0.7 "plot/paraabelisuora.png"]]

@racketblock[(plot (points (list '(1 2) '(2 3) '(3 4)) 0 4 0 5 "blue" "") "x" "y" "points")] 

@centered[@image[#:scale 0.7 "plot/dots3.png"]]

@racketblock[(define p1 (list (make-posn 1 2)(make-posn 2 3)(make-posn 3 4)))
             (define p2 (list '(1 -3) '(2 -2) '(3 -1)))
             (define p3 (map vector (list -3 -2 -1)(list 3 2 1)))
             (plot (list (points p1 0 5 0 6 "blue" "outline" "p1")
                         (points p2 0 5 -5 0 "red" "solid" "p2")
                         (points p3 -5 0 0 5 "green" "outline" "p3"))
                     "x-akseli" "y-akseli" "Tehtävä 2")]

@centered[@image[#:scale 0.7 "plot/dots.png"]]

@racketblock[(define (f1 x)(* 2 x))
             (plot2D (list (func f1 0 7 "y=2x")
                           (dots (list '(1 2) '(2 4) '(3 5) '(4 7) '(5 11) '(6 12))))
                     "x-akseli" "y-akseli" "Tehtävä 3")]

@centered[@image[#:scale 0.7 "plot/dots2.png"]]
