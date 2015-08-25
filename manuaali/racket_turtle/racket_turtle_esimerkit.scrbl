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

@title[#:tag "racket_turtle_esimerkkeja"]{Racket Turtle esimerkkejä}

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
        (define neliö
               (list (forward 100)
                     (turn-left 90)
                     (forward 100)
                     (turn-left 90)
                     (forward 100)
                     (turn-left 90)
                     (forward 100)))
        (define sivu
          (list (forward 100)
                (turn-left 90)))             
        (define toisto-neliö
          (repeat 4 sivu))
        (define siirry
               (list (pen-up)
                     (turn-right 90)
                     (forward 100) 
                     (pen-down) 
                     (change-color "red")))
        (define kaksi-neliötä 
          (list neliö 
                siirry 
                neliö))
        (define (muuttuva-sivu x) 
          (list (forward x) 
                (turn-left 90)))
        (define (muuttuva-neliö x) 
          (repeat 4 (muuttuva-sivu x)))
       (define koordinaatti-neliö
         (list (set-origin)
               (go-to 100 0)
               (go-to 100 100)
               (go-to 0 100)
               (go-to 0 0)))
       (define peilaus-neliö
         (list (mirror-x-on) (mirror-y-on)
               neliö))
       (define LEIMASIN (circle 5 "solid" "red"))
       (define leimasin-neliö
         (list (stamper-on LEIMASIN)
               (pen-up)
               neliö))
       (define suora-koordinaatistossa 
         (list (set-bg-grid 20 20 "pink")
               (pen-up)
               (go-to 0 0)
               (stamper-on (circle 5 "solid" "blue"))
               (pen-down)
               (go-to 40 40)
               (go-to 80 80)
               (go-to 120 120)
               (go-to 160 160)
               (stamper-off)
               (go-to 500 500)))
       (define LEIMASIMET 
         (list (circle 10 "solid" "red")
               (star 10 "solid" "blue")
               (circle 10 "solid" "green")
               (star 10 "solid" "yellow")
               (circle 10 "solid" "black")))
         (define suora-leimasimilla
           (list (pen-up)
                 (go-to-origin)
                 (turn-right 45)
                 (stamper-on LEIMASIMET)
                 (repeat 8 (forward 50))))
         (define erikoinen-kynä-neliö
           (list (change-pen-size 5)
                 (change-pen-style "dot") 
                 neliö))
         (define neliö-taustakuvan-päällä
           (list (change-bg-color "black")
                 (set-bg-image (circle 100 "solid" "gold"))
                 neliö))
         (define SATEENKAARI (list "red" "blue" "green" "yellow" "purple"))
         (define sateenkaari-viiva
           (list (pen-up)
                 (go-to 0 0)
                 (turn-right 45)
                 (pen-down)
                 (change-color SATEENKAARI)
                 (change-pen-size 10)
                 (hide-turtle)
                 (repeat 8 (forward 40))
                 (show-turtle)
                 (repeat 8 (forward 40))))
         ))
     (set! bsl (lambda () *bsl))
     *bsl))

