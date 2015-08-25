;#lang scribble/base
#lang scribble/manual

@(require scriblib/figure)
@(require 2htdp/image)
@(require (for-label fin-doc/fi-beginner))
@(require (for-label fin-doc/fi-image))
@(require scribble/core
           scribble/html-properties)
@(require scribble/pdf-render)

@title[#:tag "kasikirja" #:style 'toc]{Koodarin käsikirja}

Tämä käsikirja on tarkoitettu käytettäväksi ohjelmoinnin opetuksessa hakuteoksena.
Se käsittää kaikki osa-alueet, joita Koodausta kouluun oppilaan tehtävissä tarvitaan ja
oppilaan tehtävistä on linkitys vastaaviin kohtiin käsikirjassa.

Opettele käyttämään käsikirjaa heti alkuun, kukaan ei voi muistaa kaikkia ohjelmointikielen
komentoja ulkoa!

Käsikirja sisältää osiot:

@tabular[(list (list @local-table-of-contents[#:style 'immediate-only ]
                     @centered[@image["kasikirja.png" #:scale 0.4]]))]

@; ------------------------------------------------------------------------
@include-section["aloita_tasta/aloita.scrbl"]
@include-section["fin_doc/racket_bsl.scrbl"]
@include-section["fin_doc/2htdp_image.scrbl"]
@include-section["racket_turtle/racket_turtle.scrbl"]
@include-section["sanasto/koodausta_kouluun_sanasto.scrbl"]


@verbatim{-------------------------------------------------------------------------------}

@bold{Tulossa ovat:}

@itemlist[@item{Animaatiot - 2htdp/universe}
          @item{Pelit - Peruspeli}]
@index-section[]
