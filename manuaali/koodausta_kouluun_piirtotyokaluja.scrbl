#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label racket))
@(require scribble/core
           scribble/html-properties)
@(require scribble/racket)
           
@title{Piirtotyökaluja}

Peruslaskutoimiukset sisältyvät Racket-kieleen. Kuvioiden piirtämiseen tarvitaan kuitenkin erillinen @bold{kirjasto}. 
Kirjoita DrRacketin ylempään ikkunaan seuraava koodirivi ja paina "run" niin saat kirjaston sisältämät funktiot käyttöösi.

@margin-note{Jos käytät WeScheme-sivustoa, voit hypätä suoraan kohtaan Peruskuviot.} 

@racketblock[(require 2htdp/image)]

@section{Peruskuviot}

@subsection{Ympyrä}

@margin-note{Voit palauttaa edellisen REPL-kutsun painamalla @italic{Ctrl + nuoli ylös}. 
Näin pääset kokeilemaan kätevästi parametrien vaikutusta.}  
             
Kirjoita seuraava rivi DrRacketin REPL:iin (alempi ikkuna) ja paina @italic{<enter>}. Kokeile muuttaa ympyrän kokoa ja väriä.

@racketblock[(circle 50 "solid" "red")]

@(circle 50 "solid" "red")

@subsection{Suorakulmio}

Suorakulmion piirtämiseen tarvitaan yksi parametri lisää. Kokeile vaihtaa "solid":in tilalle "outline".   

@racketblock[(rectangle 200 100 "solid" "blue")]

@(rectangle 200 100 "solid" "blue")

@subsection{Kolmio}

@margin-note{Löydät lisää piirtofunktioita täältä: @url{http://docs.racket-lang.org/teachpack/2htdpimage.html}}

@racketblock[(triangle 100 "solid" "yellow")]

@(triangle 100 "solid" "yellow")

@subsection{Tähti}

@racketblock[(star 75 "solid" "green")]

@(star 75 "solid" "green")

@section{Nimeäminen}

REPL:ssä kokeilemasi kuviot eivät tallennu tiedostoon. Siksi koodi kannattaa kirjoittaa DrRacketin ylempään ikkunaan eli  
@italic{määrittelyikkunaan (definitions window)}. Määrittelyillä annetaan nimiä koodinpätkille, jotta niitä voidaan 
uudelleenkäyttää myöhemmin. Anna nyt piirtämillesi ympyrälle nimi "YMPYRÄ" kirjoittamalla seuraava koodi ylempään ikkunaan ja painamalal "run":

@racketblock[(define YMPYRÄ (circle 50 "solid" "red"))]

Tee sama suorakulmiolle:

@racketblock[(define SUORAKULMIO (rectangle 200 100 "solid" "blue"))]

Huomaa, että vaikka painat "run" REPL:iin ei ilmesty mitään. YMPYRÄ ja SUORAKULMIO ovat silti olemassa ja voit kutsua testata niitä
REPL:stä kirjoittamalla YMPYRÄ ja painamalla @italic{<enter>}.

@section{Kuvioiden yhdistely}

@(make-element
   (make-style #f
               (list 
                (make-alt-tag "iframe")
                (make-attributes
                 `((title  . "YouTube video player")
                   (class . "youtube-player")
                   (type . "text/html")
                   (width . "560")
                   (height . "315")
                   (src . "//www.youtube.com/embed/D417pOJ6UOA?rel=0")
                   (frameborder . "0")))))
   null)
