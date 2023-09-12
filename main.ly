\version "2.22.1"

#(ly:set-option 'midi-extension "mid")

\header {
  title = "La Traviata"
  subtitle = "Bass chorus in Ricordi"
  composer = "G. Verdi"
  poet = \markup \center-column {
    \line {Engraving by Phil Hanna}
    \vspace #1
    \line { }
  }
}

\paper {
  #(set-paper-size "letter")
  top-margin = 1\cm
  left-margin = 2\cm
  right-margin = 1\cm
  ragged-bottom = ##t
  ragged-last-bottom = ##t
  system-system-spacing.basic-distance = #16
  score-system-spacing =
  #'((basic-distance . 10)
     (minimum-distance . 10)
     (padding . 1)
     (stretchability . 10))
  %system-separator-markup = \slashSeparator
  print-page-number = ##t  
  
}

globals = {
  \compressEmptyMeasures
  \override MultiMeasureRest.expand-limit = #2
  \override Score.MetronomeMark.padding = #3
  \set Score.markFormatter = #format-mark-box-numbers
  \override Score.RehearsalMark.font-size = #3 
  \override Beam.breakable = ##t
}

morebars = {
  s1 ^\markup {
    \fontsize #3 \bold {...}
  }

}

\include "prelude.lyi"

\markup {
  \fill-line {
    \center-column {
      \line { \fontsize #4 \bold "Act I" }
      \vspace #1
      \line { }
    }
  }
}

\include "introduzione1.lyi"
\include "introduzione2.lyi"
\include "introduzione3.lyi"
\include "introduzione4.lyi"
\include "introduzione5.lyi"
