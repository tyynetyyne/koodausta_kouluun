#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-universe))
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

@title[#:tag "perusteet_sovellukset_universe"]{Sovelluksia A (2htdp/universe)}

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
                     @italic{@link["http://tinyurl.com/p7ysrsl"]{Piilokuva A (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=CehA07AzQE"]{Piilokuva A (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}
               
Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[check-expect] @racket[if] @racket[cond] @racket[and] @racket[or] @racket[not] @racket[place-image]))]

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
                     @italic{@link["http://tinyurl.com/qj8kocs"]{Kuva-animaatio (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=UVJRUJ2uCy"]{Kuva-animaatio (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[check-expect] @racket[if] @racket[cond] @racket[and] @racket[or] @racket[not]))]

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
                     @italic{@link["http://tinyurl.com/ox4ph7s"]{Piilokuva B (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=REtQKrquWs"]{Piilokuva B (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[check-expect] @racket[if])
               (list @racket[cond] @racket[and] @racket[or] @racket[not] @racket[mouse=?] @racket[crop] @racket[overlay/xy]))]

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
                     @italic{@link["http://tinyurl.com/ou97y3v"]{Editori (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=BbpwhqEgAd"]{Editori (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[<] @racket[>] @racket[<=] @racket[>=] @racket[=] @racket[check-expect])
               (list @racket[if] @racket[cond] @racket[and] @racket[or] @racket[not] @racket[key=?])
               (list @racket[string-length] @racket[substring] @racket[string-append] @racket[sub1] @racket[string=?] @racket[text]))]