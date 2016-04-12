#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/math-utils))
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


@title[#:tag "jatko_sovellukset_display_read"]{Sovelluksia (display-read)}

Funktioita, ehto- ja valintalauseita, rekursiivisia funktioita, listojen käyttämistä sekä käyttäjän kanssa
kommunikointia voi harjoitella myös @italic[@link["http://racket.koodiaapinen.fi/manuaali/display_read.html"]{teachpacks/display-read}]-kirjaston avulla.
Se on toteutettu @italic[@link["http://racket.koodiaapinen.fi/manuaali/2htdp_universe.html"]{2htdp/universe}]:n avulla ja tarjoaa
helpon tavan pyytää käyttäjää antamaan vastauksia valmiin tekstieditorin avulla tai tekemään valintoja annetuista
vaihtoehdoista nuolinäppäinten avulla.    

Nämä tehtävät vaativat @italic{teachpacks/display-read}-kirjaston:
@racketblock[(require teachpacks/display-read)]
Se kuuluu @italic{teachpacks}-pakettiin, joka pitää ladata palvelimelta näiden
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._paketti%29"]{ohjeiden} mukaisesti. Paketti
tarvitsee asentaa vain ensimmäisellä kerralla.

@margin-note{WeScheme:ssä ei tarvita paketin asennusta. Huomaa myös, että WeSchemessä kirjastolla on eri nimi.}

@section[#:tag "racket_jatko_tarina"]{Tarina}

Tarinatehtävän idea on vanha aukkotarinaleikki, jossa pelaajaa pyydetään antamaan tietynlaisia sanoja tietyissä
taivutusmuodoissa ja ne sijoitetaan valmiiseen tarinaan omille paikoillensa. Koska pelaaja ei tiedä tarinaa etukäteen,
lopputulos on usein hilpeyttä herättävä. Tässä tehtävässä käytämme @racket[display-read]-funktiota sanojen kysymiseen
käyttäjältä. Sinun tehtäväsi on jatkaa mallikoodia ja keksiä tarina. Tämän harjoituksen avulla on helppo tutustua
display-read - kirjaston funktioihin. Voit halutessasi laittaa koodin pyörimään silmukassa, eli lisätä siihen rekursiivisen
kutsun, jolloin sanat kysytään yhä uudelleen ja uudelleen. 

@image["kuvat/tarina_kooste.png" #:scale 0.6]

Avaa tästä tehtävätiedosto:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/jatko/rekursio/tarina.rkt"]{Tarina (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/tarina.html"]{Tarina (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai display-read-kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[string-append] @racket[display-read] @racket[display-value]))]

@section[#:tag "racket_jatko_lahtolaskenta"]{Lähtölaskenta}

Tee ohjelma, joka laskee kymmenestä nollaan (10, 9, 8, ..., 0) ja ilmoittaa laskurin arvon
käyttäjälle display-read -kirjaston avulla (tutustu siihen @link["http://racket.koodiaapinen.fi/manuaali/display_read.html"]{Koodarin käsikirjan} avulla).

@image["kuvat/laskurikuva.png" #:scale 0.5]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai display-read-kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[sub1] @racket[if] @racket[display-info-timer]))]

@section[#:tag "racket_jatko_laskuautomaatti"]{Laskuautomaatti}

Laskuautomaatti kysyy käyttäjältä lukuja ja suorittaa niiden perusteella laskutehtävän ja näyttää vastauksen
käyttäjälle. Jos käyttäjä ei syötä laskun kannalta järkeviä arvoja, annetaan virheilmoitus.

Voit käyttää tässä jo aikaisemmin koodaamaasi laskufunktiota (pinta-ala, taksimatkalasku, kolmion kulmien laskeminen tms.)

Käytä  @racket[display-read-number]-funktiota lukujen kysymiseen ja @racket[display-read] funktiota merkkijonojen kysymiseen.
Testaa lukujen järkevyys ennen niillä laskemista! Ilmoita lopputulos käyttäjälle @racket[display-value]:n tai
@racket[display-info]:n avulla. Saatat joutua miettimään myös pyöristämistä, sekä yksiköiden liittämistä
vastaukseen. Jotta saat automaattilaskurin toimimaan useamman kuin yhden kerran, tee funktiostasi rekursiivinen.
Tallenna siinä tapauksessa käyttäjänä antamat tiedot lokaaleihin muuttujiin (@racket[let]).

@image["kuvat/laskut_yhdistetty.png" #:scale 0.5]

Avaa tästä tehtävätiedosto:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/jatko/rekursio/laskuautomaatti.rkt"]{Laskuautomaatti(DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/laskuautomaatti.html"]{Laskuautomaatti (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen, display-read tai math-utils -kirjaston funktioita
(saatat tarvita muitakin, riippuen laskutehtävästäsi!):

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[display-read-number] @racket[string->number] @racket[+]  @racket[-]  @racket[*]   )
               (list @racket[display-value] @racket[number->string] @racket[/]  @racket[<] @racket[>]  )
               (list @racket[check-expect]  @racket[number?] @racket[<=] @racket[>=] @racket[=] )
               (list @racket[check-within]  @racket[integer?] @racket[abs] @racket[if] @racket[cond] ) 
               (list @racket[round-to-decimal] @racket[exact->inexact]  @racket[or] @racket[and] @racket[not]  )
               (list @racket[round-to-integer]  @racket[string-append]   @racket[add1]   @racket[sub1] @racket[let]  )
               (list @racket[quantity->image] @racket[overlay/xy]  @racket[above] @racket[beside] @racket[text]))]

@section[#:tag "racket_jatko_kertotaulupeli"]{Kertotaulupeli}

Kertotaulupeli arpoo kaksi lukua väliltä 1-10 ja kysyy käyttäjältä mikä on niiden kertolaskun tulos.
Jos vastaus on oikein, ohjelma kertoo siitä käyttäjälle ja lisää pisteitä. Voit rajoittaa peli kierrokset
joko 10 pisteeseen tai 10 laskuun. 

Käytä  @racket[display-read-number]-funktiota lukujen kysymiseen. Testaa lukujen järkevyys ennen niiden käyttämistä!
Ilmoita lopputulos käyttäjälle @racket[display-value]:n tai @racket[display-info]:n avulla. Arvotut ja käyttäjän
antamat luvut kannattanee tallentaa silmukkafunktion lokaaleihin muuttujiin (@racket[let]). Katso mallia
rekursiivisesta funktiosta automaatilaskurin tehtävätiedostosta. Voit tehdä myös jakolaskupelin jne.

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen, display-read -kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[display-read-number] @racket[string->number] @racket[+]  @racket[-]  @racket[*]   )
               (list @racket[display-value] @racket[number->string] @racket[random]  @racket[<] @racket[>]  )
               (list @racket[check-expect] @racket[number?] @racket[<=] @racket[>=] @racket[=] )
               (list @racket[integer?] @racket[if] @racket[cond] @racket[or] @racket[and]) 
               (list @racket[string-append] @racket[not] @racket[add1] @racket[sub1] @racket[let]))]

@section[#:tag "racket_jatko_arvaa_numero"]{Arvaa numero - peli}

Tietokone arpoo numeron, ja pyytää käyttäjää arvaamaan mikä se on. Käyttäjälle kerrotaan miltä väliltä numero on,
ja jokaisen arvauksen jälkeen annetaan vihje siitä onko arvaus liian pieni vai liian suuri. Kun oikea arvaus on löytynyt
kerrotaan montako kierrosta arvaamiseen meni. 

Käytä  @racket[display-read-number]-funktiota arvausten kysymiseen. Testaa saadun arvon järkevyys ennen sen
käyttämistä! Ilmoita vihje käyttäjälle @racket[display-value]:n tai @racket[display-info]:n avulla.
Käyttäjän arvaus kannattanee tallentaa silmukkafunktion lokaaliin muuttujaan (@racket[let]). Katso mallia
rekursiivisesta funktiosta automaatilaskurin tehtävätiedostosta.

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai display-read -kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[display-read-number] @racket[string->number] @racket[+]  @racket[-]  @racket[*]   )
               (list @racket[display-value] @racket[number->string] @racket[random]  @racket[<] @racket[>]  )
               (list @racket[check-expect] @racket[number?] @racket[<=] @racket[>=] @racket[=] )
               (list @racket[integer?] @racket[if] @racket[cond] @racket[or] @racket[and]) 
               (list @racket[string-append] @racket[not] @racket[add1] @racket[sub1] @racket[let]))]

