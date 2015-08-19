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

@title[#:tag "varit" #:style 'toc]{Värit}

@defproc[(image-color? [x any/c]) boolean?]{

  Determines if @racket[x] represents a color. Strings, symbols,
  and @racket[color] structs are allowed as colors.

  For example,
  @racket["magenta"], @racket["black"], @racket['orange], and @racket['purple]
  are allowed. Colors are not case-sensitive, so 
  @racket["Magenta"], @racket["Black"], @racket['Orange], and @racket['Purple]
  are also allowed, and are the same colors as in the previous sentence.
  If a string or symbol color name is not recognized, black is used in its place.
  
  The complete list of colors is the same as the colors allowed in
  @racket[color-database<%>], plus the color @racket["transparent"], a transparent
  color.

}

@defstruct[color ([red (and/c natural-number/c (<=/c 255))]
                  [green (and/c natural-number/c (<=/c 255))]
                  [blue (and/c natural-number/c (<=/c 255))]
                  [alpha (and/c natural-number/c (<=/c 255))])]{
  The @racket[color] struct defines a color with @racket[red], 
      @racket[green], @racket[blue], and @racket[alpha] components
      that range from @racket[0] to @racket[255]. 
      
    The @racket[red], @racket[green], and @racket[blue] fields
      combine to make a color, with the higher values meaning more of the given color. 
      For example, @racket[(make-color 255 0 0)] makes a
      bright red color and @racket[(make-color 255 0 255)] makes a bright purple.
    
      The @racket[alpha] field controls the transparency of the color. A value of @racket[255] means
      that the color is opaque and @racket[0] means the color is fully transparent.
      
  The constructor, @racket[make-color], also accepts only three arguments, in which case
  the three arguments are used for the @racket[red], @racket[green], and @racket[blue] fields, and the
  @racket[alpha] field defaults to @racket[255].
}