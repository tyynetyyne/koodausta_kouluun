#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label (except-in math sqr)))
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
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._vertailuoperaattorit%29"]{vertailuoperaattorit}
ovat predikaatteja, koska ne palauttavat totuusarvoja.

Yksinkertaisin tapa saada koodihaarautumaan on
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._ehtolause%29"]{ehtolause} eli @racket[if]-lause.
Se toimii niin, että jos asetettu ehto on tosi suoritetaan @italic{tosihaara}:n koodi. Jos ehto on epätosi, suoritetaan
@italic{epätosihaara}:n koodi.

Jos haarautumisvaihtoehtoja halutaan enemmän kuin kaksi, kannattaa käyttää
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._valintalause%29"]{valintalausetta} eli
@racket[cond]-lausetta. Siinä voidaan antaa monta ehtoa, ja lopuksi @racket[else]-haara, joka palautetaan jos
mikään varsinaisista ehdoista ei toteutunut.

Ehtoja voidaan myös yhdistellä
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._.Boolean_operaattorit%29"]{Boolean operaattoreilla} 
joita ovat @racket[and], @racket[or] ja @racket[not].
 
Voit harjoitella ehto- ja valintalauseita seuraavien tehtävien avulla.

@section[#:tag "racket_perusteet_ehtolauseet_kolmiotehtavat_A"]{Kolmiotehtävät A}

Harjoittele ehto- ja valintalauseita seuraavien kolmion geometriaan liittyvien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/ndgg5jd"]{Kolmiotehtävät A (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=0iz8Y1FDnn"]{Kolmiotehtävät A (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Kolmiotehtävät A}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(center left)       
         (list (list "Tehtävä 1" "Kirjoita funktio, joka ottaa sisäänsä kaksi kolmion kulmaa ja palauttaa
kolmannen kulman suuruuden. Jos tehtävä on mahdoton funktio palauttaa \"ei ole kolmio\".")
               (list "Tehtävä 2" "Kirjoita funktio, joka ottaa sisäänsä kolmion sivujen pituudet ja palauttaa kolmion tyypin:
\"tasasivuinen kolmio\", \"tasakylkinen kolmio\", \"kolmio\" tai \"ei ole kolmio\"."))]
               
Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/] @racket[check-expect] @racket[if] @racket[cond]@racket[and] @racket[or] @racket[not]))]

@section[#:tag "racket_perusteet_kolmiotehtavia_B"]{Kolmiotehtävät B}

Harjoittele ehto- ja valintalauseita seuraavien kolmion geometriaan liittyvien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/nh5rsra"]{Kolmiotehtävät B (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=Y1eZzSR0AY"]{Kolmiotehtävät B (WeScheme)}}))]

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
         (list (list @racket[+] @racket[-] @racket[*] @racket[/] @racket[check-expect] @racket[check-within] @racket[sqr] @racket[sqrt] @racket[if] @racket[cond] @racket[and] @racket[or] @racket[not]))]

@section[#:tag "racket_perusteet_rahalaskuja"]{Rahalaskuja}

Harjoittele ehto- ja valintalauseita seuraavien taksimatkalaskujen avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/p5y99ow"]{Taksimatkalaskut (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=EQ9RcYKwfx"]{Taksimatkalaskut (WeScheme)}}))]

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Taksimatkalaskuja}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(center left)       
         (list (list "Tehtävä 1" "Tee funktio, jonka avulla voit laskea taksimatkan suuruuden euroissa,
kun tiedetään matkustajien määrä ja kuljetut kilometrit. Tarkista myös funktion saamat arvot, että ne ovat
järkeviä ja jos ne eivät ole palauta \"tarkista tiedot\".")
               (list "Tehtävä 2" "Sinulla on taskussasi x euroa ja mukanasi y kaveria. Tee funktio,
joka laskee kuinka kauas (km) pääsette ajelemaan rahoillasi."))]
               
Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/] @racket[check-expect] @racket[if] @racket[cond]@racket[and] @racket[or] @racket[not] @racket[number?] @racket[integer?]))]

@section[#:tag "racket_perusteet_pyöristäminen"]{Pyöristäminen}

Harjoittele ehtolausetta pyöristämissääntöjen avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/ot4s55a"]{Pyöristäminen (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=q1q7QfGaeW"]{Pyöristäminen (WeScheme)}}))]

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Pyöristäminen}

@tabular[#:style 'boxed
         #:row-properties (list 'border)
         #:column-properties '(center left)       
         (list (list "Tehtävä 1" "Tee funktio, joka pyöristää desimaaliluvun kokonaisluvuksi pyöristyssääntöjen mukaisesti.")
               (list "Tehtävä 2" "Tee funktio, joka pyöristää annettuun tarkkuuteen. Tarkkuus annetaan kokonaislukuna, joka kertoo
montako desimaalia luvussa on. Käytä apunasi edellä tekemääsi pyöristä-funktiota."))]
               
Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*] @racket[/] @racket[check-expect] @racket[if] @racket[integer?] @racket[floor] @racket[ceiling]))]

@margin-note[@link["http://www.slideshare.net/TiinaPartanen/racket-alkeet-4-oppitunti"]{Opettajan diat.}]

@section[#:tag "racket_perusteet_kuvia_ehtolauseiden_avulla"]{Kuvia ehtolauseiden avulla}

Suunnittele ja koodaa funktiot, jotka tuottavat seuraavanlaisia kuvia. Käytä ehtolausetta apunasi.

@bold{Kuvia ehtolauseiden avulla}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Loogiset palat A: Koodaa funktiot, jotka piirtävät oheiset loogiset palat. Isojen neliöiden sivu on 50 pikseliä,
pienten 30 pikseliä ja reiän jalkaisijaksi 8 pikseliä." @image["kuvat/loogiset_palat_A.png" #:scale 0.8])
               (list "Loogiset palat B: Koodaa funktio, joka piirtää oheiset loogiset palat. Ison kolmion korkeus on 50 pikseliä ja
pienen kolmion korkeus 30 pikseliä. Vinkki: Tarvitset Pythagoraan lausetta tai trigonometriaa kahdessakin kohdassa."
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