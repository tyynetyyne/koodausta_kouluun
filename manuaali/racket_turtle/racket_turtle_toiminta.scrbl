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

@declare-exporting[teachpacks/racket-turtle]

@title[#:tag "racket_turtlen_toiminta"]{Racket Turtle:n toimintaperiaate}

Racket Turtle - kirjaston avulla voi piirtää perinteisiä turtle-grafiikkakuvia ohjaamalla ruudulla liikkuvaa
@italic{turtle-kilpikonnaa} (musta kolmio) menemään suoraan, kääntymään vasemmalle, nostamaan kynänsä ylös,
laskemaan sen alas jne. Tämän lisäksi kirjaston avulla on mahdollista piirtää leimoja Turtlen sijaintipisteisiin,
peilata Turtlen piirtämä kuvio x- ja/tai y-akselin suunnassa sekä ohjata Turtle kulkemaan koordinaattipisteestä toiseen.
Kuvista saa mielenkiintoisen näköisiä vaihtamalla kynän väriä, kynän paksuutta ja viivan tyyppiä, myös taustavärin sekä
taustakuvan voi asettaa mieleisikseen.

@centered[@image[#:scale 0.6 "racket_turtle/turtle1.png"]]

Turtlen ohjaaminen tapahtuu komentolistojen avulla. Kun listassa on tarvittavat komennot, lista annetaan argumenttina
piirtofunktiolle, joka lukee listan ja piirtää sen avulla kuvan. Valitsemalla erilaisen piirtofunktion, sama kuvio
voidaan piirtää eri kokoisena, eri nopeudella, tallentaa gif-animaationa tai piirtää askel-kerrallaan.

Komentolista kannattaa määritellä @racket[define]:n avulla ja antaa sille kuvaava nimi. Yksinkertaisin komentolista
sisältää yhden komennon ja sen argumentin kirjoitettuna sulkujen sisään.

Tämä komentolista piirtää yhden 100 pikselin mittaisen viivan ruudun keskeltä
suoraan ylöspäin (Turtlen lähtöpiste on keskellä ruutua pisteessä (250, 250) ja sen rintamasuunta on ylöspäin).

Komentolistan @italic{viiva} määritteleminen (määrittelyikkunassa):
@racketblock[(define viiva (list (forward 100)))]

Piirtofunktion kutsuminen (interaktioikkunassa):
@;@interaction[#:eval (bsl)(draw viiva)]

@racketblock[(draw viiva)]

@image["racket_turtle/racket_turtle_pict.png"]
             
Kaikki Racket Turtlen komennot ja piirtofunktiot on esitelty seuraavissa luvuissa.



