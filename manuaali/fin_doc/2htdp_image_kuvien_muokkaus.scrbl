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

@title[#:tag "2htdp_image_kuvioiden_muokkaus" #:style 'toc]{Kuvioiden muokkaus}

@defproc[(rotate [angle angle?] [image image?]) image?]{
  Rotates @racket[image] by @racket[angle] degrees in a counter-clockwise direction.
          
          @image-examples[(rotate 45 (ellipse 60 20 "solid" "olivedrab"))
                          (rotate 5 (rectangle 50 50 "outline" "black"))
                          (rotate 45
                                  (beside/align
                                   "center"
                                   (rectangle 40 20 "solid" "darkseagreen")
                                   (rectangle 20 100 "solid" "darkseagreen")))]
          
          See also @seclink["rotate-center"].
          
}

@defproc[(scale [factor (and/c real? positive?)] [image image?]) image?]{

  Scales @racket[image] by @racket[factor].
  
  The pen sizes are also scaled and thus draw thicker (or thinner)
  lines than the original image, unless the pen was size 
  @racket[0]. That pen size is treated specially to mean ``the
  smallest available line'' and thus it always draws a one-pixel
  wide line; this is also the case for @racket['outline] and @racket["outline"]
  shapes that are drawn with an @racket[image-color?] instead of
  a @racket[pen].
  
         
  @image-examples[(scale 2 (ellipse 20 30 "solid" "blue"))
                   (ellipse 40 60 "solid" "blue")]
  
  
  
}

@defproc[(flip-horizontal [image image?]) image?]{
   Flips @racket[image] left to right.
         
         Flipping images with text is not supported (so passing @racket[flip-horizontal] an image
         that contains a @racket[text] or @racket[text/font] image inside somewhere signals an error).
         
         @image-examples[(beside
                          (rotate 30 (square 50 "solid" "red"))
                          (flip-horizontal
                           (rotate 30 (square 50 "solid" "blue"))))]
}

@defproc[(flip-vertical [image image?]) image?]{
   Flips @racket[image] top to bottom.
         
         Flipping images with text is not supported (so passing @racket[flip-vertical] an image
         that contains a @racket[text] or @racket[text/font] image inside somewhere signals an error).

         @image-examples[(above 
                          (star 40 "solid" "firebrick")
                          (scale/xy 1 1/2 (flip-vertical (star 40 "solid" "gray"))))]
}

@defproc[(crop [x real?]
               [y real?] 
               [width (and/c real? (not/c negative?))]
               [height (and/c real? (not/c negative?))]
               [image image?])
         image?]{

 Crops @racket[image] to the rectangle with the upper left at the point (@racket[x],@racket[y])
 and with @racket[width] and @racket[height]. 
 
 @image-examples[(crop 0 0 40 40 (circle 40 "solid" "chocolate"))
                 (crop 40 60 40 60 (ellipse 80 120 "solid" "dodgerblue"))
                 (above
                  (beside (crop 40 40 40 40 (circle 40 "solid" "palevioletred"))
                          (crop 0 40 40 40 (circle 40 "solid" "lightcoral")))
                  (beside (crop 40 0 40 40 (circle 40 "solid" "lightcoral"))
                          (crop 0 0 40 40 (circle 40 "solid" "palevioletred"))))]
                 
}
