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

@title[#:tag "math_utils_muunnokset"]{Muunnokset}

@(begin
   (require scribble/manual scribble/eval fin-doc/sl-eval)
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require teachpacks/math-utils)
       (define a 5)))
     (set! bsl (lambda () *bsl))
     *bsl))

@defproc[(degrees->radians [x luku])
         luku]{                                                  
 Muuntaa annetut asteet @racket[x]:n radiaaneiksi.
 
 @interaction[#:eval (bsl) (degrees->radians 40)(degrees->radians 60)(degrees->radians 90)]   
}
@defproc[(radians->degrees [x luku])
         luku]{                                                  
 Muuntaa annetut radiaanit @racket[x]:n asteiksi.
 
 @interaction[#:eval (bsl) (radians->degrees pi)(radians->degrees (/ pi 2))
              (radians->degrees 0.78)]
 }