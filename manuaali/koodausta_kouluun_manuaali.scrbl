;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label lang/htdp-beginner))
@(require (for-label (except-in 2htdp/image image?)))
@(require scribble/core
           scribble/html-properties)

@title[#:tag "kasikirja" #:style 'toc]{Koodausta kouluun: Käsikirja}

@author["Tiina Partanen"]

Tämä käsikirja on tarkoitettu käytettäväksi ohjelmoinnin opetuksessa hakuteoksena.
Se käsittää kaikki osa-alueet, joita Koodausta kouluun oppilaan tehtävissä tarvitaan ja
oppilaan tehtävistä on linkitys vastaaviin kohtiin käsikirjassa.

Opettele käyttämään käsikirjaa heti alkuun, kukaan ei voi muistaa kaikkia ohjelmointikielen
komentoja ulkoa!

Käsikirja sisältää osiot:

@local-table-of-contents[#:style 'immediate-only ]

@; ------------------------------------------------------------------------
@include-section["aloita_tasta/aloita.scrbl"]
@include-section["fin_doc/racket_bsl.scrbl"]

@verbatim{-------------------------------------------------------------------------------}

@bold{Tulossa ovat:}

@itemlist[@item{2htdp/image}
          @item{Racket Turtle}
          @item{Peruspeli}
          @item{2htdp/universe}
          @item{Sanasto}]

@index-section[]