@section[#:tag "racket_jatko_tunnistuspeli"]{Tunnistuspeli}

Tunnistuspeli on tietokilpailupeli, jossa käyttäjälle esitetään kysymyksiä joko kuvien ja/tai tekstin muodossa. Ohjelma
tarkistaa vastauksen oikeellisuuden ehtolauseen avulla ja kertoo käyttäjälle onko hänen antamansa vastaus oikein
vai väärin.

Voit hakea kuvat netistä ja lisätä ne koodiin valikosta: @italic{Insert->Images}. Kannattaa valita pienikokoisia
kuvia tai pienentää ne esim. GIMP-ohjelmalla. 

Käytä  @racket[display-read]-funktiota vastauksen kysymiseen. Se avaa editori-ikkunan, johon käyttäjä voi kirjoittaa
vastauksensa (merkkijono). Teksti hyväksytään editorissa painamalla <enter>. Kun olet tutkinut vastauksen
oikeellisuuden, ilmoita siitä käyttäjälle @racket[display-value]:n tai
@racket[display-info]:n avulla.

Muodosta kysymyksistä ja oikeista vastauksista lista, jota rekursiivinen funktiosi lukee kysymys- ja vastauspari kerrallaan.
Pelaajan saamat pisteet pysyvät tallessa funktiosi parametrissä. 

Voit parantaa peliäsi niin, että vastaukseksi kelpaavat myös sanan synonyymit sekä isoilla ja pienillä kirjaimilla
kirjoitetut vastaukset.  

@image["kuvat/kysymys_omena.png" #:scale 0.5]

Avaa tästä tehtävätiedosto:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/jatko/listat/tunnistuspeli.rkt"]{Tunnistuspeli (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/tunnistuspeli.html"]{Tunnistuspeli (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai display-read-kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[display-value]@racket[string=?] @racket[if] @racket[cond]  @racket[and])
               (list @racket[display-info] @racket[member?] @racket[or] @racket[not] @racket[above]  )
               (list @racket[display-read] @racket[text] @racket[+] @racket[add1] @racket[sub1])
               (list @racket[begin] @racket[list] @racket[first] @racket[rest] @racket[empty?]))]

