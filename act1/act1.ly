\version "2.22.1"

#(ly:set-option 'midi-extension "mid")

\header {
  title = "La Traviata"
  subtitle = "(Bass Chorus Score)"
  composer = "G. Verdi"
  poet = "Engraving by Phil Hanna"
}

\paper {
  #(set-paper-size "letter")
  top-margin = 1\cm
  left-margin = 2\cm
  right-margin = 1\cm
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  system-system-spacing.basic-distance = #10
  score-system-spacing =
  #'((basic-distance . 10)
     (minimum-distance . 10)
     (padding . 1)
     (stretchability . 10))
  %system-separator-markup = \slashSeparator
  print-page-number = ##f
}

globals = {
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #2
}

bassVoice = \relative c' {
  \globals
  \clef bass
  \key a \major
  \time 4/4
  \tempo "Allegro brilliantissimo e molto vivace" 4=132

  R1*29					| %1-29
  \break
  
  <<
    \new CueVoice \relative c'' {
      \cueClef "treble"
      b2. \trill ( gis'8-. ) fis-.	| %30
      e8-. r gis-. cis-. b8-. r <e, e'>4->	| %31
      dis'8-. b-. \acciaccatura { dis8 } cis4->
      b8-. d-. \acciaccatura { b8 } a4->	| %32
      gis8-. e-. fis-. b,-. e8-. r r4	| %33
      \cueClefUnset
    }
    \context Voice {
      s1*4				| %30-33
    }
  >>
  \break
  r4 r8 b b4 b8 b			| %34
  cis8 b r4 b8 r e r			| %35
  dis8 r cis8. cis16 b8 r a8. a16	| %36
  gis4 r4 r2 				| %37
  R1 * 12				| %38-49
  \break
  <<
    \new CueVoice \relative c' {
      \cueClef "treble"
      e2. \trill ( cis'8-. ) b-.		| %50
      a8-. r cis-. fis-. e-. r <a, a'>4->| %51
      gis'8-. e-.
      \acciaccatura { gis8 } fis4->
      e8 cis
      \acciaccatura { e8 } d8-. b-.	| %52
      \cueClefUnset
    }
    \context Voice \relative c' {
      s1*3				| %50-52
      \clef bass
    }
  >>
  \break
  r2 gis4-> r8. gis16			| %53
  fis4 d8. d16 b4 e8-. e-.		| %54
  a,4 r gis' r8. gis16			| %55
  \break fis4 d8. d16 b4 e8-. e-.		| %56
  a,4 r r2				| %57
  
  R1*20					| %58-77
  
  <<
    \new CueVoice = "pronto" \relative c'' {
      \cueClef "treble"
      r2 a4. ^\markup \small \italic "Pronto e il tutto?" a8
      a4 d,4 r \fermata r8. d'16
      \cueClefUnset
    }
    \context Voice \relative c' {
    }
  >>

}

bassLyrics = \lyricmode {
  \override LyricText.font-size = #-1
  Gio cam -- mo da Flo -- ra,
  e gio -- can -- do quel -- l'o -- re vo -- lar.

  Sì, la vi -- ta s'ad -- dop -- pia__al gio -- ir.
  Sì, la vi -- ta s'ad -- dop -- pia__al gio -- ir.
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Printed score
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  <<
    \new Staff = "main" {
      \new Voice = "bassVoice" {
        \bassVoice
      }
    }
    \new Lyrics = "bassVoice"
    \context Lyrics = "bassVoice" {
      \lyricsto "bassVoice" {
        \bassLyrics
      }
    }
  >>
  \layout {
    indent = 0
    \context {
      \Staff
      %\RemoveAllEmptyStaves
    }
  }
}
