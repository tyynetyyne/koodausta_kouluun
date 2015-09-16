;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))

@(require scribble/core
           scribble/html-properties)
@(require scribble/eval)

@title[#:tag "racket_bsl_syntaksi" #:style 'toc]{Syntaksi}

@declare-exporting[fin-doc/fi-beginner]

@(begin
   (require scribble/manual scribble/eval fin-doc/sl-eval)
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require 2htdp/image)
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
	(define z (list 2 "hello" #true "hello"))))
     (set! bsl (lambda () *bsl))
     *bsl))

Racket BSL koodi rakentuu @bold{määrittelyistä}, @bold{lausekkeista},
@bold{testitapauksista} ja @bold{kirjastovaatimuksista}.

@local-table-of-contents[#:style 'immediate]

@section[#:style 'unnumbered #:tag "maarittelyt"]{Määrittelyt}
   
@defform[(define (nimi muuttuja muuttuja ...) lauseke)]{

   Määrittelee @racket[nimi] nimisen funktion, jonka toteutus on @racket[lauseke]. Kun funktiota kutsutaan, kunkin 
   argumenttin arvo sijoitetaan funktion lausekkeeseen @racket[muuttuja]:n tilalle. Funktio palauttaa saadun lausekkeen arvon.

   Funktiolla ei voi olla samaa nimeä kuin jollain toisella funktiolla tai muuttujalla.

Racket BSL @racket[nimi] tai @racket[muuttuja] eivät voi sisältää välilyöntiä eikä mitään seuraavista merkkeistä: @litchar{"} @litchar{,} @litchar{'} @litchar{`}
@litchar{(} @litchar{)} @litchar{[} @litchar{]} @litchar["{"] @litchar["}"] @litchar{|} @litchar{;}
@litchar{#}}

@defform[#:link-target? #f (define nimi lauseke)]{

   Sitoo @racket[nimi] nimisen muuttujan arvoon, joka saadaan evaluoimalla @racket[lauseke]. Muuttujalla ei voi olla samaa nimeä kuin jollain toisella funktiolla tai muuttujalla,
   eikä @racket[nimi] saa olla osana @racket[lauseke]:tta.}

@defform[(define-struct tietue (kenttä ...))]{

   Määrittelee @racket[tietue] nimisen tietueen, jolla on yksi tai useampi @racket[kenttä]. Kun @racket[define-struct]:ia on käytetty, saadaan automaattisesti käyttöön seuraavat funktiot:

   @itemize[

     @item{@racketidfont{make-}@racket[tietue] : ottaa niin monta argumenttia kuin tietueessa on kenttiä ja luo uuden tietueen.}

     @item{@racket[tietue]@racketidfont{-}@racket[kenttä] : ottaa vastaan tietueen ja palauttaa @racket[kenttä] nimisen kentän sisältämän arvon}

     @item{@racket[tietue]@racketidfont{?} : otaa vastaan minkä tahansa rakenteen ja palauttaa @racket[#true], jos annettu rakenne on tyyppiä @racket[tietue].}
   ]

   Saatujen uusien funktioiden nimet eivät saa olla samoja kuin muiden funktioiden tai muuttujien nimet muuten @racket[define-struct] palauttaa virheen.
}

@section[#:style 'unnumbered #:tag "lausekkeet"]{Lausekkeet}

@subsection[#:style 'unnumbered #:tag "lausekkeen_yleinen_muoto"]{Lausekkeen yleinen muoto}

@defform/none[(nimi lauseke lauseke ...)]{
Kutsuu @racket[nimi] nimistä funktiota. Funktio palauttaa arvon, joka saadaan kun funktion, jokaisen muuttujan tilalle sijoitetaan arvo, joka saadaan evaluoimalla sitä vastaava @racket[lauseke].  
                    
@racket[nimi] niminen funktio täytyy määritellä ennenkuin sitä voidaan kutsua. Argumenttina annettavia lausekkeita on oltava funktion vaatima määrä.}

@subsection[#:style 'unnumbered #:tag "yksinkertaiset_lausekkeet"]{Yksinkertaiset lausekkeet}

Racket BSL lauseke voi olla myös pelkkä yksittäinen nimi, luku, totuusarvo, merkkijono, kuva tai symboli.
Näitä ei kirjoiteta sulkujen sisään.

@tabular[#:style 'boxed
        
         #:row-properties '(bottom-border ())
         (list (list @bold{Tyyppi} @bold{Esimerkkejä})
               (list @italic{nimi}       @racket[KOIRA Tampere suuri?])
               (list @italic{luku}       @racket[2 3/4 5.6])
               (list @italic{totuusarvo} @racket[#true #false #t #f])
               (list @italic{merkkijono} @racket["Koska meillä on Joulu" "Jo joutui armas aika"])
               (list @italic{kuva}       @(overlay/xy (circle 5 "solid" "red") 25 -3 (star 10 "solid" "blue")))
               (list @italic{symboli}    @racket['() 'kuuma 'r]))]

@subsection[#:style 'unnumbered #:tag "peruslausekkeet"]{Peruslausekkeet}

@defform[(if ehto tosihaara epätosihaara)]{

   Jos @racket[if]-lausekkeen @racket[ehto]-lauseke evaluoituu arvoksi @racket[#true],
   @racket[if]-lauseke palauttaa @racket[tosihaara]-lausekkeen arvon. Jos @racket[ehto]-lauseke evaluoituu arvoksi  
   @racket[#false], @racket[if]-lauseke palauttaa @racket[epätosihaara]-lausekkeen arvon.

   Jos @racket[ehto]-lauseke ei palauta @racket[#true] tai  
   @racket[#false], @racket[if] ilmoittaa virheestä.}

@defform*[#:literals (else)
           ((cond [ehto seuraus] ...)
            (cond [ehto seuraus]
                   ...
                  [else seuraus]))]{

    @racket[cond]-lauseketta evaluoidaan @racket[ehto]-lauseke kerrallaan. Ensimmäinen @racket[ehto]-lauseke,
    joka evaluoituu arvoksi @racket[#true], osoittaa sen @racket[seuraus]-lausekkeen, jonka arvo
    palautetaan koko @racket[cond]-lausekkeen arvona.

    Jos yksikään @racket[ehto]-lauseke ei tuota arvoa @racket[#true],
    koko @racket[cond]-lausekkeen arvo on @racket[else]-haarassa oleva @racket[seuraus]-lauseke.
    Jos @racket[else]-haara puuttuu, @racket[cond] ilmoittaa virheestä. Jos @racket[ehto]-lauseke palauttaa jotain
    muuta kuin @racket[#true] tai @racket[#false], @racket[cond] ilmoittaa virheestä.
    
    @defidform/inline[else] voi esiintyä vain @racket[cond]:in sisällä.}


@defform[(and lauseke lauseke ...)]{

    Jos jokainen @racket[lauseke] evaluoituu @racket[#true]:ksi,  koko lausekkeen arvo on  
    @racket[#true]. Jos yksikin @racket[lauseke] on @racket[#false], @racket[and]
    -lauseke evaluoituu @racket[#false]:ksi (eikä seuraavia lausekkeita enää evaluoida).

   Jos jonkin lausekkeen arvo on jotain muuta kuin @racket[#true] tai
    @racket[#false], @racket[and] ilmoittaa virheestä.}

@defform[(or lauseke lauseke ...)]{

    Evaluoituu @racket[#true]:ksi heti kun ensimmäinen 
    @racket[lauseke] on arvoltaan @racket[#true] (eikä seuraavia lausekkeita enää evaluoida.) Jos yksikään @racket[lauseke] ei saa arvoa @racket[#true],
    @racket[or]-lausekkeen arvoksi tulee @racket[#false].

    Jos jonkin lausekkeen arvo on jotain muuta kuin @racket[#true] tai 
    @racket[#false], @racket[or] ilmoittaa virheestä.}

@section[#:style 'unnumbered #:tag "testitapaukset"]{Testitapaukset}

Kun ajat ohjelmia DrRacket:ssä osa ohjelmakoodista maalautuu mustaksi. Tämä tarkoittaa sitä, että kyseistä osaa koodia ei ole vielä ajettu (testattu). Koska testaamaton koodi ei yleensä toimi halutulla tavalla, 
suosittelemme, että testaat ohjelmasi käyttämällä @racket[check-expect]:iä tai @racket[check-within]:iä.  

@defform[(check-expect lauseke odotusarvo)]{

   Tarkistaa, että @racket[lauseke] evaluoituu @racket[odotusarvo]:ksi.
                   
@;%
@;@(begin
@;#reader scribble/comment-reader
@;(racketblock
  
@;(check-expect (summa 4 7) 11)
@;(check-expect (summa -10 4) -6)

@;(define (summa a b)
@;  (+ a b))
@;))
@;%
 @racket[check-expect]-lausekkeet sijoitetaan tyypillisesti ennen testattavaa funktiota. Niiden avulla kerrotaan
 miten funktiota kuuluu käyttää, ja miten se toimii. Jos @racket[lauseke] tai @racket[odotusarvo] tuottaa epätarkan arvon, testaamiseen tulee käyttää 
@racket[check-within]-lauseketta. }

 @defform[(check-within lauseke odotusarvo poikkeama)]{

  Tarkistaa onko arvo, joka saadaan evaluoimalla @racket[lauseke] lähempänä @racket[odotusarvo]:a kuin sallittu @racket[poikkeama].

@interaction[#:eval (bsl)

(check-within (sqrt 2) 1.41 0.01)]

  Jos @racket[poikkeama] ei ole luku, @racket[check-within] ilmoittaa virheestä.} 

@section[ #:style 'unnumbered #:tag "kirjastovaatimukset"]{Kirjastovaatimukset}

@defform[(require merkkijono)]{

   Mahdollistaa @racket[merkkijono]:n osoittaman tiedoston sisältämien määrittelyjen käytön nykyisessä tiedostossa. 
   @racket[merkkijono]:n sisältämä osoite on suhteellinen nykyisen tiedoston sijainnin suhteen.

   @racket[merkkijono] täytyy olla muotoiltu tietyllä tavalla, jotta vältytään ongelmilta eri ympäristöissä:
   @litchar{/} osoittaa hakemistoa, @litchar{.} tarkoittaa nykyistä hakemistoa, @litchar{..} ylemmän tason hakemistoa,
   tiedosto- ja hakemistonimet voivat sisältää ainoastaan kirjaimia @litchar{a}-@litchar{z}
   (isoja tai pieniä), sekä numeroita @litchar{0}-@litchar{9} sekä merkkejä 
   @litchar{-}, @litchar{_}, ja @litchar{.}. Lisäksi merkkijono ei saa olla tyhjä eikä sen alussa tai lopussa saa olla @litchar{/}-merkkiä.}

@defform[#:link-target? #f (require moduuli)]{

   Ottaa käyttöön asennetun kirjaston. @racket[moduuli]:n nimellä on samat rajoitukset kuin yllä mutta sitä ei kirjoiteta sitaatteihin. Lisäksi
   se ei saa sisältää @litchar{.}-merkkiä.}


 