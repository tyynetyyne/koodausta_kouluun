#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label teachpacks/display-read))
@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@declare-exporting[teachpacks/display-read]

@title[#:tag "display_read_funktiot"]{Display-Read-funktiot}

@defproc[(display-read [info merkkijono/kuva/luku]) merkkijono]{

Avaa animaatioikkunan, ja näyttää käyttäjälle annetun @racket[info]:n sekä editorikentän. Kun käyttäjä painaa <enter> palautetaan editorin 
sisältö. Jos editori jätetään tyhjäksi palautuu tyhjä merkkijono @racket[""]. 
}

Esimerkkejä:

@racketblock[(display-read "Mikä on nimesi?")]

@centered[@image[#:scale 0.7 "display_read/dr_nimi.png"]]

@racketblock[(display-read (above (text "Mikä on kuvassa?" 30 "blue")(circle 40 "solid" "red")))]

@centered[@image[#:scale 0.7 "display_read/dr_ympyrakysymys.png"]]

@defproc[(display-select [info merkkijono/kuva/luku]
                         [valinnat (list-of merkkijono/kuva/luku)])
         merkkijono/kuva/luku]{

Avaa animaatioikkunan, ja näyttää käyttäjälle annetun @racket[info]:n sekä @racket[valinnat]-listan sisällön. @racket[valinnat]-listan ensimmäinen
 alkio on automaattisesti valittuna ja käyttäjä voi muokata valintaa nuoli-ylös ja nuoli-alas näppäimillä. Kun käyttäjä painaa <enter>
 palautetaan valinta. Valitun alkion tyyppi säilyy, eli jos annettu @racket[valinnat]-lista sisältää numeroita, @racket[display-select] palauttaa
 myös numeroita. Jos valinta epäonnistuu (esim. annettu lista sisältää jotain muuta kuin merkkijonoja/kuvia/lukuja), palautetaan
 tyhjälista @racket[empty].}

Esimerkki:

@racketblock[(display-select "Mikä näistä on ympyrä?"
                             (list (square 40 "solid" "blue")
                                   (circle 20 "solid" "green")
                                   (star 30 "solid" "yellow")))]

@centered[@image[#:scale 0.7 "display_read/dr_select_image.png"]]

@racketblock[(display-select "Kuinka vanha olet?"
                             (list "0-12 vuotta"
                                   "12-16 vuotta"
                                   "yli 16 vuotta"))]

@centered[@image[#:scale 0.7 "display_read/dr_select.png"]]

@defproc[(display-value [info merkkijono/kuva/luku]
                        [arvo merkkijono/kuva/luku])
         merkkijono/kuva/luku]{

Avaa animaatioikkunan, ja näyttää käyttäjälle annetun @racket[info]:n sekä @racket[arvo]:n. Kun käyttäjä painaa <enter>
 palautetaan @racket[arvo]. Jos arvoa ei voida esittää käyttäjälle (esim. se on jotain muuta kuin merkkijono/kuva/luku) näytetään
 vain @racket[info] mutta @racket[arvo] palautetaan normaalisti.}

@racketblock[(display-value "Pistemääräsi:" 20)]

@centered[@image[#:scale 0.7 "display_read/dr_pisteet.png"]]

@racketblock[(display-value "Oikein!" #t)]

@centered[@image[#:scale 0.7 "display_read/dr_oikein.png"]]
