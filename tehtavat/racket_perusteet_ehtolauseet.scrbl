#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/math-utils))
@(require scribble/core
          scribble/html-properties)
@(require scribble/racket)
@(require scribble/eval)
@(require fin-doc/pr-math)
@setup-math

@(begin
   (require scribble/manual scribble/eval fin-doc/sl-eval)
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require 2htdp/image)
        (require math)
        (define a 5)
     (define b "kissa")
     (define c (circle 20 "solid" "red"))))
        (set! bsl (lambda () *bsl))
     *bsl))

@title[#:tag "perusteet_totuusarvot_ja_ehtolauseet"]{Totuusarvot ja ehtolauseet}

Jotta voimme tehdä oikeita ohjelmia, meidän täytyy pystyä tekemään haarautuvaa koodia. Tähän asti
kaikki koodi on suoritettu alusta loppuun, hyppäämättä minkään vaihtoehdon yli. Suoritettava vaihtoehto
päätellään sellaisten lausekkeiden avulla, jotka palauttavat
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._totuusarvo%29"]{totuusarvoja}.
Tällaisia funktioita kutsutaan 
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._predikaatti%29"]{predikaateiksi}.
Myös 
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._vertailuoperaattori%29"]{vertailuoperaattorit}
ovat predikaatteja, koska ne palauttavat totuusarvoja.

Yksinkertaisin tapa saada koodihaarautumaan on
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._ehtolause%29"]{ehtolause} eli @racket[if]-lause.
Se toimii niin, että jos asetettu ehto on tosi suoritetaan @italic{tosihaara}:n koodi. Jos ehto on epätosi, suoritetaan
@italic{epätosihaara}:n koodi.

Voit harjoitella ehtolauseen ja vertailuoperaattoreiden käyttöä seuraavien tehtävien avulla.

@section[#:tag "racket_perusteet_kolmiotehtavat_A1"]{Kolmiotehtävät A1}

Harjoittele ehto- ja valintalauseita seuraavien kolmion geometriaan liittyvien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/ehtolause/kolmiot_A1.rkt"]{Kolmiotehtävät A1 (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/kolmiot_A1.html"]{Kolmiotehtävät A1 (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Kolmiotehtävät A1}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(center left)       
         (list (list "Tehtävä 1" "Kirjoita funktio, joka ottaa sisäänsä kulman ja palauttaa tiedon siitä millainen kulma on: \"terävä\",
\"tylppä\", \"suorakulma\" jne." )
               (list "Tehtävä 2" "Kirjoita funktio, joka ottaa sisäänsä kaksi kolmion kulmaa ja palauttaa
kolmannen kulman suuruuden. Jos tehtävä on mahdoton funktio palauttaa \"ei ole kolmio\"."))]
               
Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/]  @racket[if] @racket[<] @racket[>] @racket[<=]
                     @racket[>=] @racket[=] @racket[check-expect]))]

@section[#:tag "racket_perusteet_robottisilma"]{Robottisilmä}

Harjoittele ehtolausetta ja vertailuoperaattoreita seuraavien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/ehtolause/robottisilma.rkt"]{Robottisilmä (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/robottisilma.html"]{Robottisilmä (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää tämän tehtävän:

@bold{Robottisilmä}

Koodaa taulukon avulla funktio, joka päättelee mitä väriä robotti näkee.

@image[#:scale 1 "kuvat/aallonpituudet.png"]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/]  @racket[if] @racket[<] @racket[>] @racket[<=]
                     @racket[>=] @racket[=] @racket[check-expect]))]

