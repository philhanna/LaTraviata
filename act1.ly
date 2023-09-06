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
  right-margin = 2\cm
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

options = {
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #2
}

bassVoice = \relative c' {
  \options
  \clef bass
  \dynamicUp
  \key a \major
  \time 4/4
  \tempo "Allegro brilliantissimo e molto vivace" 4=132
  
  R1*3			| %1-3
  R1 \fermata		| %4
  R1*24			| %5-28
  R1 \fermata		| %29
  \break
  R1*4 ^\markup
  \small \italic
  \column {
    "Dell'invto trascorsa è già l'ora."
    "Voi tardaste."
  } | %30-33
  r4 r8 b b4 b8 b	| %34
  cis8 b r4 b8 r e r	| %35
  dis8 r cis8. cis16 b8 r a8. a16 | %36
  gis4 r4 r2 | %37
  R1 * 12	| %38-49
  \new CueVoice \relative c' {
    \cueClef "treble"
    e2. \trill ( cis'8-. ) b-.
    a8-. r cis-. fis-. e-. r <a, a'>4->
    \slurDown
    gis'8-. e-. \acciaccatura { gis8 } fis4->
    e8 cis \acciaccatura { e8 } d8-. b-. |
    \cueClefUnset
  }
  r2 gis4-> r8. gis16
}

verse = \lyricmode {
  Gio cam -- mo da Flo -- ra,
  e gio -- can -- do quel -- l'o -- re vo -- lar.
  
  Sì, la vi -- ta s'ad -- dop -- pia al gio -- ir.
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Printed score
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new Staff \with {
    instrumentName = "Bass"
  } {
    \bassVoice
  }
  \addlyrics { \verse }
  \layout {
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Midi score
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\score {
  \new Staff \with {
    instrumentName = "Bass"
  } {
    \bassVoice
  }
  \midi {
  }
}
