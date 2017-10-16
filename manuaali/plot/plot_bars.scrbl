#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require teachpacks/racket-turtle)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-intermediate))
@(require (for-label teachpacks/plot))
@(require scribble/core
          scribble/html-properties)
@(require scribble/eval)
@(require scribble/pdf-render)

@declare-exporting[teachpacks/plot]

@title[#:tag "plot_funktiot_bars"]{Pylväsdiagrammit (bar-chart)}

@defproc[(serie [arvot lista<number?>]
                [väri image-color?]
                [selite merkkijono]) funktio]{
                                                  
 Määrittelee piirrettävien pylväiden korkeudet listana @racket[arvot]. Lisäksi annetaan pylvässarjan
 @racket[väri] sekä @racket[selite].}

@defproc[(bar-chart [sarjat serie/lista<serie>]
                    [kategoriat lista<number?/string?>]
                    [y0 reaaliluku]
                    [yn reaaliluku]
                    [x-teksti merkkijono]
                    [y-teksti merkkijono]
                    [otsikko merkkijono]) kuva]{
                                                  
Piirtää yhden tai useamman sarjan pylväitä (@racket[sarjat]). x-akselille tulevat @racket[kategoriat]
 annetaan listana merkkijonoja tai lukuja. y-akselin korkeutta voi säätää antamalla  y:n rajat @racket[y0]-@racket[yn]. 

 Functiolle annetaan lisäksi x- ja y-akselien nimet @racket[x-teksti] ja @racket[y-teksti] sekä kuvan
 otsikko @racket[otsikko]. @racket[bar-chart] palauttaa kuvan.}

@racketblock[(bar-chart (serie (list -9.3 -9.3 -4.8 1.00 7.4 12.6 15.6 13.4 8.3 2.8 -3.2 -7.3) "blue" "keskilämpötila")
                        (list "tammikuu" "helmikuu" "maaliskuu" "huhtikuu" "toukokuu" "kesäkuu" "heinäkuu"
                              "elokuu" "syyskuu" "lokakuu" "marraskuu" "joulukuu")
                        -20 20 "kuukaudet" "lämpötila (°C)" "Kuukauden keskilämpötilat")]

@centered[@image[#:scale 0.7 "plot/temperatures.png"]]

@racketblock[(bar-chart (list (serie (list 100 99 100 99 92 74 31) "red" "käyttänyt nettiä")
                              (serie (list 97 96 94 83 64 38 16) "blue" "useasti päivässä")
                              (serie (list 93 93 92 75 53 27 6) "black" "vapaa-ajalla kännykällä"))
                        (list "16-24" "25-34" "35-44" "45-54" "55-64" "65-74" "75-89")
                         0 120 "ikä" "prosenttia" "Internetin käyttö")]

@centered[@image[#:scale 0.7 "plot/bars.png"]]

@racketblock[(bar-chart (list (serie (list 144) "red" "naiset")
                              (serie (list 162) "blue" "miehet")
                              (serie (list 306) "black" "kaikki"))
                        (list "")
                        0 310 "" "henkilöä" "Osallistujat")]

@centered[@image[#:scale 0.7 "plot/3bars.png"]]

