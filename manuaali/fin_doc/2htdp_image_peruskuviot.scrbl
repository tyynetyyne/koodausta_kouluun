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

@title[#:tag "peruskuviot" #:style 'toc]{Peruskuviot}

@section[#:style 'unnumbered #:tag "nelikulmiot"]{Nelikulmiot}

@defproc*[([(square [side-len (and/c real? (not/c negative?))]
                    [mode mode?]
                    [color image-color?])
            image?]
           [(square [side-len (and/c real? (not/c negative?))]
                    [outline-mode (or/c 'outline "outline")]
                    [pen-or-color (or/c pen? image-color?)])
            image?])]{

 Constructs a square.

 
 @image-examples[(square 40 "solid" "slateblue")
                 (square 50 "outline" "darkmagenta")]

}

@defproc*[([(rectangle [width (and/c real? (not/c negative?))]
                       [height (and/c real? (not/c negative?))]
                       [mode mode?]
                       [color image-color?])
            image?]
           [(rectangle [width (and/c real? (not/c negative?))]
                       [height (and/c real? (not/c negative?))]
                       [outline-mode (or/c 'outline "outline")] 
                       [pen-or-color (or/c pen? image-color?)])
            image?])]{
  Constructs a rectangle with the given width, height, mode, and color.
  
  @image-examples[(rectangle 40 20 "outline" "black")
                  (rectangle 20 40 "solid" "blue")]
}

@defproc*[([(rhombus [side-length (and/c real? (not/c negative?))]
                     [angle angle?]
                     [mode mode?]
                     [color image-color?])
            image?]
           [(rhombus [side-length (and/c real? (not/c negative?))]
                     [angle angle?]
                     [outline-mode (or/c 'outline "outline")]
                     [pen-or-color (or/c pen? image-color?)])
            image?])]{
                 
Constructs a four sided polygon with all equal sides and thus where opposite angles are equal to each
other. The top and bottom pair of angles is @racket[angle]
and the left and right are @racket[(- 180 angle)].

@image-examples[(rhombus 40 45 "solid" "magenta")
                (rhombus 80 150 "solid" "mediumpurple")]
}

@section[#:style 'unnumbered #:tag "kolmiot"]{Kolmiot}

@defproc*[([(triangle [side-length (and/c real? (not/c negative?))] 
                      [mode mode?]
                      [color image-color?])
            image?]
           [(triangle [side-length (and/c real? (not/c negative?))] 
                      [outline-mode (or/c 'outline "outline")]
                      [pen-or-color (or/c pen? image-color?)])
            image?])]{

   Constructs a upward-pointing equilateral triangle. 
  The @racket[side-length] argument 
  determines the 
  length of the side of the triangle.
  
    @image-examples[(triangle 40 "solid" "tan")]

}

@defproc*[([(right-triangle [side-length1 (and/c real? (not/c negative?))]
                            [side-length2 (and/c real? (not/c negative?))]
                            [mode mode?]
                            [color image-color?])
            image?]
           [(right-triangle [side-length1 (and/c real? (not/c negative?))]
                            [side-length2 (and/c real? (not/c negative?))]
                            [outline-mode (or/c 'outline "outline")]
                            [pen-or-color (or/c pen? image-color?)])
            image?])]{
                 
  Constructs a triangle with a right angle where the two sides adjacent
  to the right angle have lengths @racket[side-length1] and @racket[side-length2].
  
  @image-examples[(right-triangle 36 48 "solid" "black")]
}

@defproc*[([(isosceles-triangle [side-length (and/c real? (not/c negative?))] 
                                [angle angle?]
                                [mode mode?]
                                [color image-color?])
            image?]
           [(isosceles-triangle [side-length (and/c real? (not/c negative?))] 
                                [angle angle?]
                                [outline-mode (or/c 'outline "outline")]
                                [pen-or-color (or/c pen? image-color?)])
            image?])]{

 Creates a triangle with two equal-length sides, of length @racket[side-length]
 where the angle between those sides is @racket[angle]. The third
 leg is straight, horizontally. If the angle is less than 
 @racket[180], then the triangle will point up and if the @racket[angle]
 is more, then the triangle will point down. 
 
 @image-examples[(isosceles-triangle 200 170 "solid" "seagreen")
                 (isosceles-triangle 60 30 "solid" "aquamarine")
                 (isosceles-triangle 60 330 "solid" "lightseagreen")]
}


@section[#:style 'unnumbered #:tag "monikulmiot"]{Monikulmiot}

@defproc*[([(regular-polygon [side-length (and/c real? (not/c negative?))] 
                             [side-count side-count?]
                             [mode mode?]
                             [color image-color?])
            image?]
           [(regular-polygon [side-length (and/c real? (not/c negative?))] 
                             [side-count side-count?]
                             [outline-mode (or/c 'outline "outline")]
                             [pen-or-color (or/c pen? image-color?)])
            image?])]{
  Constructs a regular polygon with @racket[side-count] sides.

  @image-examples[(regular-polygon 50 3 "outline" "red")
                  (regular-polygon 40 4 "outline" "blue")
                  (regular-polygon 20 8 "solid" "red")]
}


@defproc*[([(star [side-length (and/c real? (not/c negative?))] 
                  [mode mode?]
                  [color image-color?])
            image?]
           [(star [side-length (and/c real? (not/c negative?))] 
                  [outline-mode (or/c 'outline "outline")]
                  [color (or/c pen? image-color?)])
            image?])]{
  Constructs a star with five points. The @racket[side-length] argument 
  determines the side length of the enclosing pentagon.

  @image-examples[(star 40 "solid" "gray")]
  
}

@defproc*[([(radial-star [point-count (and/c integer? (>=/c 2))]
                         [inner-radius (and/c real? (not/c negative?))]
                         [outer-radius (and/c real? (not/c negative?))]
                         [mode mode?]
                         [color image-color?])
            image?]
           [(radial-star [point-count (and/c integer? (>=/c 2))]
                         [inner-radius (and/c real? (not/c negative?))]
                         [outer-radius (and/c real? (not/c negative?))]
                         [outline-mode (or/c 'outline "outline")]
                         [pen-or-color (or/c pen? image-color?)])
            image?])]{

Constructs a star-like polygon where the star is specified by two radii and a number of points. 
The first radius determines where the points begin, the second determines where they end, and
the @racket[point-count] argument determines how many points the star has.

@image-examples[(radial-star 8 8 64 "solid" "darkslategray")
                (radial-star 32 30 40 "outline" "black")]

}

@section[#:style 'unnumbered #:tag "ympyrat_ja_ellipsit"]{Ympyrät ja ellipsit}

@defproc*[([(circle [radius (and/c real? (not/c negative?))]
                    [mode mode?]
                    [color image-color?])
            image?]
           [(circle [radius (and/c real? (not/c negative?))]
                    [outline-mode (or/c 'outline "outline")]
                    [pen-or-color (or/c pen? image-color?)])
            image?])]{
  Constructs a circle with the given radius, mode, and color.
  
   @image-examples[(circle 30 "outline" "red")
                   (circle 20 "solid" "blue")
                   (circle 20 100 "blue")]

}

@defproc*[([(ellipse [width (and/c real? (not/c negative?))]
                     [height (and/c real? (not/c negative?))]
                     [mode mode?] 
                     [color image-color?])
            image?]
           [(ellipse [width (and/c real? (not/c negative?))]
                     [height (and/c real? (not/c negative?))]
                     [mode (or/c 'outline "outline")] 
                     [pen-or-color (or/c image-color? pen?)])
            image?])]{
  Constructs an ellipse with the given width, height, mode, and color.
  
  @image-examples[(ellipse 60 30 "outline" "black")
                  (ellipse 30 60 "solid" "blue")
                  (ellipse 30 60 100 "blue")] 
}

@section[#:style 'unnumbered #:tag "muut"]{Muut kuviot}

@defproc[(add-line [image image?]
                   [x1 real?] [y1 real?]
                   [x2 real?] [y2 real?]
                   [pen-or-color (or/c pen? image-color?)])
         image?]{

Adds a line to the image @racket[image], starting from the point (@racket[x1],@racket[y1])
  and going to the point (@racket[x2],@racket[y2]).
  Unlike @racket[scene+line], if the line passes outside of @racket[image], the image
  gets larger to accommodate the line.
  
  @image-examples[(add-line (ellipse 40 40 "outline" "maroon")
                            0 40 40 0 "maroon")
                  (add-line (rectangle 40 40 "solid" "gray")
                            -10 50 50 -10 "maroon")
                 (add-line
                   (rectangle 100 100 "solid" "darkolivegreen")
                   25 25 75 75 
                   (make-pen "goldenrod" 30 "solid" "round" "round"))]
}

@defproc[(text [string string?] [font-size (and/c integer? (<=/c 1 255))] [color image-color?])
         image?]{
                
  Constructs an image that draws the given string, using the font size and color.
                 
  @image-examples[(text "Hello" 24 "olive")
                  (text "Goodbye" 36 "indigo")]
  
  The text size is measured in pixels, not points, so passing @racket[24]
  to @racket[text] should result in an image whose height is @racket[24]
  (which might not be the case if the size were measured in points).
  @image-examples[(image-height (text "Hello" 24 "olive"))]
  
}

@defthing[empty-image image?]{
  The empty image. Its width and height are both zero and it does not draw at all.
  
  @image-examples[(image-width empty-image)
                  (equal? (above empty-image
                                 (rectangle 10 10 "solid" "red"))
                          (beside empty-image
                                  (rectangle 10 10 "solid" "red")))]
  
  
  Combining an image with @racket[empty-image] produces the
  original image (as shown in the above example).  
}

@section[#:style 'unnumbered #:tag "lisätietoa"]{Lisätietoa}

     Note that when the @racket[mode] is @racket['outline] or @racket["outline"], the shape
     may draw outside of its bounding box and thus parts of the image may disappear
     when it is cropped. See @secref["nitty-gritty"] (in the @seclink["image-guide"])
     for a more careful explanation of the ramifications of this fact.

     If the @racket[_mode] argument is @racket['outline] or @racket["outline"], then the last
     argument can be a @racket[pen] struct or an @racket[image-color?], but if the @racket[_mode]
     is @racket['solid] or @racket["solid"], then the last argument must be an
     @racket[image-color?].}))

     Some shapes (notably those with @racket['outline] or @racket["outline"] as
          the @racket[_mode] argument) draw outside of their bounding boxes and thus
          cropping them may remove part of them (often the lower-left and lower-right
          edges). See @secref["nitty-gritty"] (in the @seclink["image-guide"])
          for a more careful discussion of this issue.




