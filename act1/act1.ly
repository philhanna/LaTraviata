\version "2.22.1"

#(ly:set-option 'midi-extension "mid")

\header {
  title = "La Traviata"
  subtitle = "Act I"
  subsubtitle = "(Bass Chorus Score)"
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

\include "b01Giocammo.ly"
\include "b02SiLaVita.ly"

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

  R1*29				| %1-29
  \break
  \giocammo			| %30-37
  \break
  
  R1*12
  \break 
  \siLaVita
  \break
  
  R1*20					| %58-77
  \break
  
  <<
    \new CueVoice \relative c'' {
      r2
      \cueClef "treble"
      a4.
      ^\markup \small \italic
      "Violetta: Pronto e il tutto?"
      a8 a4 d,4 r \fermata r8.
      
      d'16
      ^\markup \small \italic
      "Miei cari, sedete;"
      d2 cis4. b8 ais4 fis r2
      
      
      
      \cueClefUnset
    }
    \context Voice \relative c' {
    }
  >>

}

bassLyrics = \lyricmode {
  \override LyricText.font-size = #0
  \giocammoLyrics
  \silavitaLyrics
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
      \Score
      \remove "Bar_number_engraver"
    }
  }
}