@section[#:tag "racket_perusteet_viivanseuraaja"]{Viivanseuraajarobotti}

Harjoittele ehtolausetta ja vertailuoperaattoreita seuraavien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/ehtolause/viivanseuraajarobotti.rkt"]{Viivanseuraajarobotti (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/viivanseuraajarobotti.html"]{Viivanseuraajarobotti (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää nämä tehtävät:

@bold{Viivanseuraajarobotti}

Koodaa funktio, joka ohjaa robotin seuraamaan viivaa, kun robotilla on valosensorit, jotka heijastavat valoa maahan seuraavasti:

@image[#:scale 0.7 "kuvat/valosensorit.png"]

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Koodaa funktio, joka päättelee valosensoreiden antamien lukemien perusteella mihin suuntaan robotin pitää kääntyä
(robotilla on kaksi valosensoria)."
                     @image["kuvat/viivanseuraajarobotti1.png" #:scale 0.5])
               (list "Koodaa funktio, joka päättelee valosensoreiden antamien lukemien perusteella mihin suuntaan robotin pitää kääntyä
(robotilla on yksi valosensori)."
                     @image["kuvat/viivanseuraajarobotti2.png" #:scale 0.6]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/]  @racket[if] @racket[<] @racket[>] @racket[<=]
                     @racket[>=] @racket[=] @racket[check-expect]))]

@section[#:tag "racket_perusteet_pyoristaminen"]{Pyöristäminen}

Harjoittele ehtolausetta pyöristämissääntöjen avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/ehtolause/pyoristys.rkt"]{Pyöristäminen (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/pyoristys.html"]{Pyöristäminen (WeScheme)}}))]

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Pyöristäminen}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(center left)       
         (list (list "Tehtävä 1" "Tee funktio, joka pyöristää desimaaliluvun lähimpään kokonaislukuun
\"tie-breaking\"-sääntönä \"pyöristä nollasta poispäin\": \n
Kun x on positiivinen, pyöristetään alaspäin lauseke: (x + 0,5) ja
kun x on negatiivinen, pyöristetään ylöspäin lauseke: (x – 0,5)")
               (list "Tehtävä 2" "Tee funktio, joka pyöristää annettuun tarkkuuteen. Tarkkuus annetaan kokonaislukuna, joka kertoo
montako desimaalia luvussa on. Käytä apunasi edellä tekemääsi pyöristä-funktiota."))]

@margin-note{Pyöristämiselle on monta erilaista algoritmia, koulun pyöristyssäännöt eivät ole ainoat käytössä olevat.}

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/] @racket[if] @racket[integer?] @racket[floor] @racket[ceiling] @racket[check-expect]))]

@margin-note[@link["http://www.slideshare.net/TiinaPartanen/racket-alkeet-4-oppitunti"]{Opettajan diat.}]

@section[#:tag "racket_perusteet_loogiset_palat"]{Loogiset palat}

Harjoittele ehtolauseita koodaamalla loogisia paloja. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/ehtolause/loogiset_palat_A.rkt"]{Loogiset palat A (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/loogiset_palat_A.html"]{Loogiset palat A (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

@bold{Loogiset palat}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Loogiset palat A: Koodaa funktiot, jotka piirtävät oheiset loogiset palat. Isojen neliöiden sivu on 50 pikseliä,
pienten 30 pikseliä ja reiän jalkaisijaksi 8 pikseliä." @image["kuvat/loogiset_palat_A.png" #:scale 0.8])
               (list "Loogiset palat B: Koodaa funktio, joka piirtää oheiset loogiset palat. Ison kolmion korkeus on 50 pikseliä ja
pienen kolmion korkeus 30 pikseliä. Vinkki: Tarvitset trigonometrisia funktioita kahdessakin kohdassa."
                     @image["kuvat/loogiset_palat_B.png" #:scale 0.8]))]
Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/] 
                     @racket[square])
               (list 
                @racket[circle]
                @racket[beside]
                @racket[above]
                @racket[overlay]
                @racket[overlay/xy])
               (list        
                @racket[check-expect]
                @racket[if]
                @racket[sqr]
                @racket[sqrt]
                @racket[sin])
               (list
                @racket[cos]
                @racket[tan]
                @racket[string=?]
                @racket[not]
                @racket[degrees->radians]))]