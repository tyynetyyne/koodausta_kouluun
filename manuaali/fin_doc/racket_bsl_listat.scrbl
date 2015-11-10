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

@title[#:tag "racket_bsl_listat" #:style 'toc]{Listat}

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
        (define x (list 2 "hei" #true))
        (define z (list 2 "hei" #true "hei"))))
     (set! bsl (lambda () *bsl))
     *bsl))

@defproc[(list [x ei-tyyppivaatimusta] ... ) cons?]{
 Luo listan, joka sisältää sille annetut argumentit. Lista muodostuu ns. @list{cons}-soluista, joissa on aina vasen ja oikea
 alkio. Listan viimeisen cons-solun oikean puoleinen alkio on aina @racket['()].
 @interaction[#:eval (bsl-eval) (list 1 2 3)]
}

@defproc[(cons [x ei-tyyppivaatimusta][y cons?]) cons?]{
 Yhdistää @racket[x]:n listaan @racket[y], joka voi olla myös tyhjä lista @racket[empty] eli @racket['()].
 @interaction[#:eval (bsl-eval) (cons 1 (list 2 3)) (cons "a" empty)]
}

@defproc[(append [x cons?][y cons?][z cons?]  ...) cons?]{
 Yhdistää monta listaa yhdeksi listaksi.  
 @interaction[#:eval (bsl) (append (list 1 2) (list 3 4))]
}

@defproc[(first [x cons?]) ei-tyyppivaatimusta]{
 Palauttaa ei-tyhjän listan ensimmäisen alkion.
 @interaction[#:eval (bsl) x (first x)]
}
@defproc[(rest [x cons?]) ei-tyyppivaatimusta]{
 Poistaa ei-tyhjän listan ensimmäisen alkion ja palauttaa jäljelle jäävän listan.
 @interaction[#:eval (bsl) x (rest x)]
}

@defproc[(length (l cons?)) luonnollinen-luku]{
 Palauttaa listan alkioiden määrän.
 @interaction[#:eval (bsl) x (length x)]
}

@defproc[(list-ref [x cons?][i luonnollinen-luku]) ei-tyyppivaatimusta]{
 Palauttaa @racket[i]:n osoittaman alkion listasta @racket[x]. Listan indeksointi alkaa nollasta.
 @interaction[#:eval (bsl) v (list-ref v 9)(list-ref v 0)]
}

@defproc[(member? [x ei-tyyppivaatimusta][l cons?]) totuusarvo]{
 Tutkii, onko @racket[x] mukana listassa (vertailu tehdään käyttämällä @racket[equal?]).
 @interaction[#:eval (bsl) x (member? "hei" x)]
}

@defproc[(remove [x ei-tyyppivaatimusta][l cons?]) cons?]{
 Palauttaa listan, josta on poistettu ensimmäinen arvo, joka vastaa @racket[x]:ää (vertailussa käytetään @racket[equal?]).
 @interaction[#:eval (bsl) x (remove "hei" x) z (remove "hei" z)]
}

 @defproc[(range [alku luku][loppu luku][askel luku]) cons?]{
 Luo listan lukuja välillä @racket[alku] - @racket[loppu] niin, että askeleena käytetään @racket[askel]. 
 @interaction[#:eval (bsl-eval) (range 0 10 2)
              (range 10 0 -2)]
                                                                                                                   }

@defproc[(cons? [x ei-tyyppivaatimusta]) totuusarvo]{
 Tutkii, onko @racket[x] rakenteeltaan lista tai puu, eli koostuuko se ns. @italic{cons}-soluista, joissa on aina vasen ja oikea
 alkio. 
 @interaction[#:eval (bsl-eval) (cons? (cons 1 '())) (cons? 42)]
}

@defproc[(empty? [x ei-tyyppivaatimusta]) totuusarvo]{
 Tutkii, onko @racket[x] tyhjä lista @racket['()].
 @interaction[#:eval (bsl) (empty? empty) (empty? '()) (empty? (cons 2 '())) (empty? 42)]
}

 @defthing[empty cons?]{
 Vaihtoehtoinen tapa ilmaista @racket['()] eli tyhjä lista.}

 @interaction[#:eval (bsl) empty]