@section[#:tag "racket_jatko_valintapeli"]{Valintapeli}

Valintapeli on tietokilpailupeli, jossa käyttäjälle esitetään kysymyksiä joko kuvien ja/tai tekstin muodossa.
Pelaaja valitsee vastauksensa nuolinäppäinten avulla listasta vaihtoehtoja. Vaihtoehdot voivat olla joko
lukuja, merkkijonoja tai kuvia. Ohjelma tarkistaa vastauksen oikeellisuuden ehtolauseen avulla ja kertoo
käyttäjälle onko hänen antamansa vastaus oikein vai väärin.

Voit hakea kuvat netistä ja lisätä ne koodiin valikosta: @italic{Insert->Images}. Kannattaa valita pienikokoisia
kuvia tai pienentää ne esim. GIMP-ohjelmalla. 

Käytä  @racket[display-select]-funktiota vastauksen kysymiseen. Se avaa valintaikkunan, jossa vastausvaihtoehdot
näkyvät kysymyksen alapuolella. Vaihtoehdot annetaan listana (@racket[list]). Valinta hyväksytään painamalla <enter>.
Kun olet tutkinut vastauksen oikeellisuuden, ilmoita siitä käyttäjälle @racket[display-value]:n tai
@racket[display-info]:n avulla. Koska vaihtoehdot voivat olla joko merkkijonoja, lukuja tai kuvia, muista käyttää
oikeaa vertailuoperaattoria: merkkijonoille (string=?), luvuille (=) ja kuville (image=?).

Muodosta kysymyksistä, vaihtoehdoista sekä oikeista vastauksista lista, jota rekursiivinen funktiosi lukee kysymys- ja vastauspari kerrallaan.
Pelaajan saamat pisteet pysyvät tallessa funktiosi parametrissä. 

@image["kuvat/kysymys_japani.png" #:scale 0.5]@image["kuvat/kysymys2_japani.png" #:scale 0.5]

Avaa tästä tehtävätiedosto:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/jatko/listat/valintapeli.rkt"]{Valintapeli (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://racket.koodiaapinen.fi/tehtavat/tiedostot/wescheme/valintapeli.html"]{Valintapeli (WeScheme)}}))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen tai display-read-kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[display-read] @racket[string=?] @racket[=] @racket[image=?] @racket[if])
               (list @racket[display-value]  @racket[cond] @racket[and] @racket[or] @racket[not])
               (list @racket[above] @racket[text] @racket[list] @racket[+] @racket[-])
               (list @racket[begin] @racket[list] @racket[first] @racket[rest] @racket[empty?]))]

