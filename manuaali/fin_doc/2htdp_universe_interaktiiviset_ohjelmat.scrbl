;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-universe))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)

@declare-exporting[fin-doc/fi-universe]

@title[#:tag "universe_interaktiiviset_ohjelmat" #:style 'toc]{Interaktiiviset ohjelmat}

Animaatioista on lyhyt matka interaktiivisiin ohjelmiin kuten peleihin. Animaatiossa oli käytössä yksi funktio, joka hoiti yhdenlaisia tapahtumia: 
kellon tikityksiä. Kellon lisäksi @italic{World}-ohjelma voi ottaa vastaan myös näppäimistön tai hiiren kautta tulevia tapahtumia.

Jokaista tapahtumaa varten ohjelmoijan tulee tarjota funktio, joka hoitaa kyseiset tapahtumat. @italic{Universe}-kirjastossa mahdollisia tapahtumia on
kolme: @racket[on-tick], @racket[on-key] ja @racket[on-mouse]. Lisäksi voit ilmoittaa predikaatin, joka testaa milloin ohjelma voi
sulkea itsensä.

Jokainen tapahtumia hoitava funktio saa argumenttina ohjelman tilan ja se palauttaa ohjelman uuden tilan. Tätä voidaan kuvata tilasiirtymäkaaviolla.

@image["fin_doc/tilasiirtyma.png" #:scale 0.55]

 @racket[big-bang] käynnistää interaktiivisen ohjelman asettamalla ensimmäisen tilan @racket[Tila_0].
 Tapahtumien hoitamiseen ohjelmoidut funktiot @racket[kellon-tikitys], @racket[näppäimen-painallus], ja
 @racket[hiiren-käyttö] muuntavat tilan uudeksi tilaksi. @racket[lopetus?]-predikaatin avulla tutkitaan
onko ohjelma vielä kesken vai voidaanko se lopettaa. @racket[päivitä-näyttö] piirtää ohjelman tilan kuvaksi, joka näytetään
käyttäjälle animaatioikkunassa.

 Jotta edellä kuvattu @italic{World}-ohjelma toimisi, kaikki mahdollinen tilatieto on tallennettava @index["tila"]tila-tietorakenteeseen.
Tila voi olla mitä tahansa tietotyyppiä mukaanlukien tietue ja lista.

@section[#:tag "universe_big_bang"]{big-bang}

@defform/subs[#:id big-bang
              #:literals
              (on-tick to-draw on-key on-mouse stop-when)
              (big-bang alkutila lause ...)
              ([lause
                (on-tick kellon-tikitys)
                (on-tick kellon-tikitys nopeus)
                (on-key näppäimen-painallus)
                (on-mouse hiiren-käyttö)
                (to-draw ruudun-päivitys)
                (stop-when lopetus?)
                (stop-when lopetus? viimeinen-ruutu)])]{
 Käynnistää @italic{World}-ohjelman, joka sisäinen tila on aluksi @racket[alkutila].
 Ohjelman toiminnan määräävät eri tapahtumien hoitamiseen ohjelmoidut funktiot e.g.
 kellon tikitykseen, näppäimen painallukseen, hiiren käyttöön, ruudun päivittämiseen sekä
 ohjelman lopettamiseen liittyvät funkiot. @racket[big-bang]:ssä ei saa olla useampia @racket[on-tick]
 tai @racket[stop-when] lauseita. @racket[big-bang]-lauseke palauttaa viimeisen tilan, kun
 lopetusehto toteutuu tai animaatioikkuna suljetaan punaisesta rastista. Ainoa pakollinen
 @racket[big-bang]-lause on @racket[to-draw]. }

Ufo-animaatio toteutettuna @racket[big-bang]:in avulla:

@racketblock[
(require 2htdp/image)
(require 2htdp/universe)

(define UFO (overlay/xy (ellipse 120 40 "solid" "violet")
                        30 -25
                        (circle 30 "outline" "black")))

(define (piirrä-kuva y)
  (place-image UFO 150 y (empty-scene 300 500)))

(big-bang 0 
          (to-draw piirrä-kuva)
          (on-tick add1))]

@section[#:tag "universe_big_bang_lauseet"]{big-bang lauseet}

@defform[(to-draw päivitä-näyttö)
         #:contracts
         ([päivitä-näyttö (tila -> kuva)])]{

 Kertoo mitä funktiota (@racket[päivitä-näyttö]) pitää kutsua, jotta ohjelman näyttö päivittyy.
 Näyttö päivitetään yleensä jokaisen tapahtuman (näppäimen painallus, hiiren käyttö, kellon tikitys)
 jälkeen. Kuvan koko määräytyy ensimmäisenä piirretyn kuvan mukaan.}

@margin-note{Tällaisia funktioita kutsutaan ohjelmoinnissa @italic{callback}-funktioiksi ja @racket[big-bang]:iä
 @italic{message loop}:ksi.}

@defform[(on-tick kellon-tikitys)
         #:contracts
         ([kellon-tikitys (tila -> tila)])]{

Kertoo mitä funktiota (@racket[kellon-tikitys]) pitää kutsua, jotta ohjelman tila päivittyy 
ajan kuluessa.  Funktiolle annetaan ohjelman nykyinen tila ja se palauttaa tilan,
josta tulee ohjelman uusi tila. Kello tikittää 28 kertaa sekunnissa.}

@defform/none[#:literals(on-tick)
              (on-tick kellon-tikitys nopeus)
              #:contracts
              ([kellon-tikitys (tila -> tila)]
               [nopeus positiivinen-reaaliluku])]{
Kertoo mitä funktiota (@racket[kellon-tikitys]) pitää kutsua, jotta ohjelman tila päivittyy 
ajan kuluessa. Funktiolle annetaan ohjelman nykyinen tila ja se palauttaa tilan,
josta tulee ohjelman uusi tila. Kello tikittää @racket[nopeus] kertaa sekunnissa.}

@defform[(on-key näppäimen-painallus)
         #:contracts
          ([näppäimen-painallus (tila key-event? -> tila)])]{
Kertoo mitä funktiota (@racket[näppäimen-painallus]) pitää kutsua, kun käyttäjä on painanut
jotain näppäintä. Funktiolle annetaan ohjelman nykyinen tila sekä painettua näppäintä kuvaava
  merkkijono ja se palauttaa tilan, josta tulee ohjelman uusi tila.}
                                                           
@defform[(on-mouse hiiren-käyttö)
         #:contracts
         ([hiiren-käyttö
           (tila kokonaisluku kokonaisluku mouse-event? -> tila)])]{
Kertoo mitä funktiota (@racket[hiiren-käyttö]) pitää kutsua, kun käyttäjä on käyttänyt hiirtä.
Funktiolle annetaan ohjelman nykyinen tila, hiiren @racket[x] ja @racket[y] koordinaatit
sekä hiiren tapahtuma (@racket[mouse-event?]) ja se palauttaa tilan, josta tulee ohjelman uusi tila.

Huomaa, että jos hiiren tapahtuma on @racket["leave"] tai @racket["enter"] hiiren koordinaatit
 voivat olla myös animaatioikkunan ulkopuolella eli ne voivat olla negatiivisia tai
  suurempia kuin animaatioikkunan koko.}

@defform[(stop-when lopetus?)
         #:contracts
         ([lopetus? (tila -> totuusarvo)])]

Kertoo mitä funktiota (@racket[lopetus?]) pitää kutsua, kun varmistetaan voiko ohjelman jo sulkea.
Tätä funktiota kutsutaan automaattisesti näytönpäivityksen yhteydessä. Jos funktio palauttaa
 @racket[#true], ohjelma suljetaan, erityisesti kellon tikitys lakkaa eikä näppäimen painalluksia
 tai hiiren käyttöä tapahtumia enää välitetä eteenpäin. @racket[big-bang] palauttaa nyt ohjelman
 viimeisen tilan.
}

@defform/none[#:literals (stop-when)
         (stop-when lopetus? viimeinen-näytön-päivitys)
         #:contracts
         ([lopetus? (tila -> totuusarvo)]
          [viimeinen-näytön-päivitys (tila -> kuva)])]{
Kertoo mitä funktiota (@racket[lopetus?]) pitää kutsua, kun varmistetaan voiko ohjelman jo sulkea.
Tätä funktiota kutsutaan automaattisesti näytönpäivityksen yhteydessä. Jos funktio palauttaa
 @racket[#true], kutsutaan @racket[viimeinen-näytön-päivitys]-funktiota ja ohjelma suljetaan,
 erityisesti kellon tikitys lakkaa eikä näppäimen painalluksia tai hiiren käyttöä tapahtumia
 enää välitetä eteenpäin. @racket[big-bang] palauttaa nyt ohjelman viimeisen tilan.}
                                                                   
 @section[#:tag "universe_nappaimet"]{Näppäimet}

Painettu näppäin ilmaistaan sitä kuvaavan merkkijonon avulla.

@defproc[(key-event? [x ei-tyyppivaatimusta]) totuusarvo]{
Tutkii onko @racket[x] merkkijono, joka kuvaa jotain näppäintä.
@italic{Huom! Ei toimi WeSchemessä.}
 }

@defproc[(key=? [x key-event?][y key-event?]) totuusarvo]{
 Vertailee kahta näppäintä kuvaavaa merkkijonoa ja tutkii ovatko ne samat.
 }

 Ns. "tavallisen" näppäimen painallus ilmoitetaan yhden merkin sisältävänä merkkijonona: 

 @itemize[

@item{@racket["q"] kuvaa q näppäintä}
@item{@racket["w"] kuvaa w näppäintä}
@item{@racket["E"] kuvaa Shift + e näppäintä}
@item{@racket["R"] kuvaa Shift + r näppäintä}
@item{@racket["9"] kuvaa 9 näppäintä}
]

 Jotkut "tavallisia" näppäimiä kuvaavat merkkijonot näyttävät hieman erikoisilta:
@itemize[
@item{@racket[" "] kuvaa välilyöntinäppäintä(@racket[#\space])}
@item{@racket["\r"] kuvaa return-näppäintä (@racket[#\return])}
@item{@racket["\t"] kuvaa tabulaattorinäppäintä (@racket[#\tab])}
@item{@racket["\b"] kuvaa backspace-näppäintä (@racket[#\backspace])}
@item{@racket["\u007F"] kuvaa delete-näppäintä}
]
 Merkinnästä huolimatta näiden merkkijonojen pituus on yksi:
@interaction[
(string-length "\t")
]
 
Osa näppäimistä ilmaistaan pidemmän merkkijonon avulla. Näihin kuuluvat
nuolinäppäimet sekä erikoisnäppäimet:
@itemize[
@item{@racket["left"] kuvaa nuoli-vasemmalle-näppäintä}
@item{@racket["right"] kuvaa nuoli-oikealle-näppäintä}
@item{@racket["up"] kuvaa nuoli-ylös-näppäintä}
@item{@racket["down"] kuvaa nuoli-alas-näppäintä}
@item{@racket["escape"] kuvaa Esc-näppäintä}
]
 @section[#:tag "universe_hiiri"]{Hiiren käyttö}

Hiiren käyttöa kuvataan merkkijonoilla.

@defproc[(mouse-event? [x ei-tyyppivaatimusta]) totuusarvo]{
 Tutkii onko @racket[x] merkkijono, joka kuvaa hiiren käyttöön liittyvää tapahtumaa
 eli onko se jokin seuraavista: "button-down", "button-up", "drag", "move", "enter" tai "leave".
 }

@defproc[(mouse=? [x mouse-event?][y mouse-event?]) totuusarvo]{
Tutkii ovatko kaksi hiiren käyttöä kuvaavaa merkkijonoa samat.}

@itemize[

@item{@racket["button-down"]
 kuvaa sitä, että käyttäjä on painanut hiiren näppäintä}
@item{@racket["button-up"]
kuvaa sitä, että käyttäjä on vapauttanut hiiren näppäimen}
@item{@racket["drag"]
kuvaa sitä, että käyttäjä on hinannut hiirellä e.g. siirtänyt hiirtä näppäin painettuna.}
@item{@racket["move"]
kuvaa sitä, että käyttäjä on siirtänyt hiirtä}
@item{@racket["enter"]
käyttäjä on siirtänyt hiiren ohjelman käyttämälle alueelle}
@item{@racket["leave"]
käyttäjä on siirtänyt hiiren ohjelman käyttämän alueen ulkopuolelle}
]
                                               
@section[#:tag "yksinkertainen_world_esimerkki"]{Yksinkertainen esimerkki}

Yksikertaisessa interaktiivisessa ufoanimaatiossa, ufon tilaa mallinnetaan kokonaisluvulla, joka kuvaa ufon sijaintia y-akselin
suunnassa. Lähtötila on 0, jolloin ufo sijoitetaan kuvan yläreunaan (origo on ruudun vasemmassa yläreunassa ja y-akseli kasvaa alaspäin).
Jokaisella kellon tikityksellä ufon y-koordinaatti kasvaa ja ufo laskeutuu alaspäin. Esimerkissä ufo hyppää ylöspäin kun
painetaan @italic{nuoli-ylös}-näppäintä. Animaatio päättyy kun ufo on maassa.

@image[#:scale 0.55 "fin_doc/ufot.png"]

@racketblock[
(require 2htdp/image)
(require 2htdp/universe)

(define KORKEUS 500)
(define LEVEYS 300)
(define TAUSTA (empty-scene LEVEYS KORKEUS))
(define UFO (overlay/xy (ellipse 120 40 "solid" "violet")
                        30 -25
                        (circle 30 "outline" "black")))

(define (piirrä-kuva y)
  (place-image UFO 150 y TAUSTA))

(define (siirrä y)
  (+ y 5))

(define (hoida-näppäin y näppäin)
  (cond [(key=? näppäin "up")
         (- y 50)]
        [else
         y]))

(define (valmis? y)
  (> y (- KORKEUS 40)))

(big-bang 0 
          (to-draw piirrä-kuva)
          (on-tick siirrä)
          (on-key hoida-näppäin)
          (stop-when valmis?))]
@link["http://www.wescheme.org/run?publicId=oVNMa4EFpx"]{Kokeile koodia @image["fin_doc/ufo2.png"]}