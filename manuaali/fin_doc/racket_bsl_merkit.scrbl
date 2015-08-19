#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)

@title[#:tag "racket_bsl_merkit" #:style 'toc]{Merkit}

@declare-exporting[fin-doc/fi-beginner]

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

@defproc[(char? [x any/c]) boolean?]{
                                       Determines whether a value is a character.
                                       @interaction[#:eval (bsl) (char? "a") (char? #\a)]
                                       }
@defproc[(char=? [c char][d char][e char] ...) boolean?]{
                                                           Determines whether the characters are equal.
                                                           @interaction[#:eval (bsl) (char=? #\b #\a)]
                                                           }
