#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
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

Funktion kirjoittamisessa tärkein vaihe on suunnittelu. Koska funktion suunnittelussa on monta päätöstä tehtävänä, se voi aluksi tuntua lähdes
mahdottomalta. Siksi teemme sen pienissä askelissa seuraamalla menetelmää nimeltä @italic{funktion suunnitteluportaat}. Emme siis yritä hypätä
katolle yhdellä (mahdottomalla) loikalla. Jos menetelmä ei ole sinulle tuttu, katso ensin @link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._funktion_suunnitteluportaat%29"]{esimerkki} Koodarin käsikirjasta. 

@image["../manuaali/sanasto/funktion_suunnitteluportaat.png" #:scale 0.7]

Voit tutustua funktioiden maailmaan valitsemalla joko laskuharjoituksia tai kuvienpiirtoharjoituksia.

@section[#:tag "racket_perusteet_pinta-alafunktioita_A"]{Pinta-alatehtävät A}

Harjoittele funktion kirjoittamista seuraavien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/pxgo2kz"]{Pinta-alatehtävät A (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=jBDvKwe1bZ"]{Pinta-alatehtävät A (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
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
                     @racket[/] @racket[check-expect]))]

@section[#:tag "racket_perusteet_pinta-alafunktioita_B"]{Pinta-alatehtävät B}

Harjoittele funktion kirjoittamista seuraavien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/qxgzco9"]{Pinta-alatehtävät B (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=J50mifXEnl"]{Pinta-alatehtävät B (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Pinta-alatehtävät B}

Tee funktioita erilaisten pinta-alojen laskemiseen. Valitse muuttujille sopivat nimet/nimi.
Täydennä funktion kuvauksen puuttuvat tiedot (...). Tee myös esimerkkejä/testejä funktiollesi (check-expect).

@italic{Huom!} Tehtävässä tarvitset piin arvoa. Racket-kielessä se on vakio nimeltä @racket[pi].

@margin-note{Koska piin arvo on päättymätön, tulokset ovat aina likiarvoja (epätarkkoja). DrRacket varoittaa epätarkoista arvoista 
lisäämällä luvun eteen @litchar{#i}-merkinnän. Samasta syystä emme voi käyttää @racket[check-expect]-testiä vaan epätarkoille tuloksille
tarkoitettua @racket[check-within]-testiä.}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Funktio ympyröiden pinta-alojen laskemiseen" @image["kuvat/ympyrat.png" #:scale 0.7])
               (list "Funktio sektoreiden pinta-alojen laskemiseen" @image["kuvat/sektorit.png" #:scale 0.7])
               (list "Funktio ympyrälieriöiden kokonaispinta-alojen laskemiseen" @image["kuvat/ympyralieriot.png" #:scale 0.7]))]


@margin-note[@link["http://www.slideshare.net/TiinaPartanen/racket-alkeet-3-oppitunti"]{Opettajan diat.}]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/] @racket[sqr] @racket[check-within]))]


@section[#:tag "racket_perusteet_kuvafunktioita"]{Kuvafunktioita}

Suunnittele ja koodaa funktiot, jotka tuottavat seuraavanlaisia kuvia:

@bold{Kuvafunktioita}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Koodaa nuolenkuvia tuottava funktio." @image["kuvat/nuolet.png" #:scale 0.6])
               (list "Koodaa liikennevaloja tuottava funktio." @image["kuvat/liikennevalot.png" #:scale 0.9])
               (list "Koodaa kuvan geometrisia kuvioita tuottava funktio. "  @image["kuvat/geometrinen_kuvioA.png" #:scale 0.9])
               (list "Koodaa ufon laskutumisvaiheen kuvat tuottava funktio." @image["kuvat/ufot.png" #:scale 0.3])
               (list "Koodaa kuvan geometrisiä kuvioita tuottava funktio." @image["kuvat/geometrinen_kuvioB.png" #:scale 0.7])
               (list "Koodaa EU:n lippu." @image["kuvat/eu_lippu.png" #:scale 0.4])
               )]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/] 
                     @racket[rectangle])
               (list
                @racket[ellipse]
                @racket[circle]
                @racket[rhombus]
                @racket[triangle]
                @racket[star])
               (list @racket[place-image]
                     @racket[beside]
                     @racket[above]
                     @racket[overlay]
                     @racket[overlay/xy])
               (list @racket[rotate]
                     @racket[flip-vertical]
                     @racket[flip-horizontal]
                     @racket[scale]
                     @racket[check-expect]))]

@section[#:tag "racket_perusteet_kuvafunktioita_ja_geometriaa"]{Geometrisia kuvafunktioita}

Suunnittele ja koodaa funktiot, jotka tuottavat seuraavanlaisia geometriaan liittyviä kuvia:

@bold{Geometrisia kuvafunktioita}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Koodaa funktio, joka piirtää suorakulmaisten särmiöiden levityskuvia." @image["kuvat/suorakulmaiset_sarmiot_levitys.png" #:scale 0.8])
               (list "Koodaa funktio, jonka avulla voit liittää suorakulmioon sen mitat." @image["kuvat/suorakulmion_mitat.png" #:scale 0.5])
               (list "Koodaa funktio, joka tuottaa pinta-alan ja tilavuuden yksiköistä kuvia. "  @image["kuvat/yksikot.png" #:scale 0.9])
               (list "Koodaa funktio, joka piirtää ympyrälieriön levityskuvia." @image["kuvat/ympyralierion_levitys.png" #:scale 0.7])
               (list "Koodaa funktio, joka piirtää suorakulmaisten särmiöiden levityskuvia ja laskee niiden kokonaispinta-alat sekä
liittää tulokset kuviin yksiköiden kera. Tämä tehtävä vaatii useammankin funktion koodaamista, joten tehtävä kannattaa jakaa useamman koodarin kesken.
Voit myös käyttää aikaisempien tehtävien tuotoksia tässä tehtävässä!" @image["kuvat/pinta-alakuvat.png" #:scale 1]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/] )
               (list @racket[rectangle]
                     @racket[circle]
                     @racket[beside]
                     @racket[above])
                (list     @racket[overlay]
                          @racket[overlay/xy]
                          @racket[rotate]
                          @racket[check-expect]))]
