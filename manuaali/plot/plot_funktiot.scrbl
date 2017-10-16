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

@title[#:tag "plot_funktiot"]{Kuvaajat (plot)}

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
                 [selite merkkijono]) funktio]{
                                                  
 Määrittelee piirrettävät pisteet listana @racket[pisteet]. Voit halutessasi säätää aluetta, jolle pisteet piirretään
 antamalla x:n rajat @racket[x0]-@racket[xn] sekä y:n rajat @racket[y0]-@racket[yn]. Functiolle annetaan myös
pisteiden @racket[väri] ja @racket[tyyli] sekä niihin liitettävä @racket[selite]-teksti.  Jos selitettä ei haluta antaa,
käytä selitteenä tyhjää merkkijonoa "".
Piirrettävät pisteet voidaan antaa joko listana @racket[posn]-tietueita tai
 x- ja y-koordinaatit sisältäviä listoja. Voit antaa pisteet myös @racket[vector]-muodossa mutta tarvitset
 silloin käyttöösi @italic{Advanced Student Language}:n. Funktiolle voidaan antaa myös yksi piste
 pistelistan @racket[pisteet] sijaan, jos haluaan sijoitaa vain yksi piste koordinaatistoon.}

@defproc[(labeled-points [pisteet lista<posn?>/lista<cons?>/lista<vector?>]
                         [x0 reaaliluku]
                         [xn reaaliluku]
                         [y0 reaaliluku]
                         [yn reaaliluku]
                         [väri image-color?]
                         [tyyli mode?]
                         [selite merkkijono]) funktio]{
                                                  
Toimii kuin @racket[points] mutta näyttää pisteen yhteydessä sen koordinaatit.}

@defproc[(lines [pisteet lista<posn?>/lista<cons?>/lista<vector?>]
                [x0 reaaliluku]
                [xn reaaliluku]
                [y0 reaaliluku]
                [yn reaaliluku]
                [väri image-color?]
                [tyyli mode?]
                [selite merkkijono]) funktio]{
                                                  
Piirtää listan @racket[pisteet] kuten @racket[points] samalla yhdistäen pisteet murtoviivalla.
Voit halutessasi säätää aluetta, jolle pisteet piirretään antamalla x:n rajat @racket[x0]-@racket[xn] sekä
 y:n rajat @racket[y0]-@racket[yn]. Functiolle annetaan myös
pisteiden @racket[väri] ja @racket[tyyli] sekä murtoviivaan liitettävä @racket[selite]-teksti. Jos et halua
pisteitä näkyviin, anna tyyliksi @racket["transparent"].
 Jos selitettä ei haluta antaa,
käytä selitteenä tyhjää merkkijonoa "".
Piirrettävät pisteet voidaan antaa joko listana @racket[posn]-tietueita tai
 x- ja y-koordinaatit sisältäviä listoja. Voit antaa pisteet myös @racket[vector]-muodossa mutta tarvitset
 silloin käyttöösi @italic{Advanced Student Language}:n. Pisteitä on annettava vähintään kaksi, että viiva 
voidaan piirtää.}

@defproc[(lines-labeled-points [pisteet lista<posn?>/lista<cons?>/lista<vector?>]
                               [x0 reaaliluku]
                               [xn reaaliluku]
                               [y0 reaaliluku]
                               [yn reaaliluku]
                               [väri image-color?]
                               [tyyli mode?]
                               [selite merkkijono]) funktio]{
                                                  
Toimii kuin @racket[lines] mutta näyttää pisteen yhteydessä sen koordinaatit.}

@defproc[(images [pisteet lista<posn?>/lista<cons?>/lista<vector?>]
                 [x0 reaaliluku]
                 [xn reaaliluku]
                 [y0 reaaliluku]
                 [yn reaaliluku]
                 [kuva image?]) funktio]{
                                                  
Sijoitaa @racket[kuva]:n jokaiseen annettuun koordinaattipisteeseen @racket[pisteet].
Kuva sijoitetaan koordiaattipisteeseen siten, että sen keskikohta on ko. pisteessä. 
Voit halutessasi säätää aluetta, jolle kuvat piirretään antamalla x:n rajat @racket[x0]-@racket[xn] sekä
 y:n rajat @racket[y0]-@racket[yn]. 
Piirrettävät pisteet voidaan antaa joko listana @racket[posn]-tietueita tai
 x- ja y-koordinaatit sisältäviä listoja. Voit antaa pisteet myös @racket[vector]-muodossa mutta tarvitset
 silloin käyttöösi @italic{Advanced Student Language}:n. Funktiolle voidaan antaa myös yksi piste
 pistelistan @racket[pisteet] sijaan, jos haluaan sijoitaa vain yksi kuva koordinaatistoon.}

