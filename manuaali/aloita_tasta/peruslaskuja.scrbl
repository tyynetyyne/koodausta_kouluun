#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
           scribble/html-properties)

@(require fin-doc/pr-math)
@setup-math

@title[#:tag "peruslaskuja"]{Peruslaskuja}
 
Ohjelmointi on helpointa aloittaa peruslaskuilla, ja samalla tutustumme ohjelmointiympäristön, DrRacketin, käyttöön.

@section{Yhteen-, vähennys-, kerto- ja jakolasku}

Kirjoita DrRacketin @bold{interaktioikkunaan} eli siihen ikkunaan, jossa on @litchar{>} prompti),
seuraava Racket-lauseke ja paina @italic{<enter>}.

@margin-note{Ínteraktioikkuna on DrRacket:issä joko alhaalla tai oikealla riippuen siitä käytetäänkö
 @italic{Vertical} vai @italic{Horizontal layout}:ia. Ikkunoiden asettelun voi muuttaa
 valikosta @italic{View->Use Horizontal layout}. Interaktioikkuna on WeScheme:ssä aina oikealla.}

@racketblock[(+ 1 2)]

Kokeile myös näitä:

@racketblock[(- 10 6)
             (* 3 4)
             (/ 20 5)
             (+ 1 2 3 4 5 6 7 8 9)]

Esimerkeistä voi huomata Racket-kielen perussäännöt: 
@itemlist[@item{kaikki Racket-funktiokutsut alkavat ja loppuvat sulkuihin}
          @item{ensimmäisen sulkumerkin jälkeen kerrotaan "mitä tehdään", eli kirjoitetaan kutsuttavan
           @bold{funktion} nimi, sen jälkeen annetaan funktion @bold{argumentit}}]

@section{Yhdistettyjä laskutoimituksia}

Jos halutaan yhdistellä laskutoimituksia, Racket-lausekkeet pitää asetella sisäkkäin. 

Tässä muutamia esimerkkejä:

@tabular[#:sep @hspace[1]
                          (list (list @${18-5+7}
                                 @racketblock[(+ (- 18 5) 7)])
                                (list @math-disp{\frac{12-3}{2+4}}
                                      @racketblock[(/ (- 12 3) (+ 2 4))]))]


