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

@title[#:tag "2htdp_image_kuvioiden_yhdistely" #:style 'toc]{Kuvioiden yhdistely}

@defproc[(overlay [i1 image?] [i2 image?] [is image?] ...) image?]{
  Overlays all of its arguments building a single image. The first argument goes
  on top of the second argument, which goes on top of the third argument, etc.
  The images are all lined up on their centers.

  @image-examples[(overlay (rectangle 30 60 "solid" "orange")
                           (ellipse 60 30 "solid" "purple"))
                  (overlay (ellipse 10 10 "solid" "red")
                           (ellipse 20 20 "solid" "black")
                           (ellipse 30 30 "solid" "red")
                           (ellipse 40 40 "solid" "black")
                           (ellipse 50 50 "solid" "red")
                           (ellipse 60 60 "solid" "black"))
                  (overlay (regular-polygon 20 5 "solid" (make-color  50  50 255))
                           (regular-polygon 26 5 "solid" (make-color 100 100 255))
                           (regular-polygon 32 5 "solid" (make-color 150 150 255))
                           (regular-polygon 38 5 "solid" (make-color 200 200 255))
                           (regular-polygon 44 5 "solid" (make-color 250 250 255)))]
  
  }

@defproc[(beside [i1 image?] [i2 image?] [is image?] ...) image?]{
  Constructs an image by placing all of the argument images in a
  horizontal row, aligned along their centers.

  @image-examples[(beside (ellipse 20 70 "solid" "gray")
                          (ellipse 20 50 "solid" "darkgray")
                          (ellipse 20 30 "solid" "dimgray")
                          (ellipse 20 10 "solid" "black"))]

  }

@defproc[(above [i1 image?] [i2 image?] [is image?] ...) image?]{
  Constructs an image by placing all of the argument images in a
  vertical row, aligned along their centers.

  @image-examples[(above (ellipse 70 20 "solid" "gray")
                         (ellipse 50 20 "solid" "darkgray")
                         (ellipse 30 20 "solid" "dimgray")
                         (ellipse 10 20 "solid" "black"))]

  }

@defproc[(overlay/xy [i1 image?] [x real?] [y real?] [i2 image?]) image?]{
  Constructs an image by overlaying @racket[i1] on top of @racket[i2].
  The images are initially lined up on their upper-left corners and 
  then @racket[i2] is shifted to the right 
  by @racket[x] pixels to and down by @racket[y] pixels.
  
  This is the same as @racket[(underlay/xy i2 (- x) (- y) i1)].

  See also @racket[overlay/offset] and @racket[underlay/offset].

  @image-examples[(overlay/xy (rectangle 20 20 "outline" "black")
                              20 0
                              (rectangle 20 20 "outline" "black"))
                  (overlay/xy (rectangle 20 20 "solid" "red")
                              10 10
                              (rectangle 20 20 "solid" "black"))
                  (overlay/xy (rectangle 20 20 "solid" "red")
                              -10 -10
                              (rectangle 20 20 "solid" "black"))
                  (overlay/xy 
                   (overlay/xy (ellipse 40 40 "outline" "black")
                               10
                               15
                               (ellipse 10 10 "solid" "forestgreen"))
                   20
                   15
                   (ellipse 10 10 "solid" "forestgreen"))]
}