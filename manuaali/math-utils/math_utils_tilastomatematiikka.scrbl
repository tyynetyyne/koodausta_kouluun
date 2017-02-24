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

@defproc[(mean [luvut lista<luku>])
         luku]{                                                  
Laske annetun listan @racket[luvut] sisältämien lukujen keskiarvon.}

@interaction[#:eval (bsl) (mean (list 1 2 3 4 5 6 7 8))]   

@defproc[(median [luvut lista<luku>])
         luku]{                                                  
Etsii annetun listan @racket[luvut] sisältämien lukujen mediaanin eli järjestetyn joukon keskimmäisen alkion arvon
 (pariton määrä alkioita) tai kahden keskimmäisen alkion arvojen keskiarvon (parillinen määrä alkioita).}

@interaction[#:eval (bsl) (median (list 1 2 1 3 1 3 4 1 5))]   

@interaction[#:eval (bsl) (median (list 1 2 1 3 1 3 4 1))]   

@defproc[(frequency [alkio ei-tyyppi-vaatimusta]
                    [data lista<ei-tyyppivaatimusta>])
         luku]{                                                  
Palauttaa @racket[alkio]:n esiintymiskerrat annetussa listassa @racket[data].

@interaction[#:eval (bsl) (frequency 1 (list 1 2 1 3 2 3 4 1))]   

@interaction[#:eval (bsl) (frequency "Janne" (list "Mikko" "Janne" "Jaana" "Satu" "Janne" "Juuso"))]   

}
@defproc[(frequencies [data lista<ei-tyyppivaatimusta>])
         lista]{                                                  
Palauttaa listan, joka sisältää kaikki alkiot ja niiden esiintymiskerrat annetussa listassa ryhmiteltyinä pareiksi.
Tämä lista on järjestetty pienenevän esiintymistiheyden mukaiseen järjestykseen.
}

@interaction[#:eval (bsl) (frequencies (list 1 2 1 3 2 3 4 1))]   

@interaction[#:eval (bsl) (frequencies (list "Janne" "Janne" "Jaana" "Satu" "Janne" "Satu"))]   

@defproc[(mode [data lista<ei-tyyppivaatimusta>])
         ei-tyyppivaatimusta]{                                                  
Etsii annetun listan @racket[data] sisältämien alkioiden moodin eli tyyppiarvon (arvo jolla on suurin frekvenssi).
 Jos tyyppiarvoja on useita, ne palautetaan listana. Jos kukin arvo esiintyy listassa vain kerran, palautetaan @racket[#false]. }

@interaction[#:eval (bsl) (mode (list 1 2 1 3 2 3 4 1))]   

@interaction[#:eval (bsl) (mode (list "Janne" "Janne" "Jaana" "Satu" "Janne" "Satu"))]

@interaction[#:eval (bsl) (mode (list "Janne" "Janne" "Jaana" "Satu" "Satu"))]

@interaction[#:eval (bsl) (mode (list "Janne" "Jaana" "Satu"))]


