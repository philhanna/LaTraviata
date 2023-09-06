\version "2.22.1"

#(ly:set-option 'midi-extension "mid")

\header {
  title = "La Traviata"
  subtitle = "(Bass Chorus Score)"
  composer = "G. Verdi"
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
  \set Staff.restNumberThreshold = #2
}

bassVoice = \relative c {
  \options
  \clef bass
  \dynamicUp
  %
  % Preludio
  %
  \key e \major
  \time 4/4
  \tempo Adagio 4=66
  \cueClef "treble"
  
  \cueClefUnset
  R1*15
  R1 \fermata
}

verse = \lyricmode {
  Giocammo da Flora,
  e giocando quell'ore volar.
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
  \layout { }
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
