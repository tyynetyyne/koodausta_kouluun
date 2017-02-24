#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-universe))
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

@title[#:tag "perusteet_sovellukset_universe"]{Sovelluksia (2htdp/universe)}

Tähän asti olemme tehneet pieniä ohjelman osia, funktioita, joita on voinut kutsua vain DrRacket:in tai WeScheme:in sisällä.
Nyt teemme ensimmäiset yksinkertaiset ohjelmat, jotka kommunikoivat käyttäjän kanssa graafisen käyttöliittymän avulla. Samalla
syvennämme osaamistamme funktioiden sekä ehto- ja valintalauseiden käytössä.

Näitä käyttäjän kanssa kommunikoiva ohjelmia kutsutaan @italic{interaktiivisiksi} ohjelmiksi. Interaktiivisen ohjelmalle
käyttäjä voi antaa syötteitä näppäimistön tai hiiren avulla. Myös tietokoneen sisäinen kello voi näissä ohjelmissa antaa
syötteitä, esim. kun peleissä ja animaatioissa tapahtuu asioita automaattisesti, se on saatu aikaan sisäisen kellon avulla.

Interaktiiviset ohjelmat tarvitsevat toimiakseen "moottorin", joka hoitaa tarvittavan
viestiliikenteen käyttäjän toiminnasta sekä kellon tikityksestä meidän omille funktioillemme ja hoitaa myös näytön
päivittämisen tarvittaessa. Tämän osion käyttämän "moottorin" nimi on @italic{big-bang}, ja se löytyy 
@italic[@link["http://racket.koodiaapinen.fi/manuaali/2htdp_universe.html"]{2htdp/universe}]-kirjastosta.

@italic{big-bang}:in avulla voit tehdä animaatioita sekä hiireen tai näppäimistöön reagoivia ohjelmia. Näissä
harjoituksissa sinulle annetaan valmis koodipohja, joissa tarvittava @italic{big-bang}-koodi on valmiina. Sinun ei
tarvitse tarkemmin tietää miten @italic{big-bang} toimii, riittää että muokkaat kussakin ohjelmassa piirtofunktiota
tekemään ehto- tai valintalauseiden avulla jotain erilaista riippuen joko kellon tai käyttäjän toimista. Halutessasi
voit toki tutustua Koodarin käsikirjan avulla
@italic[@link["http://racket.koodiaapinen.fi/manuaali/universe_interaktiiviset_ohjelmat.html"]{big-bang}]:in toimintaan
myös pintaa syvemmältä.

Nämä tehtävät vaativat @italic{2htdp/universe}-kirjaston:
@racketblock[(require 2htdp/universe)]

@section[#:tag "racket_perusteet_piilokuva_A"]{Piilokuva A}

Piilokuva A tehtävässä ohjelma reagoi siihen missä kohtaa ruutua hiiri on. Hiiren sijainti saadaan x ja y koordinaattien
avulla. Tutustu oheiseen esimerkkikoodiin ja muokkaa sitä ehto- tai valintalauseen avulla sellaiseksi, että hiirtä
liikuttamalla syntyy tällainen Suomen lipun kuva:

@image["kuvat/piilokuvaA.png" #:scale 0.5]

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/valintalause/piilokuva_A.rkt"]{Piilokuva A (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/piilokuva_A.html"]{Piilokuva A (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}
               
Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[if] @racket[cond] @racket[and]
                     @racket[or] @racket[not] @racket[place-image] @racket[check-expect]))]

@section[#:tag "racket_perusteet_ufo_animaatio"]{Ufo-animaatio}

Muokkaa valmista pohjaa ja kokeile saatko ufon laskeutumaan ruudun yläreunasta ruudun alareunaan ja pysähtymään siihen. Kokeile saatko ufon
kulkemaan nopeammin, entäpä nousemaan ylöspäin tai kulkemaan sivusuunnassa? Entäpä rullaamaan ruudulla?

@image["kuvat/ufot.png" #:scale 0.5]

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/valintalause/ufo_laskeutuu.rkt"]{Ufo-animaatio (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/ufo_laskeutuu.html"]{Ufo-animaatio (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[if] @racket[cond] @racket[and]
                     @racket[or] @racket[not] @racket[check-expect]))]


