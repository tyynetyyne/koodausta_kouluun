#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
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

@title[#:tag "perusteet_valintalauseet"]{Valintalause ja Boolean operaattorit}

Jos koodissa on useita haarautumisvaihtoehtoja (sisäkkäisiä if-lauseita), voi olla selkeämpää käyttää
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._valintalause%29"]{valintalausetta} eli
@racket[cond]-lausetta. Siinä voidaan antaa niin monta ehtoa kuin on tarpeen ja lopuksi @racket[else]-haara, joka palautetaan jos
mikään varsinaisista ehdoista ei toteutunut.

Joskus haaran suorittamiseksi pitää useamman ehdon toteutua tai kahdesta ehdosta vain toisen tarvitsee toiteutua.
Yksittäisiä ehtoja voidaan yhdistellä monimutkaisemmiksi ehdoiksi  
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._.Boolean_operaattori%29"]{Boolean operaattoreilla} 
joita ovat @racket[and], @racket[or] ja @racket[not]. 

Voit harjoitella valintalausetta sekä Boolean operaattoreita seuraavien tehtävien avulla.

@section[#:tag "racket_perusteet_syotteentarkistaminen"]{Syötteen tarkistaminen}

Ennen kuin harjoittelet ehto- ja valintalauseita kannattaa harjoitella predikaattien, vertailuoperaattoreiden sekä
Boolean operaattoreiden käyttöä syötteen tarkistamiseen. Syötteen tarkistaminen on tärkeää, sillä väärän tyyppisellä
syötteellä ohjelma yleensä kaatuu ellei tilannetta ole otettu huomioon ehto- tai valintalauseen avulla.
Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/valintalause/syotteen_tarkistaminen.rkt"]{Syötteen tarkistaminen (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/syotteen_tarkistaminen.html"]{Syötteen tarkistaminen (WeScheme)}}))]

Tehtävätiedosto sisältää nämä harjoitustehtävät:

@bold{Syötteen tarkistaminen}

Ohjelmoi funktio, joka tarkistaa onko annettu syöte halutunlainen.
Käytä tarkistamiseen predikaatteja, vertailuoperaattoreita sekä
Boolean operaattoreita. Jos syöte on halutunlainen funktio palauttaa
@racket[#true] muuten @racket[#false].

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(left)       
         (list (list "a) Syötteen pitää olla positiivinen kokonaisluku.")
               (list "b) Syötteen pitää olla välillä 0-100 (päätepisteet mukana).")
               (list "c) Syötteen pitää olla positiivinen parillinen ja pienempi kuin 500.")
               (list "d) Syötteen pitää olla negatiivinen murtoluku (ei saa olla kokonaisluku).")
               (list "e) Syötteen pitää olla joko suurempi kuin -10 ja pienempi kuin 10 tai suurempi
kuin 50 ja pienempi kuin 100."))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[number?] @racket[integer?])
               (list @racket[and] @racket[or] @racket[not] @racket[rational?] @racket[even?]@racket[odd?] @racket[check-expect]))]

@section[#:tag "racket_perusteet_taksimatkalaskut"]{Taksimatkalaskut}

Harjoittele ehto- ja valintalauseita seuraavien taksimatkalaskujen avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/valintalause/taksimatkat.rkt"]{Taksimatkalaskut (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/taksimatkat.html"]{Taksimatkalaskut (WeScheme)}}))]

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Taksimatkalaskut}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(center left)       
         (list (list "Tehtävä 1" "Tee funktio, jonka avulla voit laskea taksimatkan suuruuden euroissa,
kun tiedetään matkustajien määrä ja kuljetut kilometrit. Tarkista myös funktion saamat arvot, että ne ovat
järkeviä ja jos ne eivät ole palauta \"tarkista tiedot\".")
               (list "Tehtävä 2" "Sinulla on taskussasi x euroa ja teitä on yhteensä y matkustajaa. Tee funktio,
joka laskee kuinka kauas (km) pääsette ajelemaan rahoillasi."))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/] @racket[if]
                     @racket[cond]@racket[and] @racket[or] @racket[not] @racket[number?] @racket[integer?] @racket[check-expect]))]

