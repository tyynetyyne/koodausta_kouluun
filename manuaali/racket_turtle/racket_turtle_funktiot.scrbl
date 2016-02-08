#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/racket-turtle))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@declare-exporting[teachpacks/racket-turtle]

@title[#:tag "racket_turtle_funktiot"]{Piirtofunktiot}


@defproc[(draw [komentolista lista<funktio>]) kuva]{

Suorittaa annetun @racket[komentolista]:n mukaiset komennot ja palauttaa näin saadun kuvan. Avaa animaatioikkunan,
jossa Turtlen liikkeitä ja kuvan kehittymistä voi seurata.

}

@defproc[(draw-custom [komentolista lista<funktio>]
                      [leveys positiivinen-reaaliluku]
                      [korkeus positiivinen-reaaliluku]
                      [nopeus positiivinen-reaaliluku]) kuva]{

Asettaa kuvan kooksi annetut mitat @racket[leveys] ja @racket[korkeus] sekä asettaa animaation piirtonopeuden
arvoksi (@racket[nopeus].
Jos @racket[nopeus] asetetaan arvoksi @racket[0], käytetään normaalinopeutta (ei muuteta nopeutta).
Kuvan koko on normaalisti @racket[500] kertaa @racket[500] pikseliä.

}

@defproc[(draw-step-by-step [komentolista lista<funktio>]) kuva]{

Kuin @racket[draw] mutta @racket[komentolista]:n mukaiset komennot suoritetaan vaihevaiheelta sitä mukaa kun
käyttäjä painaa välilyöntiä. 

}

@defproc[(draw-step-by-step-custom [komentolista lista<funktio>]
                                   [leveys positiivinen-reaaliluku]
                                   [korkeus positiivinen-reaaliluku]
                                   [nopeus positiivinen-reaaliluku]) kuva]{

Kuin @racket[draw-custom] mutta @racket[komentolista]:n mukaiset komennot suoritetaan vaihevaiheelta sitä mukaa kun
käyttäjä painaa välilyöntiä. 

}

@defproc[(draw-and-store [komentolista lista<funktio>]) kuva]{

Kuin @racket[draw] mutta tallentaa animaation @italic{animoituna gif}:inä hakemistoon @bold{turtle_animations}. Hakemiston
tulee sijaita samassa paikassa kuin @italic{.rkt} tiedosto. Jos hakemistoa ei löydy, tiedostoa ei luoda.
Huomaa, että tiedoston luominen kestää jonkin aikaa, älä sulje animaatioikkunaa ennen kuin @italic{Creating animated gif.}
poistuu näkyvistä ja ruutuun palaa animaation lopputilan kuva.

@italic{Huom!} tämä ei toimi WeScheme ympäristössä.

}

@defproc[(draw-and-store-custom [komentolista lista<funktio>]
                                [leveys positiivinen-reaaliluku]
                                [korkeus positiivinen-reaaliluku]
                                [nopeus positiivinen-reaaliluku]) kuva]{

Kuin @racket[draw-custom] mutta tallentaa animaation @italic{animoituna gif}:inä.

@italic{Huom!} tämä ei toimi WeScheme ympäristössä.
}