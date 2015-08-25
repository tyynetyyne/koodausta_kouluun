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

@title[#:tag "racket_turtl_erimerkkejä_rekursio"]{Racket Turtle esimerkkejä, joissa on käytetty rekursiota}

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
        (define VÄRIT2 (list "red" "blue" "green" "yellow" "purple"))
        
        (define (sivu p l k)
          (list (change-pen-size l) (forward p)(turn-left k)))
        
        (define (levenevä-spiraali2 p l k kerrat)
          (if (<= kerrat 0)
              '()
              (cons (sivu p l k) (levenevä-spiraali2 (+ p 5) (+ l 1) k (sub1 kerrat)))))
        
        (define levenevä-spiraali (list (change-bg-color "black")
                                        (change-color VÄRIT2)
                                        (levenevä-spiraali2 1 1 45 45)))
        (define VÄRIT1 (list "red" "green" "yellow" "purple"))
        
        (define (spiraali k p kerrat)
          (if (< kerrat 0)
              '()
              (append (list (forward p)(turn-left k)) (spiraali k (+ p 2)(sub1 kerrat)))))
        
        (define spiraalikuvio
          (list (change-pen-size 2) 
                (change-bg-color "black") 
                (change-color VÄRIT1)
                (spiraali 91 1 152)))
        (define (lehti koko väri)
          (ellipse (* 8 koko) koko "solid" väri))
        
        (define (lehdet koko väri)
          (overlay (lehti koko väri)
                   (rotate 90 (lehti koko väri))))
        
        (define (tee-kukka koko väri)
          (overlay (circle (/ koko 2) "solid" "white")  
                   (lehdet koko väri)
                   (rotate 45 (lehdet koko väri))))
        
        (define (kukka-spiraali k p kerrat)
          (if (< kerrat 0)
              '()
              (append (list (forward p)(turn-left k)) (kukka-spiraali k (+ p 6)(sub1 kerrat)))))
        
        (define (tee-kukat määrä koko)
          (if (<= määrä 0)
              '()
              (cons (rotate koko (tee-kukka koko (make-color (random 255)
                                                             (random 255)
                                                             (random 255))))
                    (tee-kukat (sub1 määrä)(add1 koko)))))
        
        (define kukkaspiraali (list (stamper-on (tee-kukat 20 1))
                                    (pen-up)
                                    (kukka-spiraali 25 1 20)))
        (define (tee-tähdet määrä koko)
          (if (<= määrä 0)
              '()
              (cons (rotate koko (star koko "solid" (make-color (random 255)
                                                                (random 255)
                                                                (random 255))))
                    (tee-tähdet (sub1 määrä)(add1 koko)))))
        
        (define tähtispiraali (list (stamper-on (tee-tähdet 100 1))
                                    (pen-up)
                                    (spiraali 91 1 100)))
        ))
     (set! bsl (lambda () *bsl))
     *bsl))

@section[#:tag "racket_turtle_spiraali"]{Kiertyvä spiraali vaihtuvalla kynän värillä}

Rekursiivisesti rakennettu spiraali, jossa Turtle kulkee kierros kierrokselta pidemmän matkan ja vaihtaa kynän väriä
automaattisesti.

@racketblock[
 (define VÄRIT1 (list "red" "green" "yellow" "purple"))
 
 (define (spiraali k p kerrat)
   (if (< kerrat 0)
       empty
       (append (list (forward p)(turn-left k))
               (spiraali k (+ p 2)(sub1 kerrat)))))
 
 (define spiraalikuvio
   (list (change-pen-size 2) 
         (change-bg-color "black") 
         (change-color VÄRIT1)
         (spiraali 91 1 152)))]

@interaction[#:eval (bsl)
             (draw spiraalikuvio)]

@section[#:tag "racket_turtle_spiraali2"]{Spiraali vaihtuvilla väreillä ja kynän paksuudella}

Rekursiivisesti rakennettu spiraali, jossa Turtle kulkee kierros kierrokselta pidemmän matkan, kynän väri vaihtelee
automaattiseseti ja kynän paksuus kasvaa kierrosten mukana.

@racketblock[
 (define VÄRIT2 (list "red" "blue" "green" "yellow" "purple"))
 
 (define (sivu p l k)
   (list (change-pen-size l)(forward p)(turn-left k)))
 
 (define (levenevä-spiraali2 p l k kerrat)
   (if (<= kerrat 0)
       empty
       (cons (sivu p l k)
             (levenevä-spiraali2 (+ p 5) (+ l 1) k (sub1 kerrat)))))
 
 (define levenevä-spiraali (list (change-bg-color "black")
                                 (change-color VÄRIT2)
                                 (levenevä-spiraali2 1 1 45 45)))]

@interaction[#:eval (bsl)
             (draw levenevä-spiraali)]


@section[#:tag "racket_turtle_kukkaspiraali"]{Spiraali, joka rakentuu eri värisistä ja kokoisista kukista}

Leimasimen avulla toteutettu rekursiivinen kukkaspiraali. Kukkien väri vaihtuu satunnaisesti.

@racketblock[
 (define (lehti koko väri)
   (ellipse (* 8 koko) koko "solid" väri))
 
 (define (lehdet koko väri)
   (overlay (lehti koko väri)
            (rotate 90 (lehti koko väri))))
 
 (define (tee-kukka koko väri)
   (overlay (circle (/ koko 2) "solid" "white")  
            (lehdet koko väri)
            (rotate 45 (lehdet koko väri))))
 
 (define (kukka-spiraali k p kerrat)
   (if (< kerrat 0)
       empty
       (append (list (forward p)(turn-left k))
               (kukka-spiraali k (+ p 6)(sub1 kerrat)))))
 
 (define (tee-kukat määrä koko)
   (if (<= määrä 0)
       empty
       (cons (rotate koko (tee-kukka koko (make-color (random 255)
                                                      (random 255)
                                                      (random 255))))
             (tee-kukat (sub1 määrä)(add1 koko)))))
 
 (define kukkaspiraali (list (stamper-on (tee-kukat 20 1))
                             (pen-up)
                             (kukka-spiraali 25 1 20)))]


@interaction[#:eval (bsl)(draw kukkaspiraali)]

@section[#:tag "racket_turtle_tähtispiraali"]{Spiraali, joka rakentuu eri värisistä ja kokoisista tähdistä}

Leimasimen avulla toteutettu rekursiivinen tähtispiraali. Tähtien väri vaihtuu satunnaisesti.

@racketblock[(define (tee-tähdet määrä koko)
  (if (<= määrä 0)
      empty
      (cons (rotate koko (star koko "solid" (make-color (random 255)
                                                        (random 255)
                                                        (random 255))))
            (tee-tähdet (sub1 määrä)(add1 koko)))))
                            
(define tähtispiraali (list (stamper-on (tee-tähdet 100 1))
                            (pen-up)
                            (spiraali 91 1 100)))]

@interaction[#:eval (bsl)(draw tähtispiraali)]