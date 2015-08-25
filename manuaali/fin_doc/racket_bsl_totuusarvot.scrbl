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

@title[#:tag "racket_bsl_totuusarvot" #:style 'toc]{Totuusarvot}

@(begin
   (require scribble/manual scribble/eval "sl-eval.rkt")
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require 2htdp/image)
        (define c1 (circle 10 "solid" "green"))
        
        (define zero 0)
        
        (define one (list 1))
        
        (define q (make-posn 15 8))
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

  @defproc[(boolean? [x ei-tyyppivaatimusta]) totuusarvo]{
                                          Tutkii, onko @racket[x] tyyppiä totuusarvo (@racket[#true] tai @racket[#false])
                                          @interaction[#:eval (bsl) (boolean? 42) (boolean? #false)]
                                          }
  @defproc[(boolean=? [x totuusarvo][y totuusarvo]) totuusarvo]{
                                                          Tutkii ovatko kaksi totuusarvoa samat.
                                                          @interaction[#:eval (bsl) (boolean=? #true #false)
                                                                       (boolean=? #false #false)]
                                                          }
  @defproc[(false? [x ei-tyyppivaatimusta]) totuusarvo]{
                                        Tutkii onko @racket[x] tyyppiä totuusarvo ja sen arvo @racket[#false].
                                        @interaction[#:eval (bsl) (false? #false)]
                                        }
  @defproc[(not [x totuusarvo]) totuusarvo]{
                                                       Kääntää totuusarvon päinvastaiseksi.
                                                       @interaction[#:eval (bsl) (not #false)]
                                                       }

@defthing[true totuusarvo]{
 Vaihtoehtoinen tapa ilmaista @racket[#true] ja @racket[#t].
 WeScheme palauttaa totuusarvot aina tässä muodossa (ilman @litchar{#} merkkiä).}

 @interaction[#:eval (bsl) true]

 @defthing[false totuusarvo]{
 Vaihtoehtoinen tapa ilmaista @racket[#false] ja @racket[#f].
 WeScheme palauttaa totuusarvot aina tässä muodossa (ilman @litchar{#} merkkiä).}

 @interaction[#:eval (bsl) false]

