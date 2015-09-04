#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
           scribble/html-properties)
@(require scribble/racket)

@title[#:tag "piirtotyokaluja"]{Piirtotyökaluja}

Peruslaskutoimitukset sisältyvät Racket-kieleen. Kuvioiden piirtämiseen tarvitaan kuitenkin erillinen @bold{kirjasto}. 
Kirjoita DrRacketin @bold{määrittelyikkunaan} seuraava koodirivi ja paina "run" niin saat kirjaston
sisältämät funktiot käyttöösi.

@margin-note{Määrittelyikkuna on DrRacket:issä joko ylhäällä tai vasemmalla riippuen siitä käytetäänkö
 @italic{Vertical} vai @italic{Horizontal layout}:ia. Ikkunoiden asettelun voi muuttaa
 valikosta @italic{View->Use Horizontal layout}. Määrittelyikkuna on WeScheme:ssä aina vasemmalla.}

@racketblock[(require 2htdp/image)]

@italic{Huom!}
Jos käytät WeScheme-sivustoa jätä tämä rivi pois koodistasi (kuvien piirtofunktiot on sisäänrakennettuna
WeScheme:een).

@section{Peruskuviot} 

@subsection[#:tag "ympyra"]{Ympyrä}
             
Kirjoita seuraava rivi DrRacketin interaktioikkunaan ja paina @italic{<enter>}. Kokeile muuttaa ympyrän kokoa ja väriä.

@racketblock[(circle 50 "solid" "red")]

@(circle 50 "solid" "red")

@subsection[#:tag "suorakulmio"]{Suorakulmio}

Suorakulmion piirtämiseen tarvitaan yksi argumentti lisää. Kokeile vaihtaa @racket["solid"]:in tilalle
@racket["outline"].

@margin-note{Interaktioikkunassa edellisen koodirivin voi palauttaa muokattavaksi painamalla
 @italic{Ctrl + nuoli ylös}. Näin pääset kokeilemaan miten eri argumentit vaikuttavat funktion paluuarvoon.}  

@racketblock[(rectangle 200 100 "solid" "blue")]

@(rectangle 200 100 "solid" "blue")

@subsection[#:tag "kolmio"]{Kolmio}

@margin-note{Löydät lisää piirtofunktioita täältä: @url{http://racket.koodiaapinen.fi/manuaali/2htdp_image.html}}

@racketblock[(triangle 100 "solid" "yellow")]

@(triangle 100 "solid" "yellow")

@subsection[#:tag "tahti"]{Tähti}

@racketblock[(star 75 "solid" "green")]

@(star 75 "solid" "green")

@section[#:tag "nimeaminen"]{Nimeäminen}

Interaktioikkunassa kokeilemasi koodi ei tallennu tiedostoon. Siksi se kannattaa kirjoittaa DrRacketin
toiseen ikkunaan eli @italic{määrittelyikkunaan (definitions window)}. Määrittelyillä annetaan nimiä
koodinpätkille, jotta niitä voidaan uudelleenkäyttää myöhemmin. Anna nyt piirtämillesi ympyrälle nimi
"YMPYRÄ" kirjoittamalla seuraava koodi määrittelyikkunaan ja painamalal "run":

@margin-note{Määrittelyikkuna on DrRacket:issä joko ylhäällä tai vasemmalla riippuen siitä käytetäänkö
 @italic{Vertical} vai @italic{Horizontal layout}:ia. Ikkunoiden asettelun voi muuttaa
 valikosta @italic{View->Use Horizontal layout. Määrittelyikkuna on WeScheme:ssä aina vasemmalla.}}

@racketblock[(define YMPYRÄ (circle 50 "solid" "red"))]

Tee sama suorakulmiolle:

@racketblock[(define SUORAKULMIO (rectangle 200 100 "solid" "blue"))]

Huomaa, että vaikka painat "run" interaktioikkunaan ei ilmesty mitään. YMPYRÄ ja SUORAKULMIO ovat silti olemassa
ja voit testata niitä interaktioikkunassa kirjoittamalla YMPYRÄ ja painamalla @italic{<enter>}.

@section[#:tag "kuvioiden_yhdistely"]{Kuvioiden yhdistely}

@subsection[#:tag "asettelu_paallekkain"]{Kuvien asettelu päällekkäin}
            
Voit yhdistää määrittelemäsi ympyrän ja suorakulmion samaan kuvaan kirjoittamalla seuraavan koodin DrRacket:in
määrittelyikkunaan ja painamalla "run": Huom! Ensimmäisenä annettu kuva tulee päällimmäiseksi.

@racketblock[(overlay YMPYRÄ SUORAKULMIO)]

@(define YMPYRÄ (circle 50 "solid" "red"))
@(define SUORAKULMIO (rectangle 200 100 "solid" "blue"))
 
@(overlay YMPYRÄ SUORAKULMIO)

@subsection[#:tag "asettelu_vapaasti"]{Kuvien asettelu vapaasti}

Overlay asettaa kuvat päällekkäin niiden keskipisteen kohdalta. Jos haluat siirtää kuvia toistensa suhteen,
käytä overlay/xy funktiota, jonka avulla voi määritellä kuinka monta pikseliä alempaa kuvaa siirretään x- ja
y-akselien suunnassa:

@racketblock[(overlay/xy YMPYRÄ 0 0 SUORAKULMIO)]

@(overlay/xy YMPYRÄ 0 0 SUORAKULMIO)

Tässä esimerkissä suorakulmiota on siirretty 100 pikseliä vasemmalle (x-akselin suunnassa):

@racketblock[(overlay/xy YMPYRÄ 100 0 SUORAKULMIO)]

@(overlay/xy YMPYRÄ 100 0 SUORAKULMIO)

Tässä esimerkissä suorakulmiota on siirretty 100 pikseliä alas (y-akselin suunnassa):

@racketblock[(overlay/xy YMPYRÄ 0 100 SUORAKULMIO)]

@(overlay/xy YMPYRÄ 0 100 SUORAKULMIO)

Kokeile mitä tapahtuu negatiivisilla luvuilla.