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

@title[#:tag "racket_turtle_komennot" #:style 'toc]{Komennot Racket Turtlen ohjaamiseen}

@(begin
   (require scribble/manual scribble/eval fin-doc/sl-eval)
   (define (bsl)
     (define *bsl
       (bsl+-eval
        (require 2htdp/image)
        (require teachpacks/racket-turtle)
        ))
     (set! bsl (lambda () *bsl))
     *bsl))

@defproc[(forward [x reaaliluku]) funktio]{
                                       
 Komento, joka saa Turtlen liikkumaan @racket[x] pikseliä eteenpäin, jos annettu @racket[x] on positiivinen ja
 taaksepäin, jos se on negatiivinen.}

@defproc[(turn-left [a reaaliluku]) funktio]{
                                         
 Komento, joka saa Turtlen kääntymään @racket[a] astetta vasemmalle, jos annettu @racket[a] on positiivinen.
 Negatiivinen @racket[a]:n arvo saa Turtlen kääntymään oikealle @racket[a]:n itseisarvon verran.
                                      
}

@defproc[(turn-right [a reaaliluku]) funktio]{
                                          
 Komento, joka saa Turtlen kääntymään @racket[a] astetta oikealle, jos annettu @racket[a] on positiivinen.
 Negatiivinen @racket[a]:n arvo saa Turtlen kääntymään vasemmalle @racket[a]:n itseisarvon verran.
                                      
}

@defproc[(repeat [k luonnollinen-luku][komentolista (lista<funktio>)]) lista<funktio>]{
                                                                                     
 Komento, jonka avulla Turtle toistaa annetun listan sisältämät komennot @racket[k] kertaa .
}

@defproc[(pen-up) funktio]{
                             
 Nostaa Turtlen kynän ylös, jolloin Turtle ei piirrä viivaa liikkuessaan. Turtlen kynä on aluksi alhaalla.
 
}

@defproc[(pen-down) funktio]{
                               
 Laskee Turtlen kynän alas, jolloin Turtle piirtää viivaa liikkuessaan.
 
}

@defproc[(go-to [x reaaliluku][y reaaliluku]) funktio]{
                                             
 Komento, joka saa Turtlen siirtymään pisteeseen (@racket[x], @racket[y]). Turtlen origo on vasemmassa alareunassa, ellei
 sitä ole siirretty (katso: @racket[set-origin]).            
 
}

@defproc[(go-to-origin) funktio]{
                                   
 Komento, joka saa Turtlen siirtymään origoon. Turtlen origo on vasemmassa alareunassa, ellei
 sitä ole siirretty (katso: @racket[set-origin]).            
 
}

@defproc*[([(change-color [väri image-color?]) funktio]
           [(change-color [värilista (lista<image-color?>)]) funktio])]{
                                                                           
 Vaihtaa Turtlen kynän värin (kynän väri on aluksi sininen). Argumentti voi olla joko yksittäinen @racket[väri] tai
 lista, jossa on yksi tai useampi @racket[väri]. Värilista toimii niin, että kynän väri vaihtuu listan osoittamassa
 järjestyksessä. Kun lista on käyty läpi aloitetaan sen alusta.
}

@defproc[(change-pen-size [koko kokonaisluku-välillä-0-255]) funktio]{
                                                                        
 Asettaa kynän piirtämän viivan leveyden. Kynän leveys on kokonaisluku välillä @racket[0] - @racket[255].
                                                                               
 @italic{Huom!} WeScheme ei tue tätä. Komennon voi antaa mutta se ei muuta viivan leveyttä.
}

@defproc[(change-pen-style [tyyli merkkijono]) funktio]{
                                                          
 Asettaa kynän piirtämän viivan tyylin. Tyyli voi olla jokin näistä: @italic{"solid", "dot", "long-dash",
  "short-dash"} tai @italic{"dot-dash"}.
               
 @italic{Huom!} WeScheme ei tue tätä. Komennon voi antaa mutta se ei muuta viivan tyyliä.
 
}

@defproc[(change-bg-color [väri image-color?]) funktio]{
                                                          
 Vaihtaa kuvan taustavärin (taustaväri on aluksi valkoinen). Tätä komentoa kannattaa käyttää ensimmäisenä,
 koska se korvaa jo piirretyn kuvan yhtenäisellä taustavärillä.
 
}

@defproc[(set-bg-image [taustakuva kuva]) funktio]{
                                                     
 Asettaa taustakuvan. Tätä komentoa kannattaa käyttää ennen varsinaisen kuvan piirtämistä,
 sillä se asettaa @racket[taustakuvan] aikaisemmin piirrettyjen kuvioiden päälle.
 
}

@defproc[(set-bg-grid [ruudun-leveys luonnollinen-luku]
                      [ruudun-korkeus luonnollinen-luku]
                      [väri image-color?]) funktio]{
                                                                      
 Piirtää taustakuvaksi ruudukon, jonka @racket[ruudun-levyes], @racket[ruudun-korkeus] ja viivan @racket[väri] on annettu.
 Tätä komentoa kannattaa käyttää ennen varsinaisen kuvan piirtämistä.
 
}

@defproc[(set-origin) funktio]{
                                 
 Tallentaa Turtlen nykyisen sijainnin uudeksi origoksi. Origon sijainti ilmaistaan pienellä punaisella pisteellä
 animaation aikana.
 
}

@defproc*[([(stamper-on [leimasin kuva]) funktio]
           [(stamper-on [leimasinlista (lista<kuva>)]) funktio])]{
 Asettaa leimasintoiminnon päälle. Kun leimasin on päällä Turtle piirtää jokaisen siirtymän jälkeen annetun @racket[leimasin]
 kuvan. Jos argumenttina on annettu @racket[leimasinlista] kuvat piirretään listan osoittamassa järjestyksessä. Kun lista
 loppuu, aloitetaan alusta. Leimasintoiminto ei vaikuta Turtlen kynään, eli jos se on alhaalla piirretään myös viiva.
}

@defproc[(stamper-off) funktio]{
                                  
 Poistaa leimasintoiminnon. 
 
}

@defproc[(mirror-x-on) funktio]{
                                  
 Monistaa Turtlen komennot niin, että ne peilautuvat x-akselin suunnassa e.g. ruudulle piirtyy kaksi kuviota, jotka ovat toistensa peilikuvat.
 Suora jonka suhteen peilaus suoritetaan määräytyy sen pisteen y-koordinaatin mukaan missä @racket[mirror-x-on] käynnistetään.
 Jos heti perään käynnistetään myös @racket[mirror-y-on] peilataan sen pisteen suhteen, jossa toiminnot on käynnistetty.
 
}

@defproc[(mirror-y-on) funktio]{
                                  
 Monistaa Turtlen komennot niin, että ne peilautuvat y-akselin suunnassa e.g. ruudulle piirtyy kaksi kuviota, jotka ovat toistensa peilikuvat.
 Suora jonka suhteen peilaus suoritetaan määräytyy sen pisteen x-koordinaatin mukaan missä @racket[mirror-y-on] käynnistetään. 
 Jos heti perään käynnistetään myös @racket[mirror-x-on] peilataan sen pisteen suhteen, jossa toiminnot on käynnistetty.
}

@defproc[(mirror-x-off) funktio]{
                                   
 Poistaa peilauksen x-akselin suunnassa.
 
}

@defproc[(mirror-y-off) funktio]{
                                   
 Poistaa peilauksen y-akselin suunnassa.
 
}

@defproc[(reset-angle) funktio]{
                                   
 Asettaa Turtlen lähtösuuntaan (ylöspäin).
 
}

@defproc[(clean-up) funktio]{
                               
 Tyhjentää ruudun ml. taustakuvan sekä taustaruudukon mutta asetettu taustaväri säilyy. Myös Turtlen sijainti ja suunta
 säilyvät.
 
}

@defproc[(hide-turtle) funktio]{
                                  
 Piilottaa Turtlen animaation ajaksi (Turtle on aluksi näkyvissä). Turtle on musta tasakylkinen kolmio, jonka sijainti ja asento osoittavat Turtlen
 sijainnin ja rintamasuunnan. 
 
}

@defproc[(show-turtle) funktio]{
                                  
 Palauttaa Turtlen jälleen näkyväksi animaation ajaksi. Turtle on musta tasakylminen kolmio, jonka sijainti ja asento osoittavat Turtlen
 sijainnin ja rintamasuunnan. 
 
}
