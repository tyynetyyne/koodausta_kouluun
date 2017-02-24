#lang scribble/manual
@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-intermediate))
@(require (for-label teachpacks/racket-turtle))
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

@title[#:tag "jatko_turtle"]{Bonus: Racket Turtle - jatko}

Racket Turtle -kirjaston avulla voi piirtää hienoja kuvioita, kun osaa käyttää tavallisia funktioita, listoja
sekä rekursiivisia funktioita tai Higher Order - funktioita. Ennen näitä tehtäviä on hyvä tutustua Racket Turtle -alkeet
tehtäviin sekä @italic[@link["http://racket.koodiaapinen.fi/manuaali/racket_turtle_esimerkkeja.html"]{Racket Turtle - esimerkkeihin}] Koodarin käsikirjassa.   

Jotta voit piirtää Racket Turtlella kuvia tarvitset @italic{teachpacks/racket-turtle}-kirjaston:
@racketblock[(require teachpacks/racket-turtle)]
Se kuuluu @italic{teachpacks}-pakettiin, joka pitää ladata palvelimelta näiden
@link["http://racket.koodiaapinen.fi/manuaali/sanasto.html#%28part._paketti%29"]{ohjeiden} mukaisesti. Paketti
tarvitsee asentaa vain ensimmäisellä kerralla.

@margin-note{WeScheme:ssä ei tarvita paketin asennusta. Huomaa myös, että WeSchemessä kirjastolla on eri nimi.}

@section[#:tag "racket_jatko_turtle_koch"]{Turtle - Koch:in käyrät}

Harjoittele listojen ja funktioiden käyttämistä piirtämällä kuvan mukaiset Koch:in käyrät. Mieti ensin mikä on toistuva
jakso ja lähde ideoimaan ohjelmaa sen kautta. Symmetrisen kuvion kanssa kannattanee kokeilla myös peilausta.

@image[#:scale 0.7 "kuvat/kochit2.png"]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen ja Racket Turtle -kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[forward] @racket[turn-left] @racket[turn-right] @racket[list])
               (list @racket[mirror-x-on]@racket[mirror-y-on] @racket[repeat] @racket[draw]))]

@section[#:tag "racket_jatko_turtle"]{Turtle - spiraalit}

Harjoittele listoja, rekursiivisia funktioita tai Higher Order - funktioita piirtämällä
Turtlella erilaisia spiraalikuvioita.

@bold{Turtle - spiraalikuviot}

@tabular[#:style 'boxed 
         #:row-properties (list 'border)
         #:column-properties '(left center)
         
         (list (list "Ohjaa Racket Turtle tekemään kuvan mukainen spiraali käyttämällä rekursiivista funktiota tai Higher Order - funktioita."
                     @image[#:scale 0.6 "kuvat/turtle_spiraali.png"])
               (list "Muokkaa edellistä koodiasi hieman, että saat aikaan tämän näköisen kuvion."
                     @image[#:scale 0.4 "kuvat/spiraali_vino.png"])
               (list "Tee rekursiivisen funktion tai Higher Order - funktion avulla lista, joka sisältää kooltaan kasvavia satunnaisen värisiä tähtiä."
                     @image[#:scale 0.5 "kuvat/tahtilista.png"])
               (list "Käytä edellä tekemäsi tähtilistaa sekä kakkoskohdan vinon spiraalin koodia ja tee niiden avulla
kuvan mukainen tähtispiraali."
                     @image[#:scale 0.4 "kuvat/tahtispiraali.png"])
               (list "Ohjaa Turtle kulkemaan satunnaiseen suuntaan satunnaisen pituisia matkoja."
                     @image[#:scale 0.4 "kuvat/randomturtle.png"]))]

Tässä harjoituksessa saatat tarvita seuraavia Racket-kielen, 2htdp/image-kirjaston ja Racket Turtle -kirjaston funktioita:

@tabular[#:style 'boxed #:sep @hspace[3]
         (list (list @racket[star] @racket[make-color] @racket[random] @racket[map]  @racket[range] @racket[forward])
               (list  @racket[turn-left] @racket[turn-right] @racket[stamper-on] @racket[pen-up] @racket[list] @racket[draw]))]
