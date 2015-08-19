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

@title[#:tag "racket_bsl_merkkijonot" #:style 'toc]{Merkkijonot}

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

@defproc[(string-append [s merkkijono] ...) merkkijono]{
 Yhdistää useamman merkkijonon merkit yhdeksi merkkijonoksi. 
 @interaction[#:eval (bsl) (string-append "Hei" " " "mitä" " " "kuuluu?")]
}

@defproc[(string-length [s merkkijono]) luonnollinen-luku]{
 Palauttaa merkkijonon pituuden. 
 @interaction[#:eval (bsl) (string-length "Moro!")]
}

@defproc[(substring [s merkkijono][i luonnollinen-luku][j luonnollinen-luku]) merkkijono]{
 Irrottaa merkkijonosta @racket[s] lyhyemmän merkkijonon, joka alkaa @racket[i]:stä ja loppuu @racket[j]:hin (tai merkkijonon loppuun asti, jos
 @racket[j]:tä ei anneta). 
 @interaction[#:eval (bsl) (substring "Mitä kuuluu?" 1 5) (substring "Mitä kuuluu?" 4)]}

@defproc[(string=? [s merkkijono][t merkkijono][x merkkijono] ...) boolean?]{
 Tutkii, ovatko merkkijonot samat (merkki merkiltä).
 @interaction[#:eval (bsl) (string=? "hei" "hou") (string=? "Moro" "Moro")]
}

@defproc[(string->number [s merkkijono]) (luku TAI #false)]{
Muuntaa merkkijonon luvuksi, palauttaa @racket[#false] jos se on mahdotonta.
 @interaction[#:eval (bsl) (string->number "-2.03") (string->number "kissa")]
} 

@defproc[(string? [x ei-tyyppivaatimusta]) boolean?]{
 Tutkii, onko @racket[x] tyyppiä merkkijono. 
 @interaction[#:eval (bsl) (string? "No, onko se?") (string? 42)]
}

