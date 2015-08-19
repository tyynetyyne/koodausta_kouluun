#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
           scribble/html-properties)
@(require scribble/racket)

@title[#:tag "piirtotyokaluja"]{Piirtotyökaluja}

Peruslaskutoimiukset sisältyvät Racket-kieleen. Kuvioiden piirtämiseen tarvitaan kuitenkin erillinen @bold{kirjasto}. 
Kirjoita DrRacketin ylempään ikkunaan seuraava koodirivi ja paina "run" niin saat kirjaston sisältämät funktiot käyttöösi.

@margin-note{Jos käytät WeScheme-sivustoa, voit hypätä suoraan kohtaan Peruskuviot.} 

@racketblock[(require 2htdp/image)]

@section{Peruskuviot}

@subsection[#:tag "ympyra"]{Ympyrä}

@margin-note{Voit palauttaa edellisen REPL-kutsun painamalla @italic{Ctrl + nuoli ylös}. 
Näin pääset kokeilemaan kätevästi parametrien vaikutusta.}  
             
Kirjoita seuraava rivi DrRacketin REPL:iin (alempi ikkuna) ja paina @italic{<enter>}. Kokeile muuttaa ympyrän kokoa ja väriä.

@racketblock[(circle 50 "solid" "red")]

@(circle 50 "solid" "red")

@subsection[#:tag "suorakulmio"]{Suorakulmio}

Suorakulmion piirtämiseen tarvitaan yksi parametri lisää. Kokeile vaihtaa "solid":in tilalle "outline".   

@racketblock[(rectangle 200 100 "solid" "blue")]

@(rectangle 200 100 "solid" "blue")

@subsection[#:tag "kolmio"]{Kolmio}

@margin-note{Löydät lisää piirtofunktioita täältä: @url{http://docs.racket-lang.org/teachpack/2htdpimage.html}}

@racketblock[(triangle 100 "solid" "yellow")]

@(triangle 100 "solid" "yellow")

@subsection[#:tag "tahti"]{Tähti}

@racketblock[(star 75 "solid" "green")]

@(star 75 "solid" "green")

@section[#:tag "nimeaminen"]{Nimeäminen}

REPL:ssä kokeilemasi kuviot eivät tallennu tiedostoon. Siksi koodi kannattaa kirjoittaa DrRacketin ylempään ikkunaan eli  
@italic{määrittelyikkunaan (definitions window)}. Määrittelyillä annetaan nimiä koodinpätkille, jotta niitä voidaan 
uudelleenkäyttää myöhemmin. Anna nyt piirtämillesi ympyrälle nimi "YMPYRÄ" kirjoittamalla seuraava koodi ylempään ikkunaan ja painamalal "run":

@racketblock[(define YMPYRÄ (circle 50 "solid" "red"))]

Tee sama suorakulmiolle:

@racketblock[(define SUORAKULMIO (rectangle 200 100 "solid" "blue"))]

Huomaa, että vaikka painat "run" REPL:iin ei ilmesty mitään. YMPYRÄ ja SUORAKULMIO ovat silti olemassa ja voit kutsua testata niitä
REPL:stä kirjoittamalla YMPYRÄ ja painamalla @italic{<enter>}.

@section[#:tag "kuvioiden_yhdistely"]{Kuvioiden yhdistely}

@subsection[#:tag "asettelu_paallekkain"]{Kuvien asettelu päällekkäin}
            
Voit yhdistää määrittelemäsi ympyrän ja suorakulmion samaan kuvaan kirjoittamalla seuraavan koodin DrRacket:in ylempään ikkunaan ja painamalla "run":
Huom! Ensimmäisenä annettu kuva tulee päällimmäiseksi.

@racketblock[(overlay YMPYRÄ SUORAKULMIO)]

@(define YMPYRÄ (circle 50 "solid" "red"))
@(define SUORAKULMIO (rectangle 200 100 "solid" "blue"))
 
@(overlay YMPYRÄ SUORAKULMIO)

@subsection[#:tag "asettelu_vapaasti"]{Kuvien asettelu vapaasti}

Overlay asettaa kuvat päällekkäin niiden keskipisteen kohdalta. Jos haluat siirtää kuvia toistensa suhteen, käytä overlay/xy komentoa, jonka avulla voi
määritellä kuinka monta pikseliä alempaa kuvaa siirretään x- ja y-akselien suunnassa:

@racketblock[(overlay/xy YMPYRÄ 0 0 SUORAKULMIO)]

@(overlay/xy YMPYRÄ 0 0 SUORAKULMIO)

Tässä esimerkissä suorakulmiota on siirretty 100 pikseliä vasemmalle (x-akselin suunnassa):

@racketblock[(overlay/xy YMPYRÄ 100 0 SUORAKULMIO)]

@(overlay/xy YMPYRÄ 100 0 SUORAKULMIO)

Tässä esimerkissä suorakulmiota on siirretty 100 pikeseliä alas (y-akselin suunnassa):

@racketblock[(overlay/xy YMPYRÄ 0 100 SUORAKULMIO)]

@(overlay/xy YMPYRÄ 0 100 SUORAKULMIO)

Kokeile mitä tapahtuu negatiivisilla luvuilla.