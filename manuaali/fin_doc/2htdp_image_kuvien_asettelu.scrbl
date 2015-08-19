;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)

@(require teachpack/2htdp/scribblings/img-eval
          scribble/decode)
@(define img-eval (make-img-eval))

@(define-syntax-rule 
   (image-examples exp ...)
   (examples #:eval img-eval exp ...))

@(define-syntax-rule 
   (image-interaction exp ...)
   (interaction #:eval img-eval exp ...))

@(define-syntax-rule
   (image-interaction/margin num exp)
   (begin
     (racketinput exp)
     (img-eval '(extra-margin num))
     (interaction-eval-show #:eval img-eval exp)
     (img-eval '(extra-margin 0))))
     
@declare-exporting[fin-doc/fi-image]

@declare-exporting[fin-doc/fi-image]

@title[#:tag "2htdp_image_kuvioiden_asettelu_ruudulle" #:style 'toc]{Kuvioiden asettelu ruudulle}

Placing images into scenes is particularly useful when building worlds
and universes using @racket[2htdp/universe].

@defproc*[([(empty-scene [width (and/c real? (not/c negative?))]
                         [height (and/c real? (not/c negative?))])
            image?]
            [(empty-scene [width (and/c real? (not/c negative?))]
                          [height (and/c real? (not/c negative?))]
                          [color image-color?])
            image?])]{

Creates an empty scene, i.e., a white rectangle with a black outline.

@image-examples[(empty-scene 160 90)]

The three-argument version creates a rectangle of the specified color with
a black outline. 
}

@defproc[(place-image [image image?] [x real?] [y real?] [scene image?]) image?]{

 Places @racket[image] onto @racket[scene] with its center at the coordinates 
 (@racket[x],@racket[y]) and crops the resulting image so that it has the 
 same size as @racket[scene]. The coordinates are relative to the top-left
 of @racket[scene].
 
 @image-examples[(place-image 
                  (triangle 32 "solid" "red")
                  24 24
                  (rectangle 48 48 "solid" "gray"))
                 
                 (place-image 
                  (triangle 64 "solid" "red")
                  24 24
                  (rectangle 48 48 "solid" "gray"))
                 
                 (place-image
                  (circle 4 "solid" "white")
                  18 20
                  (place-image
                   (circle 4 "solid" "white")
                   0 6
                   (place-image
                    (circle 4 "solid" "white")
                    14 2
                    (place-image
                     (circle 4 "solid" "white")
                     8 14
                     (rectangle 24 24 "solid" "goldenrod")))))]
}