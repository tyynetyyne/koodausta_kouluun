#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/display-read))
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


@title[#:tag "perusteet_sovelluksia_display_readin_avulla"]{Sovelluksia B (display-read)}

Funktioita, ehto- ja valintalauseita sekä käyttäjän kanssa kommunikointia voi harjoitella myös
@italic[@link["http://racket.koodiaapinen.fi/manuaali/display_read.html"]{teachpacks/display-read}]-kirjaston avulla. Se on toteutettu
@italic[@link["http://racket.koodiaapinen.fi/manuaali/2htdp_universe.html"]{2htdp/universe}]:n avulla ja tarjoaa
helpon tavan pyytää käyttäjää antamaan vastauksia valmiin tekstieditorin avulla tai tekemään valintoja annetuista
vaihtoehdoista nuolinäppäinten avulla.    

Nämä tehtävät vaativat @italic{teachpacks/display-read}-kirjaston:
@racketblock[(require teachpacks/display-read)]
Se kuuluu @italic{teachpacks}-pakettiin, joka pitää ladata palvelimelta näiden
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._paketti%29"]{ohjeiden} mukaisesti. Paketti
tarvitsee asentaa vain ensimmäisellä kerralla.

@margin-note{WeScheme:ssä ei tarvita paketin asennusta. Huomaa myös, että WeSchemessä kirjastolla on eri nimi.}

@section[#:tag "racket_perusteet_tarina"]{Tarina}

Tarina tehtävän idea on vanha aukkotarinaleikki, jossa pelaajaa pyydetään antamaan tietynlaisia sanoja tietyissä
taivutusmuodoissa ja ne sijoitetaan valmiiseen tarinaan omille paikoillensa. Koska pelaaja ei tiedä tarinaa etukäteen,
lopputulos on usein hilpeyttä herättävä. Tässä tehtävässä käytämme @racket[display-read]-funktiota sanojen kysymiseen
käyttäjältä. Sinun tehtäväsi on jatkaa mallikoodia ja keksiä tarina.

@image["kuvat/tarina_kooste.png" #:scale 0.6]

Avaa tästä tehtävätiedosto:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/or3hv3w"]{Tarina (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=T3jBzWmrcX"]{Tarina (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai display-read-kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[string-append] @racket[display-read] @racket[display-value]))]

@section[#:tag "racket_perusteet_tunnistuspeli"]{Tunnistuspeli}

Tunnistuspeli on tietokilpailupeli, jossa käyttäjälle esitetään kysymyksiä joko kuvien ja/tai tekstin muodossa. Ohjelma
tarkistaa vastauksen oikeellisuuden ehtolauseen avulla ja kertoo käyttäjälle onko hänen antamansa vastaus oikein
vai väärin.

Voit hakea kuvat netistä ja lisätä ne koodiin valikosta: @italic{Insert->Images}. Kannattaa valita pienikokoisia
kuvia tai pienentää ne esim. GIMP-ohjelmalla. 

Käytä  @racket[display-read]-funktiota vastauksen kysymiseen. Se avaa editori-ikkunan, johon käyttäjä voi kirjoittaa
vastauksensa (merkkijono). Teksti hyväksytään editorissa painamalla <enter>. Kun olet tutkinut vastauksen
oikeellisuuden, ilmoita siitä käyttäjälle @racket[display-value]:n avulla.

Voit parantaa peliäsi niin, että vastaukseksi kelpaavat myös sanan synonyymit sekä isoilla ja pienillä kirjaimilla
kirjoitetut vastaukset. Kirjoita synonyymien tarkistamiseksi oma funktionsa, joka testaa eri vastausvaihtoehdot
(@racket[or]:in avulla). Voit myös lisätä pisteidenlaskun ja loppupisteiden näyttämisen käyttäjälle. 

@image["kuvat/kysymys_omena.png" #:scale 0.5]

Avaa tästä tehtävätiedosto:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/njdxnde"]{Tunnistuspeli (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=WgS4RfHb4V"]{Tunnistuspeli (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai display-read-kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[string=?] @racket[display-read] @racket[display-value] @racket[if] @racket[cond] @racket[and])
               (list @racket[or] @racket[not] @racket[above] @racket[text] @racket[+] @racket[-]))]

@section[#:tag "racket_perusteet_valintapeli"]{Valintapeli}

Valintapeli on tietokilpailupeli, jossa käyttäjälle esitetään kysymyksiä joko kuvien ja/tai tekstin muodossa.
Pelaaja valitsee vastauksensa nuolinäppäinten avulla listasta vaihtoehtoja. Vaihtoehdot voivat olla joko
lukuja, merkkijonoja tai kuvia. Ohjelma tarkistaa vastauksen oikeellisuuden ehtolauseen avulla ja kertoo
käyttäjälle onko hänen antamansa vastaus oikein vai väärin.

Voit hakea kuvat netistä ja lisätä ne koodiin valikosta: @italic{Insert->Images}. Kannattaa valita pienikokoisia
kuvia tai pienentää ne esim. GIMP-ohjelmalla. 

Käytä  @racket[display-select]-funktiota vastauksen kysymiseen. Se avaa valintaikkunan, jossa vastausvaihtoehdot
näkyvät kysymyksen alapuolella. Vaihtoehdot annetaan listana (@racket[list]). Valinta hyväksytään painamalla <enter>.
Kun olet tutkinut vastauksen oikeellisuuden, ilmoita siitä käyttäjälle @racket[display-value]:n avulla. Koska
vaihtoehdot voivat olla joko merkkijonoja, lukuja tai kuvia, muista käyttää oikeaa vertailuoperaattoria:
merkkijonoille (string=?), luvuille (=) ja kuville (image=?).

Voit myös lisätä pisteidenlaskun ja loppupisteiden näyttämisen käyttäjälle. 

@image["kuvat/kysymys_japani.png" #:scale 0.5]@image["kuvat/kysymys2_japani.png" #:scale 0.5]

Avaa tästä tehtävätiedosto:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/pwhmob6"]{Valintapeli (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=eZuF2cxemG"]{Valintapeli (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai display-read-kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[string=?] @racket[=] @racket[image=?] @racket[display-read] @racket[display-value])
               (list @racket[if] @racket[cond] @racket[and] @racket[or] @racket[not])
               (list @racket[above] @racket[text] @racket[list] @racket[+] @racket[-]))]

@section[#:tag "racket_perusteet_laskuautomaatti"]{Laskuautomaatti}

Laskuautomaatti kysyy käyttäjältä lukuja ja suorittaa niiden perusteella laskutehtävän ja näyttää vastauksen käyttäjälle.
Jos käyttäjä ei syötä laskun kannalta järkeviä arvoja, annetaan virheilmoitus.

Voit käyttää tässä jo aikaisemmin koodaamaasi laskufunktiota (pinta-ala, taksimatkalasku, kolmion kulmien laskeminen tms.)

Käytä  @racket[display-read]-funktiota lukujen kysymiseen. Muista muuntaa saadut merkkijonot luvuiksi
@racket[string->number]-funktion avulla. Testaa lukujen järkevyys ennen niillä laskemista! Ilmoita lopputulos
käyttäjälle @racket[display-value]:n avulla. Saatat joutua miettimään myös pyöristämistä, sekä yksiköiden liittämistä
vastaukseen.

@image["kuvat/laskut_yhdistetty.png" #:scale 0.5]

Avaa tästä tehtävätiedosto:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/pqbhfud"]{Laskuautomaatti (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=3JiMZZx71S"]{Laskuautomaatti (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai display-read-kirjaston funktioita (saatat tarvita
muitakin, riippuen laskutehtävästäsi!):

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[number?] @racket[integer?] @racket[string->number] @racket[<] @racket[>] @racket[<=])
               (list @racket[>=] @racket[=] @racket[if] @racket[cond] @racket[and] @racket[or])
               (list @racket[not] @racket[display-read] @racket[display-value] @racket[+] @racket[-] @racket[*])
               (list @racket[/] @racket[round] @racket[floor] @racket[ceiling]  @racket[string-append] @racket[number->string])
               (list @racket[above] @racket[beside] @racket[text] @racket[overlay/xy] @racket[exact->inexact] @racket[abs]))]