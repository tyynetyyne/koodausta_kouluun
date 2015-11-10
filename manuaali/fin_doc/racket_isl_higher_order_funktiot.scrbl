;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require (for-label fin-doc/fi-intermediate))

@(require scribble/core
          scribble/html-properties)
@(require scribble/eval)

@title[#:tag "racket_isl_higher_order_funktiot" #:style 'toc]{Higher order - funktiot}

Nämä funktiot kuuluvat @italic{Intermediate Student Language}:een. 

@margin-note{Jotta saat nämä funktiot käyttöösi vaihda kieli DrRacket:issa: 
 @italic{Language->Choose language->Teaching languages->Intermediate student.}
  WeScheme:ssä funktiot toimivat automaattisesti.}

@declare-exporting[fin-doc/fi-intermediate]

@(begin
    (require scribble/manual scribble/eval "sl-eval.rkt")
    (define (isl)
      (define *bsl
        (isl+-eval
         (require 2htdp/image)
         (define i 3)
         (define e1 (ellipse 30 10 "solid" "red"))
         (define e2 (ellipse 30 10 "solid" "blue"))
         (define e3 (ellipse 30 10 "solid" "green"))
         (define t1 (star 10 "solid" "pink"))
         (define t2 (star 20 "solid" "magenta"))
         (define t3 (star 30 "solid" "black"))
         (define t4 (star 40 "solid" "red"))
         (define ellipsit (list e1 e2 e3))
         (define tähdet (list t4 t3 t2 t1))
         (define a-lista '(0 1 2 3 4 5 6 7 8 9))
         (define raja-arvo 3)))
      (set! isl (lambda () *bsl))
      *bsl))

@defproc[(map [f (X ... -> Z)] [l (listof X)] ...) (listof Z)]{
 Tekee uuden listan käyttämällä funktiota @racket[f], jokaiseen alkioon joka on listassa @racket[l]
 tai sitä seuraavissa listoissa. 
 @codeblock{(map f (list x-1 ... x-n)) = (list (f x-1) ... (f x-n))}
 @codeblock{(map f (list x-1 ... x-n) (list y-1 ... y-n)) = (list (f x-1 y-1) ... (f x-n y-n))}
 @interaction[#:eval (isl) 
              (map add1 (list 3 -4 1/2))
              (map sub1 (list 3 -4 1/2))
              ellipsit
              (map (lambda (x) (rotate 45 x)) ellipsit)]
}

@defproc[(filter [p? (X -> totuusarvo)] [l (listof X)]) (listof X)]{
Tekee uuden listan niistä listan @racket[l] alkioita, joille pätee predikaatti @racket[p?].
 
 @interaction[#:eval (isl)
              (filter odd? (list 0 1 2 3 4 5 6 7 8 9))
              raja-arvo
              (filter (lambda (x) (>= x raja-arvo)) '(0 1 2 3 4 5 6 7 8 9))
              ]
}

@defproc[(foldr [f (X ... Y -> Y)] [pohja Y] [l (listof X)] ...) Y]{
 Ketjuttaa funktion @racket[f] suorituksen niin, että sille ensin annetaan argumenteiksi
 @racket[pohja] sekä listan @racket[l] viimeinen alkio. Saatu paluuarvo sijoitetaan uudeksi
 @racket[pohja]:ksi jne. Kun lista on käyty läpi palautettaan saatu arvo. @racket[pohja]:n tyypin 
 on oltava sama kuin funktion @racket[f] paluuarvon.
  
 @codeblock{(foldr f pohja (list x-1 ... x-n)) = (f x-1 ... (f x-n pohja))}
 @codeblock{(foldr f pohja (list x-1 ... x-n) (list y-1 ... y-n))
  = (f x-1 y-1 ... (f x-n y-n pohja))}
 @interaction[#:eval (isl)
              (foldr + 0 (list 0 1 2 3 4 5 6 7 8 9))
              ellipsit
              (foldr above empty-image ellipsit)
              (foldr (lambda (r kuva) (overlay (circle r "outline" "black") kuva))
                     empty-image
                     (list 5 10 15 20))]
}
@defproc[(foldl [f (X Y -> Y)] [pohja Y] [l (listof X)]) Y]{
 Ketjuttaa funktion @racket[f] suorituksen niin, että sille ensin annetaan argumenteiksi
 @racket[pohja] sekä listan @racket[l] ensimmäinen alkio. Saatu paluuarvo sijoitetaan uudeksi
 @racket[pohja]:ksi jne. Kun lista on käyty läpi palautettaan saatu arvo. @racket[pohja]:n tyypin 
 on oltava sama kuin funktion @racket[f] paluuarvon.
 
 @codeblock{(foldl f pohja (list x-1 ... x-n)) = (f x-n ... (f x-1 pohja))}
 @codeblock{(foldl f pohja (list x-1 ... x-n) (list x-1 ... x-n))
  = (f x-n y-n ... (f x-1 y-1 pohja))}
 @interaction[#:eval (isl)
              (foldl - 100 (list 0 1 2 3 4 5 6 7 8 9))
              tähdet
              (foldl overlay empty-image tähdet)
              ]
}

@defproc[(build-list [n luonnollinen-luku] [f (luonnollinen-luku -> X)]) (listof X)]{
 Tekee listan käyttämällä funktiota @racket[f] lukuihin välillä @racket[0] ja @racket[(- n 1)].
 @codeblock{(build-list n f) = (list (f 0) ... (f (- n 1)))}
 @interaction[#:eval (isl)
              (build-list 22 add1)
              i
              (build-list 3 (lambda (j) (+ j i)))
              (build-list 10 (lambda (r)(star (+ 5 r)  "outline" "blue")))]
}

  @defproc[(andmap [p? (X ... -> boolean)] [l (listof X) ...]) totuusarvo]{
    Tutkii onko predikaatin @racket[p?] arvo tosi kaikille listan @racket[l] alkioille.
    @codeblock{(andmap p (list x-1 ... x-n)) = (and (p x-1) ... (p x-n))}
    @codeblock{(andmap p (list x-1 ... x-n) (list y-1 ... y-n)) = (and (p x-1 y-1) ... (p x-n y-n))}
    @interaction[#:eval (isl)
		  (andmap odd? '(1 3 5 7 9))
                  (andmap positive? (list 2 3 -2 1 0))
		  raja-arvo 
		  (andmap (lambda (x) (< x raja-arvo)) (list 0 1 2))]
    }

    @defproc[(ormap [p? (X -> boolean)] [l (listof X)]) totuusarvo]{
    Tutkii onko predikaatin @racket[p?] arvo tosi vähintään yhdelle listan @racket[l] alkiolle.
    @codeblock{(ormap p (list x-1 ... x-n)) = (or (p x-1) ... (p x-n))}
    @codeblock{(ormap p (list x-1 ... x-n) (list y-1 ... y-n)) = (or (p x-1 y-1) ... (p x-n y-n))}
    @interaction[#:eval (isl)
		  (ormap odd? '(1 3 5 7 9))
		  raja-arvo
                  (ormap positive? (list 2 3 -2 1 0))
		  (ormap (lambda (x) (< x raja-arvo)) (list 6 7 8 1 5))]}