@section[#:tag "racket_perusteet_kolmiotehtavat_A2"]{Kolmiotehtävät A2}

Harjoittele valintalauseita sekä Boolean operaattoreita seuraavien kolmion geometriaan liittyvien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/valintalause/kolmiot_A2.rkt"]{Kolmiotehtävät A2 (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/kolmiot_A2.html"]{Kolmiotehtävät A2 (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Kolmiotehtävät A2}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(center left)       
         (list (list "Tehtävä 1" "Kirjoita funktio, joka ottaa sisäänsä kolmion kulmat suuruusjärjestyksessä ja palauttaa kolmion tyypin:
\"teräväkulmainen kolmio\", \"tylppäkulmainen kolmio\", \"suorakulmainen kolmio\" tai jos tehtävä on mahdoton
\"ei ole kolmio\".")
               (list "Tehtävä 2" "Kirjoita funktio, joka ottaa sisäänsä kolmion sivujen pituudet suuruusjärjestyksessä ja palauttaa
kolmion tyypin: \"tasasivuinen kolmio\", \"tasakylkinen kolmio\", \"kolmio\" tai \"ei ole kolmio\"."))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/] @racket[if] @racket[cond] @racket[and] @racket[or] @racket[not]
                     @racket[check-expect]))]

@section[#:tag "racket_perusteet_kolmiotehtavia_B"]{Kolmiotehtävät B}

Harjoittele valintalausetta ja Boolean operaattoreita seuraavien kolmion geometriaan liittyvien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/valintalause/kolmiot_B.rkt"]{Kolmiotehtävät B (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/kolmiot_B.html"]{Kolmiotehtävät B (WeScheme)}}))]

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Kolmiotehtävät B}

@margin-note{Neliöjuuren antamat tulokset ovat aina likiarvoja (epätarkkoja). DrRacket varoittaa epätarkoista arvoista 
 lisäämällä luvun eteen @litchar{#i}-merkinnän. Samasta syystä emme voi käyttää @racket[check-expect]-testiä vaan epätarkoille tuloksille
 tarkoitettua @racket[check-within]-testiä.}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(center left)
         
         (list (list "Tehtävä 1" "Kirjoita funktio, joka palauttaa suorakulmaisen kolmion kolmannen sivun pituuden, kun kaksi sivua on annettu.
Funktio saa sisäänsä kahden sivun pituudet, sekä tiedon siitä onko toisena annettu luku (y) hypotenuusan
pituus. Funktio laskee Pythagoraan lauseen avulla kolmannen sivun pituuden. Jos tehtävä on mahdoton se 
palauttaa \"ei ole kolmio\" ja jos sivujen pituudet on annettu niin että niistä ei muodostu suorakulmaista
kolmiota se palauttaa \"ei ole suorakulmainen kolmio\"." )
               (list "Tehtävä 2" "Kirjoita funktio, joka tutkii kolmion sivujen pituuksien avulla onko kyseessä suorakulmainen kolmio.
Käytä avuksesi Pythagoraan lausetta. Huomaa, että sivujen pituudet saa antaa missä järjestyksessä tahansa ja
ohjelman pitää huomata myös se, jos annetut sivut eivät muodosta kolmiota. Palauta tässä tapauksessa \"ei ole kolmio\"." ))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/]  @racket[sqr] @racket[sqrt] @racket[if]
                     @racket[cond] @racket[and] @racket[or] @racket[not] @racket[check-expect] @racket[check-within]))]

@margin-note[@link["http://www.slideshare.net/TiinaPartanen/racket-alkeet-4-oppitunti"]{Opettajan diat.}]

@section[#:tag "racket_perusteet_liikennevalot"]{Liikennevalot}

Suunnittele ja koodaa funktio, joka tuottaa liikennevalot. Käytä ehto- tai valintalausetta apunasi.

@bold{Liikennevalot}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Koodaa funktio, joka palauttaa kuvan mukaisia liikennevaloja (mallikuva on saatu kutsumalla funktiota useita eri
 kertoja)."
                     @image["kuvat/liikennevalot.png" #:scale 0.8]))]

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
                @racket[string=?]
                @racket[=]
                @racket[if]
                @racket[cond]
                @racket[check-expect]))]