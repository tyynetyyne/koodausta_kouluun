;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label lang/htdp-beginner))
@(require (for-label (except-in 2htdp/image image?)))
@(require scribble/core
           scribble/html-properties)

@title[#:tag "käsikirja" #:style 'toc]{Koodausta kouluun: Käsikirja}

@author["Tiina Partanen"]

Tämä käsikirja on tarkoitettu käytettäväksi ohjelmoinnin opetuksessa hakuteoksena.
Se käsittää kaikki osa-alueet, joita Koodausta kouluun oppilaan tehtävissä tarvitaan ja
oppilaan tehtävistä on linkitys vastaaviin kohtiin käsikirjassa.

Opettele käyttämään käsikirjaa heti alkuun, kukaan ei voi muistaa kaikkia ohjelmointikielen
komentoja ulkoa!

Käsikirja sisältää osiot:

@local-table-of-contents[#:style 'immediate-only ]

@; ------------------------------------------------------------------------
@include-section["koodausta_kouluun_aloita_tasta.scrbl"]

@verbatim{-------------------------------------------------------------------------------}

@bold{Tulossa ovat:}

@itemlist[@item{Racket BSL (Beginning Student Language)}
          @item{2htdp/image}
          @item{Racket Turtle}
          @item{Peruspeli}
          @item{2htdp/universe}
          @item{Sanasto}]

@index-section[]
