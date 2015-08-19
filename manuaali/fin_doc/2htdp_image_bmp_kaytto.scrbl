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

@title[#:tag "bitmapit" #:style 'toc]{Bitmapit}

@defproc[(bitmap/url [url string?]) image?]{
  Goes out on the web and downloads the image at @racket[url].

  Downloading the image happens each time this function is called, so
  you may find it simpler to download the image once with a browser 
  and then paste it into your program or download it and use @racket[bitmap].
}

@defproc[(bitmap/file [ps path-string?]) image?]{
  Loads the image from @racket[ps].

  If @racket[ps] is a relative path, the file is relative to
  the current directory. (When running in DrRacket, the current
  directory is set to the place where the definitions window is
  saved, but in general this can be an arbitrary directory.)
}