@section[#:tag "racket_turtle_nelio"]{Perusneliön piirtäminen}

Jotta neliö voidaan piirtää, pitää ensin määritellä (@racket[define]) lista, jossa tarvittavat komennot ovat,
annamme listalle nimen @italic{neliö}.
Varsinainen piirtäminen suoritetaan @racket[draw] funktion avulla, sille annetaan argumentiksi edellä määritelty
komentolista.

@racketblock[(define neliö
               (list (forward 100)
                     (turn-left 90)
                     (forward 100)
                     (turn-left 90)
                     (forward 100)
                     (turn-left 90)
                     (forward 100)))]

@interaction[#:eval (bsl)
             (draw neliö)]

@section[#:tag "racket_turtle_nelio_toistorakenteen_avulla"]{Neliön piirtäminen toistorakenteen avulla}

Koska neliössä toistuu sama komentosarja monta kertaa, olisi parempi ensin määritellä tämä toistuva jakso.
Annamme sille nimen @italic{sivu} ja toistetaan sitä 4 kertaa @racket[repeat]:in avulla.

@racketblock[(define sivu
               (list (forward 100)
                     (turn-left 90)))]
@racketblock[(define toisto-neliö
               (repeat 4 sivu))]

@interaction[#:eval (bsl)
             (draw toisto-neliö)]

@section[#:tag "racket_turtle_kaksi_neliota"]{Kahden neliön piirtäminen samaan kuvaan}

Voimme yhdistää kaksi aikaisemmin määriteltyä kuviota samaan kuvaan. Määrittelemme uuden listan käskyjä @italic{siirry},
jonka avulla Turtle siirtyy uuteen kohtaan ruudulla ja vaihtaa kynän värin punaiseen.

@racketblock[(define siirry
               (list (pen-up)
                     (turn-right 90)
                     (forward 100) 
                     (pen-down) 
                     (change-color "red")))]

@racketblock[(define kaksi-neliötä 
               (list neliö 
                     siirry 
                     neliö))]

@interaction[#:eval (bsl) 
             (draw kaksi-neliötä)]

@section[#:tag "racket_turtle_nelio_funktion_avulla"]{Neliön piirtäminen funktion avulla}

Jotta voimme muutella neliön sivun pituutta, pitää määritellä @italic{funktio}, jonka nimeksi annamme @italic{muuttuva-neliö}.
Tarvitsemme myös apufunktion, joka tuottaa muuttuvan pituisia sivuja, ja sen nimeksi annamme @italic{muuttuva-sivu}.
Muuttuja @racket{x} kuvaa siis sivun pituutta. Lopuksi kutsumme määriteltyä funktiota @italic{muuttuava-neliö} argumentilla 30 (@italic{x=30}).

@racketblock[(define (muuttuva-sivu x) 
               (list (forward x) 
                     (turn-left 90)))]

@racketblock[(define (muuttuva-neliö x) 
               (repeat 4 (muuttuva-sivu x)))]
             
@interaction[#:eval (bsl)
             (draw (muuttuva-neliö 30))]

@section[#:tag "racket_turtle_koordinaatti_nelio"]{Neliön piirtäminen koordinaattien avulla}

Neliön voi piirtää myös komentamalla Turtlen kulkemaan tiettyjen koordinaattipisteiden kautta @racket[go-to] komennon avulla. Jotta koordinaattipisteiden
määrittely olisi helpompaa asetamme ensin kuvan origon lähtöpisteeseen @racket[set-origin] komennolla. 

@racketblock[
(define koordinaatti-neliö
  (list (set-origin)
        (go-to 100 0)
        (go-to 100 100)
        (go-to 0 100)
        (go-to 0 0)))]

@interaction[#:eval (bsl)
             (draw koordinaatti-neliö)]

@section[#:tag "racket_turtle_nelion_peilaaminen"]{Neliön peilaaminen pisteen suhteen}

Voimme piirtää kaksi neliötä niin, että toinen syntyy kun ensimmäinen neliö peilataan pisteen suhteen
(@racket[mirron-x-on], @racket[mirron-y-on]). Peilauspisteeksi tulee se piste, jossa peilauskomento on
suoritettu (tässä esimerkissä kuvion lähtöpiste).

@racketblock[
 (define peilaus-neliö
   (list (mirror-x-on) (mirror-y-on)
         neliö))]

@interaction[#:eval (bsl)(draw peilaus-neliö)]

@section[#:tag "racket_turtle_nelio_leimasimella"]{Neliön piirtäminen leimasintoiminnon avulla}

Voimme aktivoida leimasintoiminnon @racket[stamper-on] komennolla. Racket Turtle "leimaa" (piirtää) jokaisen siirtymän jälkeen 
komennolle annetun kuvan. Tässä esimerkissä leimasimen kuvaksi määritellään pieni punaisen ympyrä. Kynän voi halutessaan
jättää myös alas.

@racketblock[
(define LEIMASIN (circle 5 "solid" "red"))]

@racketblock[
(define leimasin-neliö
  (list (stamper-on LEIMASIN)
        (pen-up)
        neliö))]

@interaction[#:eval (bsl)(draw leimasin-neliö)]

@section[#:tag "racket_turtle_kynan_paksuuden_ja_viivan_tyylin_vaihtaminen"]{Piirtoviivan paksuuden ja tyylin vaihtaminen}

Viivan tyylin voi vaihtaa @racket[change-pen-style] komennolla ja viivan paksuuden @racket[change-pen-style] komennolla.

@italic{Huom!} Tämä ei toimin WeSchemessä.

@racketblock[
(define erikoinen-kynä-neliö
  (list (change-pen-size 5)
        (change-pen-style "dot") 
        neliö))]

@interaction[#:eval (bsl)(draw erikoinen-kynä-neliö)]

@section[#:tag "racket_turtle_suoran_piirtäminen_taustaruudukon_paalle"]{Suoran piirtäminen taustaruudukon päälle}

Ensimmäisenä piirrämme @racket[set-bg-grid] toiminnolla taustaruudukon kuvalle.
Siirrymme origoon @racket[(go-to 0 0)] komennolla ja 
aktivoimme leimasimeksi sinisen ympyrän. Jotta leimasin merkitsee pisteitä (leimoja) suoralle siirrymme @racket[go-to]
komennolla suoralla sijaitsevien pisteiden kautta. Lopuksi leimasin toiminto otetaan pois päältä.

@racketblock[
(define suora-koordinaatistossa 
  (list (set-bg-grid 20 20 "pink")
        (pen-up)
        (go-to 0 0)
        (stamper-on (circle 5 "solid" "blue"))
        (pen-down)
        (go-to 40 40)
        (go-to 80 80)
        (go-to 120 120)
        (go-to 160 160)
        (stamper-off)
        (go-to 500 500)))]

@interaction[#:eval (bsl)(draw suora-koordinaatistossa)]

@section[#:tag "racket_turtle_useamman_leimasimen_kayttaminen"]{Pisteiden piirtäminen useamman eri leimasimen kanssa}

Siirrymme origoon @racket[go-to-origin] komennolla ja piirrämme suoran, jolla on erivärisiä pisteitä 7 pikselin välein.
@racketblock[
(define LEIMASIMET 
  (list (circle 10 "solid" "red")
        (star 10 "solid" "blue")
        (circle 10 "solid" "green")
        (star 10 "solid" "yellow")
        (circle 10 "solid" "black")))]

@racketblock[
 (define suora-leimasimilla
   (list (pen-up)
         (go-to-origin)
         (turn-right 45)
         (stamper-on LEIMASIMET)
         (repeat 8 (forward 50))))]

@interaction[#:eval (bsl)(draw suora-leimasimilla)]

@section[#:tag "racket_turtle_nelio_taustakuvan_paalle"]{Kuvan koon ja taustavärin muuttaminen sekä taustakuvan asettaminen}

Taustavärin voi vaihtaa @racket[change-bg-color] komennolla ja sen päälle voi asetta lisäksi kuvan taustakuvaksi
@racket[set-bg-image]. Esimerkissä halutaan piirtää eri kokoinen kuva kuin normaalisti, joten siinä käytetään
@racket[draw-custom] piirtofunktiota, jolle annetaan kuvan leveys, korkeus ja kuvan piirtonopeus (nopeus 0 tarkoittaa
ettei nopeutta haluta vaihtaa).

@racketblock[
(define neliö-taustakuvan-päällä
  (list (change-bg-color "black")
        (set-bg-image (circle 100 "solid" "gold"))
        neliö))]

@interaction[#:eval (bsl)(draw-custom neliö-taustakuvan-päällä 400 250 0)]

@section[#:tag "racket_turtle_sateenkaaren_varit"]{Viiva, jossa kynän väri muuttuu koko ajan}

Tässä erimerkissä kynän väriksi annetaan lista värejä. Turtle käyttää näitä vuoronperään viivoja piirtäessään. Lisäksi
animaation nopeutta on hidastettu (@racket[draw-custom]:in viimeinen argumentti). Turtle on lisäksi alkuosan piilossa.
@racketblock[
(define SATEENKAARI
  (list "red" "blue" "green" "yellow" "purple"))]

@racketblock[
(define sateenkaari-viiva
  (list (pen-up)
        (go-to 0 0)
        (turn-right 45)
        (pen-down)
        (change-color SATEENKAARI)
        (change-pen-size 10)
        (hide-turtle)
        (repeat 8 (forward 40))
        (show-turtle)
        (repeat 8 (forward 40))))]

@interaction[#:eval (bsl)(draw-custom sateenkaari-viiva 500 500 0.5)]