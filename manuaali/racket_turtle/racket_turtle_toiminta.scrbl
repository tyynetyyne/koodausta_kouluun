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

@(begin
   (require scribble/manual scribble/eval fin-doc/sl-eval)
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require 2htdp/image)
        (require teachpacks/racket-turtle)
        (define c1 (circle 10 "solid" "green"))
        
        (define zero 0)
        
        (define one (list 1))
        
        (define q (make-posn "bye" 2))
        (define p (make-posn 2 -3))
        
        (define a (list (list 'a 22) (list 'b 8) (list 'c 70)))
        (define v (list 1 2 3 4 5 6 7 8 9 'A))
        (define w (list (list (list (list "bye") 3) #true) 42))
        (define z (list (list (list (list 'a 'b) 2 3) ) (list #false #true) "world"))
        (define y (list (list (list 1 2 3) #false "world")))
        (define x (list 2 "hello" #true))
        (define z (list 2 "hello" #true "hello"))
        (define viiva (list (forward 100)))
        ))
     (set! bsl (lambda () *bsl))
     *bsl))

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
@interaction[#:eval (bsl)(draw viiva)]
                    
Kaikki Racket Turtlen komennot ja piirtofunktiot on esitelty seuraavissa luvuissa.



