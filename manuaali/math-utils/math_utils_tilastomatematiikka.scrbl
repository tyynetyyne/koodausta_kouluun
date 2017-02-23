#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-intermediate))
@(require (for-label teachpacks/math-utils))
@(require scribble/core
          scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@declare-exporting[teachpacks/math-utils]

@title[#:tag "math_utils_tilastomatematiikka"]{Tilastolliset tunnusluvut}

@(begin
   (require scribble/manual scribble/eval fin-doc/sl-eval)
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require teachpacks/math-utils)
       (define a 5)))
     (set! bsl (lambda () *bsl))
     *bsl))

@defproc[(mean [luvut Lista<Luku>])
         Luku]{                                                  
Laske annetun listan @racket[luvut] sisältämien lukujen keskiarvon.}

@racketblock[(mean (list 1 2 3 4 5 6 7 8))]

@defproc[(mode [luvut Lista<Luku>])
         Luku]{                                                  
Etsii annetun listan @racket[luvut] sisältämien lukujen moodin eli tyyppiarvon.}

@racketblock[(mode (list 1 2 1 3 2 3 4 1))]

@defproc[(median [luvut Lista<Luku>])
         Luku]{                                                  
Etsii annetun listan @racket[luvut] sisältämien lukujen mediaanin eli järjestetyn joukon keskimmäisen alkion arvon
 (pariton määrä alkioita) tai kahden keskimmäisen alkion arvojen keskiarvon (parillinen määrä alkioita).}

@racketblock[(median (list 1 2 1 3 2 3 4 1))]
@racketblock[(median (list 1 2 1 3 2 3 4))]

@defproc[(frequency [alkio ei-tyyppi-vaatimusta]
                    [lista Lista<ei-tyyppivaatimusta>])
         Luku]{                                                  
Palauttaa @racket[alkio]:n esiintymiskerrat annetussa listassa @racket[luvut].

@racketblock[(frequency 1 (list 1 2 1 3 2 3 4 1))]
@racketblock[(frequency "Janne" (list "Mikko" "Janne" "Jaana" "Satu" "Janne" "Juuso"))]
}
@defproc[(frequencies [lista Lista<ei-tyyppivaatimusta>])
         Lista]{                                                  
Palauttaa listan, joka sisältää kaikki alkiot ja niiden esiintymiskerrat annetussa listassa ryhmiteltyinä pareiksi.
Tämä lista on järjestetty pienenevän esiintymistiheyden mukaiseen järjestykseen.
}
@racketblock[(frequencies (list 1 2 1 3 2 3 4 1))]
@racketblock[(frequencies (list "Janne" "Janne" "Jaana" "Satu" "Janne" "Satu"))]