@section[#:tag "racket_perusteet_kuva_animaatio"]{Kuva-animaatio}

Kuva-animaatio tehtävässä ohjelma reagoi tietokoneen sisäisen kellon tikitykseen. Kello tikittää 28 kertaa sekunnissa, ja
se tarkoittaa sitä, että esimerkkikoodin @racket[animate]-funktio kutsuu sinun tekemääsi @italic{oma-kuva} funktiota arvoilla:
0, 1, 2, 3, 4, 5, 6, 7 jne. niin kauan kunnes suljet animaatioikkunan. Toisin sanoen aikamuuttuja (t) kasvaa koko ajan yhdellä.
Tutustu oheiseen esimerkkikoodiin ja muokkaa sitä valintalauseen avulla sellaiseksi, että saat ympyrän suurenemaan
ja pienenemään automaattisesti. Voit myös vaihtaa ympyrän tilalle jonkun muun kuvafunktion!

@italic{Vinkki:} Jos haluat animaation pyörivän ikuisesti samaa rataa tutustu @racket[modulo]:n toimintaan ja rajoita sen
avulla aikamuuttuja (t) pysymään tietyllä alueella.

@image["kuvat/animaatio_kuvat.png" #:scale 0.7]

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/valintalause/kuva-animaatio.rkt"]{Kuva-animaatio (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/kuva-animaatio.html"]{Kuva-animaatio (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[if]
                     @racket[cond] @racket[and] @racket[or] @racket[not] @racket[check-expect]))]

@section[#:tag "racket_perusteet_piilokuvaB"]{Piilokuva B}

Piilokuva B tehtävässä ohjelma reagoi siihen missä kohtaa ruutua käyttäjä klikkaa hiirellä. Hiiren sijainti saadaan x ja y
koordinaattien avulla, lisäksi saat käyttöösi tiedon siitä mikä hiiritapahtuma oli kyseessä.
Hiiritapahtumiin voit tutustua @italic[@link["http://racket.koodiaapinen.fi/manuaali/universe_hiiri.html"]{käsikirjan}] avulla.
Tutustu oheiseen esimerkkikoodiin ja muokkaa sitä ehto- tai valintalauseen avulla sellaiseksi, että hiirtä klikkaamalla
paljastuu alla olevan esimerkin mukaisesti jokin itse valitsemasi piilokuva. Kuvan saat tuotua valitsemalla valikosta
@italic{Insert->Image}.

@margin-note{WeSchemessä kuva tuodaan @italic{Images}-napin avulla. Koodiin ei silloin ilmesty kuvaa kuten DrRacket:issä
 vaan url-linkki kuvaan. Itse kuva tallentuu Google-driveen.}

@image["kuvat/yhdistetty_paprika.png" #:scale 0.85]

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/valintalause/piilokuva_B.rkt"]{Piilokuva B (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/piilokuva_B.html "]{Piilokuva B (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[if] @racket[cond])
               (list @racket[and] @racket[or] @racket[not] @racket[mouse=?] @racket[crop] @racket[overlay/xy]@racket[check-expect]))]

@section[#:tag "racket_perusteet_editori"]{Editori}

Editori tehtävässä ohjelma reagoi siihen mitä näppäintä käyttäjä painaa. Saat käyttöösi tiedon siitä mitä
näppäintä käyttäjä on painanut. Voit tutustua tarkemmin näppäinten käyttöön
@italic[@link["http://racket.koodiaapinen.fi/manuaali/universe_nappaimet.html"]{käsikirjan}] avulla.
Tutustu oheiseen esimerkkikoodiin ja muokkaa sitä ehto- tai valintalauseen avulla sellaiseksi, että ruudulle ilmestyy
tekstiä sitä mukaa kun käyttäjä painaa näppäimiä. Tekstiä pitäisi myös pystyä poistamaan @italic{backspace}-näppäimen
avulla.

@image["kuvat/editori.png" #:scale 0.85]

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/valintalause/editori.rkt"]{Editori (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/editori.html"]{Editori (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[string=?])
               (list @racket[if] @racket[cond] @racket[and] @racket[or] @racket[not] @racket[key=?])
               (list @racket[string-length] @racket[substring] @racket[string-append] @racket[sub1]  @racket[text]@racket[check-expect]))]

@section[#:tag "racket_perusteet_myyrapeli"]{Myyrä - peli}

Muokkaa valmista pohjaa ja tee loppuun Myyrä - peli. Myyrä - pelissä yritetään ottaa kiinni (klikata hiirellä) myyrää, joka siirtyy
ruudulla paikasta toiseen satunnaisesti. Aluksi myyrä pitää saada siirtymään tasaisin väliajoin uuteen sijaintiin. Sitten pitää ohjelmoida funktiot,
joiden perusteella voidaan päätellä osuiko hiiri myyrään. Lopuksi voit vaikeuttaa peliä nopeuttamalla myyrää ja pienentämällä sen kokoa.
Saatat tarvita Pythagoraan lausetta tässä tehtävässä.

@image["kuvat/myyrapeli1.png" #:scale 0.5]

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/perusteet/valintalause/myyra_peli.rkt"]{Myyrä-peli (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/myyra_peli.html"]{Myyrä-peli (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen ja 2htdp-kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[+]  @racket[image-width] @racket[image-height])
               (list @racket[-] @racket[random] @racket[*] @racket[/] @racket[sqr] @racket[sqrt]
                     @racket[scale] @racket[check-expect]))]
