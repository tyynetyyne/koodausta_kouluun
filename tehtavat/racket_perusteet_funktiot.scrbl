#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/plot2D))
@(require scribble/core
          scribble/html-properties)
@(require scribble/racket)
@(require fin-doc/pr-math)
@setup-math

@title[#:tag "perusteet_funktiot"]{Funktiot}

Tähän asti olet käyttänyt Racket-kielen valmiita funktioita kuten @racket[+] sekä @italic{2htdp/image}-kirjaston tarjoamia funktioita kuten
@racket[circle]. Huomasit varmasti myös, että kuvat koostuvat useammasta pikkukuvasta. Myös tietokoneohjelmat koostuvat piennemmistä osista,
ja funktiot ovat juuri näitä tietokoneohjelman "perusosasia". Ne toimivat omina pikku ohjelminaan, ottavat sisään tietoa ja antavat ulos muokattua
tietoa. Näitä osia yhdistelemällä saadaan aikaan monimutkaisempia ohjelmia. Jotta pystyt tekemään kokonaisia isoja ohjelmia, sinun pitää osata ensin
tehdä pieniä ohjelmia eli funktioita.

Voit tutustua funktioiden maailmaan valitsemalla joko laskuharjoituksia tai kuvienpiirtoharjoituksia.
Tutustu ensin funktion määrittelemiseen @link["http://racket.koodiaapinen.fi/manuaali/maarittelyt.html"]{Koodarin käsikirjan} avulla.

@section[#:tag "racket_perusteet_pinta-alafunktioita_A"]{Pinta-alatehtävät A}

Harjoittele funktion kirjoittamista ja testaamista seuraavien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/funktio/pinta-alafunktiot_A.rkt"]{Pinta-alatehtävät A (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/pinta-alafunktiot_A.html"]{Pinta-alatehtävät A (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta sen 
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Pinta-alatehtävät A}

Tee funktioita erilaisten pinta-alojen laskemiseen. Valitse muuttujille sopivat nimet/nimi.
Täydennä funktion kuvauksen puuttuvat tiedot (...). Tee myös esimerkkejä/testejä funktiollesi (check-expect).

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Funktio neliöiden pinta-alojen laskemiseen" @image["kuvat/neliot.png" #:scale 0.7])
               (list "Funktio suorakulmioiden pinta-alojen laskemiseen" @image["kuvat/suorakulmiot.png" #:scale 0.7])
               (list "Funktio kolmioiden pinta-alojen laskemiseen" @image["kuvat/kolmiot.png" #:scale 0.7])
               (list "Funktio kuutioiden kokonaispinta-alojen laskemiseen" @image["kuvat/kuutiot.png" #:scale 0.7])
               (list "Funktio suorakulmaisten särmiöiden kokonaispinta-alojen laskemiseen" @image["kuvat/suorakulmaiset_sarmiot.png" #:scale 0.7]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/] @racket[sqr] @racket[check-expect]))]

@margin-note[@link["http://www.slideshare.net/TiinaPartanen/racket-alkeet-3-oppitunti"]{Opettajan diat.}]

@section[#:tag "racket_perusteet_lampotilamuunnoksia"]{Lämpötilat}

Harjoittele funktion kirjoittamista ja testaamista seuraavien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/funktio/lampotilat.rkt"]{Lämpötilat (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/lampotilat.html"]{Lämpötilat (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta sen 
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Lämpötilat}

Tee funktiot lämpötilojen muuntamiseksi asteikolta toiselle seuraavan taulukon mukaisesti.
Testaa funktiosi interaktioikkunassa tai kirjoita sille check-expect - testit.

@image[#:scale 1.0 "kuvat/lampotilat.png"]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/] @racket[string-append] @racket[number->string] @racket[check-expect]))]

@section[#:tag "racket_perusteet_polynomit"]{Polynomit}

Harjoittele funktion kirjoittamista ja sen kuvaajan piirtämistä seuraavien tehtävien avulla.
Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/funktio/polynomit.rkt"]{Polynomit (DrRacket)}}))]

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Polynomit}

Kirjoita seuraavat polynomit funktion muotoon ja piirrä niille kuvaajat esimerkin mukaisesti.

@image[#:scale 0.5 "kuvat/polynomit.png"]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai plot2D-kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/] @racket[plot2D] @racket[func] @racket[check-expect]))]

@section[#:tag "racket_perusteet_varikirjaimet"]{Värillinen teksti}

Harjoittele funktion kirjoittamista ja testaamista seuraavan tehtävan avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/funktio/varillinen_teksti.rkt"]{Värillinen teksti (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/varillinen_teksti.html"]{Värillinen teksti (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta sen 
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää seuraavan testävän:

@bold{Värillinen teksti}

Koodaa funktio, joka tekee eri värisiä kirjaimia eri värillisillä pohjilla. Kirjoita funktion avulla oma nimesi. Voit muuttaa värejä ja pohjan muotoa haluamaksesi.
Testaa funktiosi interaktioikkunassa tai kirjoita sille check-expect - testit.

@image[#:scale 1.0 "kuvat/varikirjaimet.png"]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[beside] @racket[above] @racket[text] @racket[overlay] @racket[check-expect]))]

@section[#:tag "racket_perusteet_sarmion_levityskuva"]{Särmiön levityskuvat}

Harjoittele funktion kirjoittamista ja testaamista seuraavan tehtävan avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/funktio/sarmion_levityskuvat.rkt"]{Särmiön levityskuvat (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/sarmion_levityskuvat.html"]{Särmiön levityskuvat (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta sen 
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää seuraavat testävät:

@bold{Särmiön levityskuvat}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Koodaa funktio, joka piirtää minkä tahansa kokoisen kuution levityskuvan (mallikuvat on saatu kutsumalla funktiota kaksi eri kertaa)."
                     @image["kuvat/kuution_levitys.png" #:scale 1.0]                                         )
               (list "Koodaa funktio, joka piirtää minkä tahansa kokoisen suorakulmaisen särmiön levityskuvan (mallikuvat on saatu kutsumalla funktiota kaksi eri kertaa)."
                     @image["kuvat/sarmion_levitys.png" #:scale 0.9]                     
                     ))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[beside] @racket[above] @racket[text] @racket[overlay] @racket[check-expect]))]

@section[#:tag "racket_perusteet_kuvafunktioita"]{Kuvafunktioita}

Suunnittele ja koodaa funktiot, jotka tuottavat seuraavanlaisia kuvia:

@bold{Kuvafunktioita}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
          (list      (list "Koodaa funktio, joka tuottaa eri värisiä nuolia (mallikuvat on saatu kutsumalla funktiota kolme eri kertaa). "
                           @image["kuvat/varinuolet.png" #:scale 0.4])
                     (list "Koodaa funktio, joka sijoittaa auton kuvan ruudulle, kun sen sijainti muuttuu. Voit käyttää myös jotain muuta kuvaa (mallikuvat on saatu kutsumalla funktiota kolme eri kertaa)."
                           @image["kuvat/autot.png" #:scale 0.5])
                     (list "Koodaa funktio, jonka avulla saat tehtyä pinta-alan ja tilavuuden yksiköitä (mallikuvat on saatu kutsumalla funktiota kolme eri kertaa)."
                           @image["kuvat/yksikot.png" #:scale 1]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+]
                     @racket[-]
                     @racket[*]
                     @racket[/] 
                     @racket[rectangle])
               (list
                @racket[circle]
                @racket[triangle]
                @racket[square]
                @racket[image-width]
                @racket[image-height])
               (list
                @racket[place-image]
                @racket[beside]
                @racket[above]
                @racket[overlay]
                @racket[overlay/xy])
               (list
                @racket[text]
                @racket[number->string]
                @racket[scale]
                @racket[rotate]
                @racket[check-expect]))]