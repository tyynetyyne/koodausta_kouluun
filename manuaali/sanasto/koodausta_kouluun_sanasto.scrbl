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

@title[#:tag "sanasto"]{Sanasto}

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
        (define (neliön-pinta-ala x)
               (* x x))
        (define-struct oppilas (etunimi sukunimi ikä))
        ))
     (set! bsl (lambda () *bsl))
     *bsl))

@section[#:style 'unnumbered]{argumentti}
@margin-note{argument}
	
Funktiokutsussa annettavan syötteen (muuttujan) arvo.  

Esim. funktiota @racket[sqrt] kutsutaan argumentilla 2  

@racketblock[(sqrt 2)] 

Kutsutaan myös "todelliseksi parametriksi" (actual parameter).

@section[#:style 'unnumbered]{arvo} 
@margin-note{value}

Arvo on ohjelmointikielen lauseke, jota ei voi sieventää enää pidemmälle.
Arvo voi olla esim. luku, kuva, merkkijono tai totuusarvo. Arvon evaluointi tuottaa saman arvon.

Esim. luvun 6 arvo on 6 

@interaction[#:eval (bsl) 6]

Esim. merkkijonon ”joo” arvo on ”joo” 

@interaction[#:eval (bsl) "joo"]

Kutsutaan myös @italic{literaaleiksi}.

@section[#:style 'unnumbered]{arvojoukko} 
@margin-note{range}	

Funktion arvojoukolla voidaan määritellä minkä tyyppisiä arvoja se palauttaa. 

Esim. funktio ”positive?” palauttaa arvon, joka on tyyppiä totuusarvo, joten sen arvojoukko on @italic{totuusarvot}.

@defproc[(positive? [x luku]) totuusarvo]{}

@interaction[#:eval (bsl)
             (positive? 2.5)
             (positive? -2)]

@section[#:style 'unnumbered]{askeltaja / stepperi} 
@margin-note{stepper}	

Toiminto DrRacketissä, jonka avulla voidaan evaluoida koodia lauseke-lausekkeelta ja nähdä evaluoinnin välivaiheet
erillisessä ikkunassa.

@italic{Huom!} WeScheme:ssä ei ole tätä toimintoa.

@image["sanasto/stepper_img.png" #:scale 0.5 ]

@section[#:style 'unnumbered]{BSL} 
@margin-note{Beginning Student Language}	
	
DrRacketin sisäänrakennettu harjoittelukieli, jossa on vähemmän toimintoja, mikä mahdollistaa mm. selkeämmät virheilmoitukset.  

@section[#:style 'unnumbered]{cons-solu} 
@margin-note{cons cell}	

Cons-solujen avulla voidaan muodostaa monimutkaisiakin tietorakenteita, joihin voidaan tallentaa paljon tietoa.
Cons-solut muodostuvat kahdesta tietoalkiosta (vasen ja oikea tietoalkio). Yksinkertaisimmassa cons-solussa vasen
tietoalkio sisältää jotain hyödyllistä ja oikea on tyhjä lista eli @racket['()], eli ilmaisee tietorakenteen päättymistä.

@interaction[#:eval (bsl-eval) (cons 1 '())]

Listat muodostuvat sisäkkäisistä cons-soluista. Listan viimeisen cons-solun oikea tietoalkio on tyhjä lista
@racket['()].

@interaction[#:eval (bsl-eval)(list 1 2 3)]

@section[#:style 'unnumbered]{DrRacket} 
	
Avoimen lähdekoodin ohjelmointiympäristö, joka tukee useampaa ohjelmointikieltä ml. Racket ja BSL.  

@section[#:style 'unnumbered]{ehtolause} 
@margin-note{if expression, if-then-else expression}	

Ehtolauseen avulla saadaan koodi haarautumaan kahteen eri haaraan: @italic{tosihaara} tai @italic{epätosihaara} riippuen
@italic{ehto}-lausekkeen totuusarvosta.

Esim. Seuraavassa @racket[(> a 0)] on @italic{ehto}-lauseke. Jos se tuottaa arvon @racket[#true] eli a on suurempi
kuin nolla, @racket[if]-lausekkeen arvoksi saadaan @italic{tosihaara}-lausekkeen arvo eli ”suurempi”,
muuten @italic{epätosihaara}-lausekkeen arvo eli "pienempi". 

@racketblock[(if (> a 0)

                 ”suurempi”

                 ”pienempi”)]

@section[#:style 'unnumbered]{evaluointi} 
@margin-note{evaluation}	

Lausekkeen sieventäminen kunnes saadaan selville sen arvo (funktionaalisessa ohjelmoinnissa).  

Esim. lausekkeen (+ 1 2) evaluointi tuottaa arvon 3

@interaction[#:eval (bsl) (+ 1 2)]

@section[#:style 'unnumbered]{funktio} 
@margin-note{function}	

Yleensä yhden toiminnon suorittamiseen ohjelmoitu, uudelleenkäytettävissä oleva ohjelman pätkä, joka palauttaa
erilaisia arvoja riippuen sille annetusta syötteestä eli argumenteista (muuttujien arvoista). 

Esim. tässä määritellään funktio @racket[neliön-pinta-ala], joka laskee neliön pinta-alan:

@racketblock[(define (neliön-pinta-ala x)
               (* x x))]

Tässä kutsutaan funktiota @racket[neliön-pinta-ala] muuttujan @racket[x] eri avoilla. Ensimmäisessä funktion argumenttina
annetaan @racket[4] toisessa @racket[50]

@interaction[#:eval (bsl) (neliön-pinta-ala 4)
                    (neliön-pinta-ala 50)]

@section[#:style 'unnumbered]{interaktioikkuna} 
@margin-note{interactions window}	

DrRacket:in (tai WeScheme:n) ikkuna, jossa  voidaan testata yksittäisten lausekkeiden toimintaa.
Koodia ei voi tallentaa ja se suoritetaan  painamalla <enter>. Edellisen koodirivin voi palauttaa näkyville
muokkaamista varten painamalla @italic{Ctrl+↑} (DrRacket) tai @italic{Ctrl+p} (WeScheme).  

Interaktioikkunassa näytetään myös määrittelyikkunassa ajetun koodin tuottama tulos (arvo). 

Interaktioikkuna sijaitsee joko alhaalla tai oikealla, riippuen käytetyistä asetuksista. 

@image["sanasto/interaktioikkuna.png" #:scale 0.5 ]

@section[#:style 'unnumbered]{kirjasto} 
@margin-note{library}	

Valmiiksi koodattuja toimintoja, joilla voi laajentaa käytettyä ohjelmointikieltä. 

Esim. kuvien piirtämiseen on Racketissä oma kirjastonsa, joka otetaan käyttöön näin: 

@racketblock[(require 2htdp/image)] 

@section[#:style 'unnumbered]{kommentti} 
@margin-note{comment}	

Koodin sekaan voi kirjoittaa selventävää tekstiä, merkitsemällä sen kommentiksi. Kun koodi suoritetaan,
nämä rivit hypätään yli. 

Esim.  

@italic{;tämä on kommentti} 

@section[#:style 'unnumbered]{lauseke} 
@margin-note{expression}	

Yksi ohjelmointikielen evaluoitavissa oleva ilmaus.
Se voi olla arvo, kuten luku, totuusarvo tai merkkijono, tai se voi olla funktiokutsu,
joka sisältää muuttujia ja/tai vakioita. Lauseke voi myös sisältää muita lausekkeita.  

Esim. seuraavat ovat Racket-kielen lausekkeita: 

@racketblock[(+ 1 2) 

             6 

             (string-append ”joo” (number->string 6)) ]

@section[#:style 'unnumbered]{luku} 
@margin-note{number}	

Luku voi Racket-kielessä olla kokonaisluku, rationaaliluku, irrationaaliluku, reaaliluku tai kompleksiluku.
Jos luvun edessä on merkintä @litchar{#i} se merkitsee sitä, että luku on epätarkka. Päättymättömän jaksollisen
desimaalikehitelmän jakso merkitään sen yläpuolelle vedetyllä viivalla. Kymmenpotenssit ilmoitetaan 5e3 (=5000.0).

Esim. erilaisista Racket - kielen luvuista  

@racketblock[-1
 1/3
 #i1.4142135623730951
 5000.0]

@section[#:style 'unnumbered]{merkkijono} 
@margin-note{string}	

Tietotyyppi, joka sisältää määrittelemättömän määrän merkkejä lainausmerkkien sisällä.
Racket-kielen merkkijono ei saa sisältää @litchar{”} @litchar{(} @litchar{)} merkkejä. 

Esim.  

@racketblock["tämä on merkkijono" 

"0123456789abcDEF!$%^&*_+-=?<>" ]

@section[#:style 'unnumbered]{muuttuja} 
@margin-note{variable}	

Tallennettu arvo, johon voidaan viitata sen nimellä.   

Esim. globaalin muuttujan @racket[a] arvoksi asetetaan @racket[5] (vrt. vakio) 

@racketblock[(define a 5)] 

Myös funktion parametreja voidaan kutsua muuttujiksi 

@section[#:style 'unnumbered]{määrittelyikkuna} 
@margin-note{definitions window}	

DrRacket:in (tai WeScheme:n) ikkuna, johon varsinainen koodi kirjoitetaan. Koodin voi tallentaa tiedostoon ja suorittaa @italic{run}-napilla
tai painamalla @italic{Crtl+r}. 

Määrittelyikkuna sijaitsee joko ylhäällä tai vasemmalla, riippuen käytetyistä asetuksista. 

@image["sanasto/maarittelyikkuna.png" #:scale 0.5 ]

@section[#:style 'unnumbered]{määrittelyjoukko} 
@margin-note{domain}	

Funktion määrittelyjoukon avulla voidaan määritellä minkä tyyppisiä syötteitä se vastaanottaa. 

Esim. funktio ”positive?” ottaa syötteeksi luvun, joten sen arvojoukko on @italic{luvut}. 

@defproc[(positive? [x luku]) totuusarvo]{}

@interaction[#:eval (bsl)
             (positive? 2.5)
             (positive? -2)]

@section[#:style 'unnumbered]{paketti} 
@margin-note{package}	

Racket-kirjastot paketoidaan paketteihin, joita voi ladata ja asentaa omalle koneelleen. @index["paketin asentaminen"]{Paketin asennus}
aloitetaan avaamalla DrRacket:issä @italic{File -> Package Manager}. Avautuvaan ikkunaan kirjoitetaan
asennettavan paketin nimi esim. @bold{teachpacks} ja painetaan @italic{<enter>}. Jos nettiyhteys on kunnossa, paketti asentuu automaattisesti ja ikkunan voi sulkea kun näkyviin tulee teksti
@italic{--- post installing collections ---}. Tämän jälkeen paketin kirjastot voi ottaa käyttöö @racket[require]-komennolla.
@margin-note{DrRacket:in asennuksessa on mukana monta pakettia, esim. 2htdp/image ja 2htdp/universe kirjastot tulevan sen mukana
             automaattisesti eikä niitä tarvitse erikseen asentaa.}

@image[#:scale 0.8 "sanasto/asenna_paketti2.png"]

@italic{Huom!} WeScheme:ssä ei ole @italic{Package Manager}:ia. Laajennuskirjastot otetaan siinä käyttöön
suoraan @racket[require]-komennolla. Huomaa, että WeScheme-kirjastoilla on eri nimet kuin vastaavalla
DrRacket-kirjastoilla (WeScheme-kirjaston nimi on muotoa wescheme/xxxxxxxxxxxx). Kaikkia kirjastoja ei ole
myöskään saatavilla WeScheme:lle.

@section[#:style 'unnumbered]{parametri} 
@margin-note{parameter}	

Funktion määrittelyssä käytettäviä muuttujia kutsutaan funktion parametreiksi.  

Esim. määritellään funktio @racket[summa], joka saa kaksi parametria @racket[x] ja @racket[y] 

@racketblock[(define (summa x y) 

               (+ x y))]  

Kutsutaan myös "muodolliseksi parametriksi" (formal parameter). 

@section[#:style 'unnumbered]{predikaatti} 
@margin-note{predicate}	

Funktio, joka palauttaa totuusarvon. 

Esim.  

@racketblock[(string=? ”joo” ”juu”) 

(= 1 1)] 

@section[#:style 'unnumbered]{primitiivi} 
@margin-note{primitive}	

Ohjelmointikieleen sisäänrakennettu (perus)toiminto. 

Esim. Racket-kielen primitiivejä ovat mm.: 

@racket[+ 

sqrt 

string-length]  

@section[#:style 'unnumbered]{sieventäminen} 
@margin-note{reduction}	

Lausekkeen muuttamista yksinkertaisimpaan muotoonsa niin, että sen arvo pysyy samana. 

@section[#:style 'unnumbered]{suorita / aja} 
@margin-note{execute / run}	

Evaluoidaan koodia (funktionaalinen ohjelmointi). 

Yleisemmin koodin muuntamista ohjelmointikielestä tietokoneen ymmärtämiksi konekielisiksi käskyiksi (kääntäminen)
ja näiden käskyjen ajamista (suorittaminen). 

@section[#:style 'unnumbered]{syntaksi} 
@margin-note{syntax}	

Koodin täytyy olla kyseisen ohjelmointikielen lauseopin mukaista eli sen täytyy olla sekä sanastonsa, että
kielioppinsa puolesta oikeanlaista, jotta kyseisen ohjelmointikielen kääntäjä (tai tulkki) pystyy
evaluoimaan/suorittamaan sitä. 

@section[#:style 'unnumbered]{tietotyyppi} 
@margin-note{data type}	

Jokaisella vakiolla ja muuttujalla on oma tietotyyppinsä, joka määrää mitä operaatioita sille voidaan suorittaa. 

Esim. Racket-kielen tietotyyppejä ovat mm. luku, merkkijono, kuva ja totuusarvo  

@section[#:style 'unnumbered]{tietue} 
@margin-note{struct}	

Tietorakenne, johon voi tallentaa monta muuttujaa eli kenttää. Muuttujat voivat olla keskenään eri tyyppisiä.
Yleensä tietuetta käytetään, kun halutaan tallentaa samaan asiaan liittyviä tietoja.

Esim. Määritellään uusi @italic{oppilas}-tietue, johon voidaan tallentaa oppilaan etunimi, sukunimi ja ikä.

@racketblock[(define-struct oppilas (etunimi sukunimi ikä))]

Nyt voidaan luoda uusi oppilas, ja tallentaa hänen tietonsa @italic{oppilas}-tietueeseen.
@racketblock[(make-oppilas "Ninni" "Nokkonen" 14)]

@section[#:style 'unnumbered]{totuusarvo} 
@margin-note{Boolean value}	
	
Arvo, joka voi voi olla joko tosi tai epätosi 

Esim. 

@racketblock[#true
 #false
 true
 false
 #t
 #f] 

@section[#:style 'unnumbered]{tulkki} 
@margin-note{interpreter / REPL = Read Eval Print Loop }	

Vrt. interaktioikkuna 

@section[#:style 'unnumbered]{vakio} 
@margin-note{constant}	

Arvo, joka ei muutu ohjelman suorituksen aikana.  

Esim. @racket[a] ja @racket[KUVA] eivät muutu näiden määrittelyjen jälkeen

@racketblock[(define a 5)
 (define KUVA (circle 50 "solid" "red"))]

@section[#:style 'unnumbered]{valintalause} 
@margin-note{cond expression (Racket), case (joissakin muissa ohjelmointikielissä)}

Valintalauseen avulla koodi saadaan haarautumaan useampaan kuin kahteen haaraan (vrt. ehtolause).
Valintalause koostuu @italic{ehto}-lauseke ja @italic{seuraus}-lauseke pareista, sekä @italic{else}-lausekkeesta.
@italic{ehto}-lausekkeiden totuusarvot tutkitaan järjestyksessä, kunnes löydetään ensimmäinen tosiarvo.
Tähän @italic{ehto}-lausekkeeseen liitetty @italic{seuraus}-lauseke palautetaan koko valintalausekkeen tuloksena.

Esim. tässä @racket[cond]-lausekkeessa on kolme @italic{ehto}-lauseketta @racket[(< a 5)], @racket[(> a 5)] ja @racket[(= a 5)].
Jos muuttujan @racket[a] arvo on @racket[5] kaksi ensimmäistä ehtoa eivät toteudu ja koko lausekkeen arvona palautetaan
"yhtäsuuri".

@racketblock[(cond [(< a 5) "pienempi"]
                   [(> a 5) "suurempi"]
                   [(= a 5) "yhtäsuuri"]
                   [else "virhe"])]