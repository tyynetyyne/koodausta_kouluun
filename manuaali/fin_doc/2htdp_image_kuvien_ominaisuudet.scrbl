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

@title[#:tag "2htdp_image_kuvan_ominaisuudet" #:style 'toc]{Kuvan ominaisuudet}

@defproc[(image-width [i image?]) (and/c integer? (not/c negative?) exact?)]{
  Returns the width of @racket[i].

  @image-examples[(image-width (ellipse 30 40 "solid" "orange"))
                  (image-width (circle 30 "solid" "orange"))
                  (image-width (beside (circle 20 "solid" "orange")
                                       (circle 20 "solid" "purple")))
                  (image-width (rectangle 0 10 "solid" "purple"))]
}

@defproc[(image-height [i image?]) (and/c integer? (not/c negative?) exact?)]{
  Returns the height of @racket[i].
  
  @image-examples[(image-height (ellipse 30 40 "solid" "orange"))
                  (image-height (circle 30 "solid" "orange"))
                  (image-height (overlay (circle 20 "solid" "orange")
                                         (circle 30 "solid" "purple")))
                  (image-height (rectangle 10 0 "solid" "purple"))]
  }

@defproc[(mode? [x any/c]) boolean?]{
 Determines if @racket[x] is a mode suitable for
 constructing images. 
 
 It can be one of
 @racket['solid], @racket["solid"], @racket['outline],
 or @racket["outline"], indicating if the shape is
 filled in or not.
 
 It can also be an integer between @racket[0] and @racket[255] (inclusive)
 indicating the transparency of the image. The integer @racket[255] is
 fully opaque, and is the same as @racket["solid"] (or @racket['solid]).
 The integer @racket[0] means fully transparent.
}