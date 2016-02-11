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

@title[#:tag "peruskuvat_ja_kuvien_yhdistely"]{Peruskuviot ja kuvien yhdistely}

Jotta voit piirtää kuvia, ota käyttöön kuvien piirtokirjasto. Kirjoita määrittelyikkunaan:

@racketblock[(require 2htdp/image)]

Voit myös avata tästä tiedoston, jossa tämä vaihe on valmiina:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/alkeet/kuvat/peruskuvat.rkt"]{Peruskuvat (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/"]{Peruskuvat (WeScheme)}}))]

Ota kirjasto käyttöön painamalla @italic{run}.

Nyt voit tutustua interaktioikkunassa siihen miten peruskuvioita piirretään.
Katso käsikirjasta ohjeet ja kokeile näitä:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[circle] @racket[rectangle]
                     @racket[triangle] @racket[star] @racket[ellipse]))]

Tallenna nyt kaksi em. kokeilemaasi kuviota määrittelyikkunaan. Tutustu sitten siihen miten kaksi tai useampi kuva yhdistetään
yhdeksi kuvaksi. Kokeile yhdistää aikaisemmin tekemäsi kuvat nyt määrittellyikkunassa käyttäen näitä funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[overlay] @racket[beside] @racket[above]
                     @racket[overlay/xy]))]


@section[#:tag "racket_alkeet_peruskuviot_1"]{Yksinkertaiset kuvat}

Koodaa em. funktioiden avulla seuraavat tehtävät:

@bold{Kuvakoodaus 1}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Koodaa Japanin lippu." @image["kuvat/japaninlippu.png"])
               (list "Koodaa Suomen lippu. "  @image["kuvat/suomenlippu.png"])
               (list "Koodaa auto." @image["kuvat/auto.png"]))]

@margin-note[@link["http://www.slideshare.net/TiinaPartanen/racket-alkeet-2-oppitunti"]{Opettajan diat.}]

Katso ohjetta Japanin lipun mittasuhteista @link["https://fi.wikipedia.org/wiki/Japanin_lippu#/media/File:Construction_sheet_of_the_Japanese_flag.svg"]{täältä.}
Katso ohjetta Suomen lipun mittasuhteista @link["http://www.edu.vantaa.fi/pahkis/galleria/galleria_tunnukset/liputusohjeet.htm"]{täältä}.

@section[#:tag "racket_alkeet_peruskuviot_2"]{Monimutkaiset kuvat}

Jos teit edellisen tehtävän auton huomasit, että jouduit kirjoittamaan kaksi kertaa saman @racket[circle]-lausekkeen. Se on turhaa, jos
opettelemme käyttämään @italic{muuttujaa}, johon tallennamme kuvan. Seuraava koodi tallentaa @italic{RENGAS} nimiseen muuttujaan mustan
ympyrän:

@racketblock[(define RENGAS (circle 25 "solid" "black"))]

Nyt riittää, että koodiin kirjoittaa @racket[RENGAS], joka kerta kun haluaa mustan ympyrän. Esim. kaksi RENGASTA
vierekkäin samassa kuvassa olisi:

@racketblock[(overlay/xy RENGAS 100 0 RENGAS)]

Anna nyt määrittelyikkunassa aikaisemmin tekemillesi peruskuvioille muuttujanimet. 

Kuvia voi myös skaalata pienemmiksi tai suuremmiksi, kiertää tietyn asteluvun verran, peilata vaaka- ja pystysuunnassa sekä leikata. Tutustu
näihin kuvanmuokkausfunktioihin käsikirjan avulla. Käytä itse nimeämiäsi kuvioitasi ja testaa funktioita niillä.

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[scale] @racket[rotate] @racket[flip-horizontal]
                     @racket[flip-vertical] @racket[crop]))]

Koodaa em. funktioiden avulla seuraavat tehtävät:

@bold{Kuvakoodaus 2}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Koodaa kukka." @image["kuvat/kukka.png"])
               (list "Koodaa neliö ympyrän osista."  @image["kuvat/nelio_ympyrasta.png"])
               (list "Koodaa pikseligrafiikkaa esim. tämä ukkeli tai suunnittele oma pikselikuva!" @image["kuvat/ukko.png"]))]