@defproc[(plot [funktion-tai-pisteiden-kuvaus funktio/lista<funktio>]
               [x-teksti merkkijono]
               [y-teksti merkkijono]
               [otsikko merkkijono])
         kuva]{
                    
 Piirtää annetun funktion tai pisteet @racket[funktion-tai-pisteiden-kuvaus] koordinaatistoon.
 @racket[funktion-tai-pisteiden-kuvaus] muodostetaan apufunktion @racket[function] tai @racket[points]
 avulla.
 Jos halutaan piirtää useampia kuvaajia samaan kuvaan annetaan lista, joka sisältää
 useamman funktion (@racket[function]), pistesarjan (@racket[points]), murtoviivan (@racket[lines]) tai
 kuvan (@racket[images]) määrittelyt.
 @racket[plot]-palauttaa kuvan.
 
 Functiolle annetaan lisäksi x- ja y-akselien nimet @racket[x-teksti] ja @racket[y-teksti] sekä kuvan
 otsikko @racket[otsikko].
}

@defproc[(plot-with-axes [funktion-tai-pisteiden-kuvaus funktio/lista<funktio>]
                         [x-teksti merkkijono]
                         [y-teksti merkkijono]
                         [otsikko merkkijono])
         kuva]{
                    
Toimii kuin @racket[plot] mutta lisää x- ja y-akselin nuolineen näkyviin ja sijoittaa
 @racket[x-teksti]:n ja @racket[y-teksti]:n akselien yhteyteen.}

Esimerkkejä:

@racketblock[(plot (function sin (- pi) pi "red" "sin") "x" "y" "Tehtävä 1")]

@centered[@image[#:scale 0.7 "plot/sin.png"]]

@racketblock[(plot (list (function cos  (- pi) pi "red" "cos" )
                         (function sin (- pi) pi "blue" "sin" )) "x" "y" "tehtävä 2")]

@centered[@image[#:scale 0.7 "plot/sincos.png"]]

@racketblock[(define (y x)(* 2 x))
             (plot-with-axes (function y -10 10 "blue" "y=2x") "x" "y" "Suora y=2x")]

@centered[@image[#:scale 0.7 "plot/2x.png"]]

@racketblock[(define (f x)(* x x))
             (define (g x)(+ (* 6 x) 15))
             (plot (list (function g -5 10 "red" "y=6x+15")
                         (function f -10 10 "blue" "y=x^2"))
                     "x-akseli" "y-akseli" "Tehtävä 1")]

@centered[@image[#:scale 0.7 "plot/paraabelisuora.png"]]

@racketblock[(plot-with-axes (points (list '(1 2) '(2 3) '(3 4)) 0 4 0 5 "blue" "outline" "") "x" "y" "Pisteet")] 

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
             (plot (list (function f1 0 7 "blue" "y=2x")
                         (labeled-points (list '(1 2) '(2 4) '(3 5) '(4 7) '(5 11) '(6 12)) 0 7 0 14 "blue" "outline" ""))
                   "x-akseli" "y-akseli" "Tehtävä 3")]

@centered[@image[#:scale 0.7 "plot/dots2.png"]]

@racketblock[(define p4 (list '(1 2) '(2 3) '(3 5)))
             (define p5 (list '(-1 2) '(-2 3) '(-3 5)))
             (plot-with-axes (list
                              (lines p4 0 4 0 6 "blue" "transparent" "käyrä 1")
                              (lines-labeled-points p5 0 -4 0 6 "green" "solid" "käyrä 2"))
                             "x" "y" "Käyrät")]

@centered[@image[#:scale 0.7 "plot/lines.png"]]

@racketblock[(define p6 (list '(1 -3) '(3 -3) '(3 -1)'(1 -3)))
             (define p7 (list '(-3 -2) '(-3 1) '(-1 1)'(-1 -2)'(-3 -2)))
             (plot (list (lines p6 -5 5 -5 0 "red" "solid" "")
                         (lines p7 -5 5 -5 5 "cyan" "transparent" "")
                         (images (make-posn 1 3) 0 5 0 5 (circle 40 "outline" "black"))
                         (labeled-points (make-posn 1 3) 0 5 0 5 "black" "solid" ""))
                   "x-akseli" "y-akseli" "Geometriset kuviot")]

@centered[@image[#:scale 0.7 "plot/geometry.png"]]



