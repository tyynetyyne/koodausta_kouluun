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

@title[#:tag "math_utils_funktiot"]{math-utils -funktiot}

@(begin
   (require scribble/manual scribble/eval fin-doc/sl-eval)
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require teachpacks/math-utils)
       (define a 5)))
     (set! bsl (lambda () *bsl))
     *bsl))

@defproc[(units->image [yksikkö merkkijono]
                       [eksponentti kokonaisluku]
                       [fontin-koko kokonaisluku-välillä-0-255]
                       [väri image-color?])
         kuva]{                                                  
 Tuottaa kuvan, jossa yksikkö ja sen eksponentti esitetään @racket[fontin-koko]:isina sekä @racket[väri]:sinä.}

@racketblock[(units->image "mm" 3 33 "red")]

@centered[@image["math-utils/mm3.png"]]

@defproc[(display-with-units [suure merkkijono]
                             [fontin-koko kokonaisluku-välillä-0-255]
                             [väri image-color?])
         kuva]{                                                  
 Tuottaa kuvan, jossa @racket[suure]:een lukuarvo ja yksikkö esitetään @racket[fontin-koko]:isina sekä @racket[väri]:sinä.
 Suure annetaan merkkijonona, jossa suureen lukuarvo erotetaan välilyönnillä yksiköstä esim. 2 kuutiosenttimetriä ilmoitetaan "2 cm3".}

@racketblock[(display-with-units "350 cm3" 30 "black")]

@centered[@image["math-utils/suure1.png"]]

@racketblock[(display-with-units "4.5 m2" 45 "red")]

@centered[@image["math-utils/suure2.png"]]

@defproc[(round-to-integer [x luku])
         kokonaisluku]{                                                  
 Pyöristää @racket[x]:n lähimpään kokonaislukuun niin, että puoliväliin jäävät positiiviset luvut (esim. 0.5) pyöristetään suurempaan
 kokonaislukuun ja puoliväliin jäävät negatiiviset luvut (esim. -0.5) pyöristetään pienempään kokonaislukuun.}

 @interaction[#:eval (bsl) (round-to-integer 4.3)(round-to-integer 5.5)(round-to-integer -3.4)(round-to-integer -3.5)]   

@defproc[(round-to-decimal [x luku]
                           [desimaalit luonnollinen-luku])
         luku]{                                                  
 Pyöristää @racket[x]:n annetut @racket[desimaalit] tarkkuuteen. Käyttää pyöristämiseen @racket[round-to-integer]:iä.}

 @interaction[#:eval (bsl) (round-to-decimal 4.344 2)(round-to-decimal 5.57 1)(round-to-decimal -3.45 1)(round-to-decimal -3.55 1)]   
