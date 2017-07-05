#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/math-utils))
@(require scribble/core
          scribble/html-properties)
@(require scribble/racket)
@(require fin-doc/pr-math)
@setup-math

@title[#:tag "perusteet_apufunktiot"]{Apufunktiot ja funktion suunnitteluportaat}

@margin-note[@link["https://youtu.be/GJShFsMybL0"]{@image[#:scale 0.015 "kuvat/video.png"] Funktion suunnitteluportaat (osa 1), kesto 7:22}]

Isot ongelmat ovat vaikeampia ratkaista kuin pienet ongelmat. Sama pätee ohjelmoinnissa. Siksi kannattaa opetella ratkaisemaan ongelmat
paloissa käyttämällä pienempiä apufunktioita isomman ja monimutkaisemman funktion toteuttamiseen.
Hyvä nyrkkisääntö on se, että jokainen funktio tekee vain yhden asian. 

@margin-note[@link["https://youtu.be/JWGYNNFy_6c"]{@image[#:scale 0.015 "kuvat/video.png"] Funktion suunnitteluportaat (osa 2), kesto 6:53}]

Jokaisen funktion koodaamisessa tärkein vaihe on suunnittelu. Koska funktion suunnittelussa on monta päätöstä tehtävänä, se voi aluksi tuntua
lähdes mahdottomalta. Siksi teemme sen pienissä askelissa seuraamalla menetelmää nimeltä @italic{funktion suunnitteluportaat}.
Emme siis yritä hypätä katolle yhdellä (mahdottomalla) loikalla. Jos menetelmä ei ole sinulle tuttu,
katso ensin @link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._funktion_suunnitteluportaat%29"]{esimerkki} Koodarin käsikirjasta. 

@margin-note[@link["https://youtu.be/l45YMjAc5r0"]{@image[#:scale 0.015 "kuvat/video.png"] Funktion jakaminen osiin, kesto 10:49}]

@image["../manuaali/sanasto/funktion_suunnitteluportaat.png" #:scale 0.7]

Voit tutustua apufunktioiden ja funktion suunnitteluportaiden käyttöön tekemällä joko laskuharjoituksia tai kuva- ja yhdistelmätehtäviä.

@section[#:tag "racket_perusteet_pinta-alafunktioita_B"]{Pinta-alatehtävät B}

Harjoittele funktioiden ja apufunktioiden kirjoittamista seuraavien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/apufunktiot/pinta-alafunktiot_B.rkt"]{Pinta-alafunktiot B (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/pinta-alafunktiot_B.html "]{Pinta-alafunktiot B (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Pinta-alafunktiot B}

Tee funktioita erilaisten pinta-alojen laskemiseen. Valitse muuttujille sopivat nimet/nimi.
Täydennä funktion kuvauksen puuttuvat tiedot (...). Tee myös esimerkkejä/testejä funktiollesi (check-expect).

@italic{Huom!} Tehtävässä tarvitset piin arvoa. Racket-kielessä se on vakio nimeltä @racket[pi].

@margin-note{Koska piin arvo on päättymätön desimaaliluku, tulokset ovat aina likiarvoja (epätarkkoja). DrRacket varoittaa epätarkoista arvoista 
 lisäämällä luvun eteen @litchar{#i}-merkinnän. Samasta syystä emme voi käyttää @racket[check-expect]-testiä vaan epätarkoille tuloksille
 tarkoitettua @racket[check-within]-testiä.}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Funktio ympyröiden pinta-alojen laskemiseen" @image["kuvat/ympyrat.png" #:scale 0.7])
               (list "Funktio sektoreiden pinta-alojen laskemiseen" @image["kuvat/sektorit.png" #:scale 0.7])
               (list "Funktio ympyrälieriöiden kokonaispinta-alojen laskemiseen" @image["kuvat/ympyralieriot.png" #:scale 0.7]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita ja vakioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/] @racket[sqr] @racket[check-within] @racket[pi]))]

@margin-note[@link["http://www.slideshare.net/TiinaPartanen/racket-alkeet-3-oppitunti"]{Opettajan diat.}]

@section[#:tag "racket_perusteet_kuva_ja_yhdistelmafunktioita"]{Kuva- ja yhdistelmäfunktioita}

Suunnittele ja koodaa funktiot, jotka tuottavat seuraavanlaisia kuvia:

@bold{Kuva- ja yhdistelmäfunktioita}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list 
          (list "Koodaa kuvan geometrisia kuvioita tuottava funktio."
                @image["kuvat/geometrinen_kuvioA.png" #:scale 0.9])
          (list "Koodaa kuvan geometrisiä kuvioita tuottava funktio."
                @image["kuvat/geometrinen_kuvioB.png" #:scale 0.7])
          (list "Koodaa funktio, jonka avulla voit liittää suorakulmioon sen mitat."
                @image["kuvat/suorakulmion_mitat.png" #:scale 0.5])
          (list "Koodaa funktio, joka piirtää ympyrälieriön levityskuvia."
                @image["kuvat/ympyralierion_levitys.png" #:scale 0.7])
          (list "Koodaa funktio, joka piirtää suorakulmaisten särmiöiden levityskuvia ja laskee niiden kokonaispinta-alat sekä
liittää tulokset kuviin yksiköiden kera. Tämä tehtävä vaatii useammankin funktion koodaamista. Voit myös käyttää aikaisempien tehtävien tuotoksia tässä tehtävässä!"
                @image["kuvat/pinta-alakuvat.png" #:scale 1])
          (list "Koodaa EU:n lippu." @image["kuvat/eu_lippu.png" #:scale 0.4]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/] 
                     @racket[rectangle])
               (list
                @racket[circle]
                @racket[rhombus]
                @racket[regular-polygon]
                @racket[star]
                @racket[beside])
               (list      @racket[above]
                          @racket[overlay]
                          @racket[overlay/xy]
                          @racket[rotate]
                          @racket[flip-vertical])
               (list           @racket[flip-horizontal]
                               @racket[number->string]
                               @racket[text]
                               @racket[units->image]
                               @racket[check-expect]))]