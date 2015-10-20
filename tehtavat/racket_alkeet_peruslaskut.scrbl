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

@title[#:tag "peruslaskut_ja_laskujarjestys"]{Peruslaskut ja laskujärjestys}

Harjoitellaan kirjoittamaan Racket-kielen lausekkeita.
Racket kielessä lähes kaikki operaatiot, joita suoritetaan ovat @italic{funktioita}. Yhteenlasku on funktio, jonka nimi on @racket[+], ympyrä piirretään funktiolla, jonka nimi on @racket[circle] jne.
Racket-kielessä jokainen @italic{funktiokutsu} alkaa @litchar{(}-merkillä, sitten tulee funktion nimi esim. @racket[+] ja sen
jälkeen @italic{argumentteja} esim. @litchar{2} ja @litchar{3} ja sitten @litchar{)}-merkki. 

@racketblock[(+ 2 3)]

Kirjoita ylläoleva lauseke @italic[@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._interaktioikkuna%29"]{interaktioikkunaan}] ja paina @italic{<enter>}.
Kirjoita se sitten @italic[@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._m__rittelyikkuna%29"]{määrittelyikkunaan}] ja paina @italic{run}. 

Tutustu käsikirjan avulla muihin peruslaskutoimituksiin ja kokeile niitä interaktioikkunassa:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/]))]

Jos haluaa yhdistää useamman funktion ne pitää kirjoittaa sisäkkäin. Kirjoita seuraava lause määrittelyikkunaan ja
aja se @link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._askeltaja___stepperi%29"]{stepperin kautta:}

@racketblock[(/ (+ 2 3) (- 4 2))]

@margin-note{Huom! WeSchemessä ei ole stepperiä.}

@section[#:tag "racket_alkeet_peruslaskut_1"]{Peruslaskulausekkeet}

Harjoittele peruslaskuja ja sisäkkäisiä funktiokutsuja seuraavien tehtävien avulla. Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/nvuxjuc"]{Peruslaskut (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=282iMPmxjV"]{Peruslaskut (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tehtävätiedosto sisältää nämä laskutehtävät:

@bold{Tehtävä 1}
@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         
         (list (list "a)" @math-disp{38+45})
               (list "b)" @math-disp{53-28})
               (list "c)" @math-disp{{73} \cdot {109}})
               (list "d)" @math-disp{99:4}))]


@bold{Tehtävä 2}
@tabular[#:style 'boxed
         #:row-properties (list 'border)
         
         (list (list "a)" @math-disp{18 - 5 + 7})
               (list "b)" @math-disp{53 + 15 : 3})
               (list "c)" @math-disp{47 \cdot 8 - 16})
               (list "d)" @math-disp{20 : 5 \cdot 32}))]

@bold{Tehtävä 3}
@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         (list (list "a)" @math-disp{\frac{85-32}{12}})
               (list "b)" @math-disp{\frac{207}{4 \cdot 11}})
               (list "c)" @math-disp{(34 + 16) \cdot (60 : 3)})
               (list "d)" @math-disp{280 - 6 \cdot (3 + 7)}))]

@margin-note[@link["http://www.slideshare.net/TiinaPartanen/racket-alkeet-1-oppitunti"]{Opettajan diat.}]

@section[#:tag "racket_alkeet_peruslaskut_2"]{Lausekkeita kuvista}

Harjoitellaan kirjoittamaan Racket-kielen lausekkeita kuvista.

Lataa harjoitustiedosto tästä:

@tabular[#:sep @hspace[1]
         (list (list @image[#:scale 0.3 "drracket.png"]
                     @italic{@link["http://tinyurl.com/qaxumeb"]{Lausekkeita kuvista (DrRacket)}})
               (list @image[#:scale 0.22 "wescheme.png"]
                     @italic{@link["http://www.wescheme.org/view?publicId=T2pyQpMYvy"]{Lausekkeita kuvista (WeScheme)}}))]

@margin-note{Jos käytät WeScheme:ä ja haluat tallentaa työsi, tarvitset Google-tunnukset.
 Kirjaudu ENSIN sisään @link["http://www.wescheme.org"]{WeScheme}:en, ja tule vasta
 jälkeen avaamaan tehtävälinkki.}

Tässä harjoituksessa tarvitset seuraavia Racket-kielen funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[+] @racket[-] @racket[*]
                     @racket[/] @racket[floor]))]

Tehtävätiedosto sisältää nämä tehtävät ja kuvat:

@bold{Lausekkeet kuvista}
@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Tee Racket-lauseke, joka laskee kuinka monta mustaa neliötä
 kuvassa on." @image["kuvat/vaakaraidat.jpg" #:scale 0.7])
               (list "Tee Racket-lauseke, joka laskee kunka monta pikku neliötä
 rubiikinkuution sivuilla on."  @image["kuvat/rubikinkuutio.jpg" #:scale 0.5])
               (list "Tee Racket-lauseke, joka laskee kuinka monta merkkiä oheisessa
 koodissa on." @image["kuvat/koodi.jpg" #:scale 0.5])
               (list "Tee Racket-lauseke, joka laskee montako harmaata kuusikulmiota kuvassa
 on." @image["kuvat/mustavalkokuusikulmiot.jpg" #:scale 0.3])
               (list "Tee Racket-lauseke, joka laskee kuinka paksu musta rengas on, jos ympyrän
 halkaisija on 100cm." @image["kuvat/mustavalkoympyra.jpg" #:scale 0.6])
               (list "Tee Racket-lauseke, joka laskee montako kuvan näköistä elementtiä
 raadaan rakennettua, jos pikkulaattoja (kuusikulmiot) on käytössä 10 000."
                     @image["kuvat/kuusikulmiot2.png" #:scale 1])
               (list " Tee Racket-lauseke, joka laskee montako kuvan näköistä taulua(50cm * 50cm)
 mahtuu seinälle, jonka korkeus 2,5m ja leveys 6,0m. Tee vielä Racket-lauseke joka selvittää montako ei-valkoista kolmiota seinälle
 tuli." @image["kuvat/kolmiot.jpg" #:scale 1]))]

