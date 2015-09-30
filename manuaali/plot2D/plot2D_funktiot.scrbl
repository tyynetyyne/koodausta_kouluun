#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
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
                  cons?]
           [(func [funktion-nimi funktio]
                  [x0 reaaliluku]
                  [xn reaaliluku]
                  [selite merkkijono]) cons?])]{

 Määrittelee piirrettävän funktion nimen @racket[funktion-nimi] sekä piirtovälin @racket[x0]-@racket[xn]. Halutessasi voit antaa
 myös funktion kuvaajaan väriin liitettävän @racket[selite]-tekstin. }

@defproc*[([(plot2D [funktion-kuvaus func/List-of-func])
                    kuva]
           [(plot2D [funktion-kuvaus func/List-of-func]
                    [x-teksti merkkijono]
                    [y-teksti merkkijono]
                    [otsikko merkkijono])
            kuva])]{

Piirtää annetun funktion @racket[funktion-kuvaus] kuvaajan. @racket[funktion-kuvaus] muodostetaan apufunktion @racket[func]-avulla.
 Jos halutaan piirtää useampia kuvaajia samaan kuvaan annetaan lista, joka sisältää useamman funktion kuvauksen, jotka on muodostettu
 @racket[func]-apufunktion avulla. @racket[plot2D]-palauttaa kuvan.

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
