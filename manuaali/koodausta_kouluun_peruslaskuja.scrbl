#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label lang/htdp-beginner))
@(require (for-label (except-in 2htdp/image image?)))
@(require scribble/core
           scribble/html-properties)

@(require "pr-math.rkt")
@setup-math

@title[#:tag "peruslaskuja"]{Peruslaskuja}
 
Ohjelmointi on helpointa aloittaa peruslaskuilla, ja samalla tutustumme ohjelmointiympäristön, DrRacketin, käyttöön.

@section{Yhteen-, vähennys-, kerto- ja jakolasku}

DrRacketissä on kaksi ikkunaa, kirjoita alempaan ikkunaan eli REPL:iin seurava Racket-lauseke ja paina @italic{<enter>}. 

@racketblock[(+ 1 2)]

Kokeile myös näitä:

@racketblock[(- 10 6)
             (* 3 4)
             (/ 20 5)
             (+ 1 2 3 4 5 6 7 8 9)]

Esimerkeistä voi huomata kaksi Racket-kielen perussääntöä: 
@itemlist[@item{kaikki Racket-lausekkeet alkavat ja loppuvat sulkuihin}
          @item{ensimmäisen sulkumerkin jälkeen kerrotaan "mitä tehdään", eli kirjoitetaan kutsuttavan @bold{funktion} nimi, 
                sen jälkeen annetaan funktion @bold{parametrit}}]

@section{Yhdistettyjä laskutoimituksia}

Jos halutaan yhdistellä laskutoimituksia, Racket-lausekkeet pitää asetella sisäkkäin. 

Tässä muutamia esimerkkejä:

@tabular[#:sep @hspace[1]
                          (list (list @${18-5+7}
                                 @racketblock[(+ (- 18 5) 7)])
                                (list @math-disp{\frac{12-3}{2+4}}
                                      @racketblock[(/ (- 12 3) (+ 2 4))]))]

